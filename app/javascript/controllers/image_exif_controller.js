import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="image-exif"
export default class extends Controller {
  static targets = ["panel", "button"]

  connect() {
    // Start with panel hidden
    this.panelTarget.classList.add("hidden")
  }

  toggle() {
    this.panelTarget.classList.toggle("hidden")

    // Update button text
    if (this.panelTarget.classList.contains("hidden")) {
      this.buttonTarget.textContent = "ℹ️ Show EXIF Data"
    } else {
      this.buttonTarget.textContent = "ℹ️ Hide EXIF Data"
    }
  }
}
