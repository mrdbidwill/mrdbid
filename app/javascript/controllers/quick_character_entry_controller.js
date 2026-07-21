import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["search", "menu", "option", "empty"]

  connect() {
    this.boundClose = this.closeOnOutsideClick.bind(this)
    document.addEventListener("click", this.boundClose)
  }

  disconnect() {
    document.removeEventListener("click", this.boundClose)
  }

  search() {
    const query = this.searchTarget.value.trim().toLowerCase()

    if (query.length < 2) {
      this.hideMenu()
      return
    }

    let shown = 0
    this.optionTargets.forEach((option) => {
      const matches = option.dataset.searchText?.toLowerCase().includes(query)
      if (matches && shown < 20) {
        option.classList.remove("hidden")
        shown += 1
      } else {
        option.classList.add("hidden")
      }
    })

    this.emptyTarget.classList.toggle("hidden", shown !== 0)
    this.menuTarget.classList.remove("hidden")
  }

  navigate(event) {
    if (event.key !== "Enter") return

    const firstMatch = this.optionTargets.find((option) => !option.classList.contains("hidden"))
    if (!firstMatch) return

    event.preventDefault()
    window.location.href = firstMatch.href
  }

  closeOnOutsideClick(event) {
    if (!this.element.contains(event.target)) {
      this.hideMenu()
    }
  }

  hideMenu() {
    this.menuTarget.classList.add("hidden")
  }
}
