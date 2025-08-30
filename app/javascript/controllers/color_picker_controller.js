import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["colorValue", "selectedColorLabel", "submitButton"]
    static values = { mushroomId: Number }

    selectColor(event) {
        const colorId = event.params.colorId
        this.colorValueTargets.forEach((t) => (t.value = colorId))
        this.selectedColorLabelTarget.textContent = `ID ${colorId}`
        this.submitButtonTargets.forEach((b) => (b.disabled = false))
    }
}