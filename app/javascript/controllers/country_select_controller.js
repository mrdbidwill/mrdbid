import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["countrySelect", "stateSelect"]
  static values = { url: String }

  connect() {
    // If a country is already selected (edit form, or prefill), populate states immediately.
    if (this.countrySelectTarget?.value) {
      this.change()
    } else {
      this.disableStates("Select a country first")
    }
  }

  async change() {
    const countryId = this.countrySelectTarget.value
    if (!countryId) {
      this.disableStates("Select a country first")
      return
    }

    try {
      this.stateSelectTarget.disabled = true
      this.setOptions([["", "Loading states…"]])

      const response = await fetch(`${this.urlValue}?country_id=${encodeURIComponent(countryId)}`, {
        headers: { "Accept": "application/json" }
      })
      if (!response.ok) throw new Error("Failed to load states")

      const states = await response.json() // Expect [{id, name}, ...]
      if (!Array.isArray(states) || states.length === 0) {
        this.setOptions([["", "No states available"]])
        this.stateSelectTarget.disabled = true
        return
      }

      const options = [["", "Select a State"], ...states.map(s => [String(s.id), s.name])]
      const current = this.stateSelectTarget.getAttribute("data-current")
      this.setOptions(options, current)
      this.stateSelectTarget.disabled = false
    } catch (e) {
      this.setOptions([["", "Could not load states"]])
      this.stateSelectTarget.disabled = true
      // Optionally log error
    }
  }

  disableStates(placeholderText) {
    this.setOptions([[ "", placeholderText ]])
    this.stateSelectTarget.disabled = true
  }

  setOptions(pairs, selectedValue = null) {
    this.stateSelectTarget.innerHTML = ""
    for (const [value, label] of pairs) {
      const opt = document.createElement("option")
      opt.value = value
      opt.textContent = label
      if (selectedValue && value === selectedValue) opt.selected = true
      this.stateSelectTarget.appendChild(opt)
    }
  }
}
