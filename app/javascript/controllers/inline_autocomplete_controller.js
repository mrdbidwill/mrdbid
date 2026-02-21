import { Controller } from "@hotwired/stimulus"

// Inline Autocomplete Controller for textarea fields
// Provides genus/species name suggestions while typing
// Inserts selected text at cursor position

export default class extends Controller {
  static targets = ["textarea", "dropdown"]
  static values = {
    genusUrl: String,
    speciesUrl: String,
    min: { type: Number, default: 4 }
  }

  connect() {
    this.debounceTimer = null
    this.currentWord = ""
    this.cursorPosition = 0
    this.wordStart = 0
  }

  onInput(event) {
    clearTimeout(this.debounceTimer)

    const textarea = this.textareaTarget
    this.cursorPosition = textarea.selectionStart
    const text = textarea.value

    // Get word at cursor
    const wordInfo = this.getWordAtCursor(text, this.cursorPosition)
    this.currentWord = wordInfo.word
    this.wordStart = wordInfo.start

    // Check if word starts with uppercase (genus) and meets minimum length
    if (this.currentWord.length >= this.minValue && /^[A-Z]/.test(this.currentWord)) {
      this.debounceTimer = setTimeout(() => {
        this.fetchSuggestions(this.currentWord)
      }, 150)
    } else {
      this.hideDropdown()
    }
  }

  getWordAtCursor(text, position) {
    // Find word boundaries (letters only, no spaces or punctuation)
    let start = position
    let end = position

    // Move back to start of word
    while (start > 0 && /[a-zA-Z]/.test(text[start - 1])) {
      start--
    }

    // Move forward to end of word
    while (end < text.length && /[a-zA-Z]/.test(text[end])) {
      end++
    }

    return {
      word: text.substring(start, end),
      start: start,
      end: end
    }
  }

  async fetchSuggestions(query) {
    try {
      // Try genus first
      const genusResponse = await fetch(`${this.genusUrlValue}?q=${encodeURIComponent(query)}`, {
        headers: { "Accept": "application/json" }
      })

      if (genusResponse.ok) {
        const genusData = await genusResponse.json()

        // Try species too
        const speciesResponse = await fetch(`${this.speciesUrlValue}?q=${encodeURIComponent(query)}`, {
          headers: { "Accept": "application/json" }
        })

        let speciesData = []
        if (speciesResponse.ok) {
          speciesData = await speciesResponse.json()
        }

        const allResults = [...genusData, ...speciesData]

        if (allResults.length > 0) {
          this.renderDropdown(allResults)
        } else {
          this.hideDropdown()
        }
      }
    } catch (error) {
      console.error("Autocomplete error:", error)
      this.hideDropdown()
    }
  }

  renderDropdown(items) {
    this.dropdownTarget.innerHTML = items
      .map(item => `
        <li class="px-3 py-2 hover:bg-blue-100 cursor-pointer"
            data-action="click->inline-autocomplete#selectItem"
            data-name="${item.name}">
          <em>${item.name}</em>
        </li>
      `).join("")

    this.dropdownTarget.classList.remove("hidden")
  }

  selectItem(event) {
    const selectedName = event.currentTarget.dataset.name
    const textarea = this.textareaTarget
    const text = textarea.value

    // Replace the partial word with the selected name
    const before = text.substring(0, this.wordStart)
    const after = text.substring(this.cursorPosition)

    textarea.value = before + selectedName + after

    // Position cursor after inserted text
    const newPosition = this.wordStart + selectedName.length
    textarea.setSelectionRange(newPosition, newPosition)
    textarea.focus()

    this.hideDropdown()

    // Trigger input event for character count update
    textarea.dispatchEvent(new Event('input', { bubbles: true }))
  }

  hideDropdown() {
    this.dropdownTarget.classList.add("hidden")
    this.dropdownTarget.innerHTML = ""
  }

  onKeydown(event) {
    // Handle keyboard navigation in dropdown
    if (!this.dropdownTarget.classList.contains("hidden")) {
      if (event.key === "Escape") {
        this.hideDropdown()
        event.preventDefault()
      } else if (event.key === "ArrowDown" || event.key === "ArrowUp") {
        // TODO: Add arrow key navigation through dropdown items
        event.preventDefault()
      }
    }
  }
}
