import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["input", "list", "hiddenIds", "dropdown"]
    static values = { url: String, min: { type: Number, default: 3 }, mushroomId: Number, kind: String, genusId: Number }

    connect() {
        this._debounced = this._debounce(this.search.bind(this), 300)
    }

    onInput() {
        const q = this.inputTarget.value.trim()
        if (q.length < this.minValue) {
            this.closeDropdown()
            return
        }
        this._debounced(q)
    }

    async search(q) {
        const params = new URLSearchParams({ q })
        if (this.kindValue === "species" && this.genusIdValue) params.set("genus_id", this.genusIdValue)
        const res = await fetch(`${this.urlValue}?${params}`)
        if (!res.ok) return
        const items = await res.json()
        this.renderDropdown(items)
    }

    renderDropdown(items) {
        if (!this.hasDropdownTarget) return
        this.dropdownTarget.innerHTML = ""
        items.forEach(item => {
            const li = document.createElement("li")
            li.className = "px-2 py-1 hover:bg-gray-100 cursor-pointer"
            li.textContent = item.label
            li.dataset.id = item.id
            li.addEventListener("click", () => this.addToken(item))
            this.dropdownTarget.appendChild(li)
        })
        this.dropdownTarget.classList.remove("hidden")
    }

    closeDropdown() {
        if (this.hasDropdownTarget) this.dropdownTarget.classList.add("hidden")
    }

    async addToken(item) {
        // Avoid duplicates in UI
        const currentIds = new Set((this.hiddenIdsTarget.value || "").split(",").filter(Boolean))
        if (currentIds.has(String(item.id))) {
            this.inputTarget.value = ""
            this.closeDropdown()
            return
        }

        // Persist via POST to join controller
        let endpoint, body
        if (this.kindValue === "genera") {
            endpoint = "/genus_mushrooms"
            body = { mushroom_id: this.mushroomIdValue, genus_id: item.id }
        } else {
            endpoint = "/mushroom_species"
            body = { mushroom_id: this.mushroomIdValue, species_id: item.id }
        }

        const res = await fetch(endpoint, {
            method: "POST",
            headers: { "Content-Type": "application/json", "Accept": "application/json" },
            body: JSON.stringify(body)
        })

        if (!res.ok && res.status !== 303) return

        // Update UI tokens
        currentIds.add(String(item.id))
        this.hiddenIdsTarget.value = Array.from(currentIds).join(",")
        const chip = document.createElement("span")
        chip.className = "inline-flex items-center bg-gray-200 rounded px-2 py-0.5 text-sm mr-1 mb-1"
        chip.textContent = item.label
        const btn = document.createElement("button")
        btn.type = "button"
        btn.className = "ml-1 text-gray-600 hover:text-red-600"
        btn.textContent = "×"
        btn.addEventListener("click", () => this.removeToken(item, chip))
        chip.appendChild(btn)
        this.listTarget.appendChild(chip)

        this.inputTarget.value = ""
        this.closeDropdown()
    }

    async removeToken(item, chipEl) {
        // Find join id not known in client; fallback: call DELETE by composite is not RESTful.
        // Simpler approach: embed data-remove-url on chip when server renders. For now, try DELETE via lookup endpoint not available; so do POST with DELETE pattern:
        // We will render server-side chips with proper remove URLs. This client-side removal will just update hidden input if chip has no URL.

        const currentIds = new Set((this.hiddenIdsTarget.value || "").split(",").filter(Boolean))
        currentIds.delete(String(item.id))
        this.hiddenIdsTarget.value = Array.from(currentIds).join(",")
        if (chipEl && chipEl.remove) chipEl.remove()
    }

    _debounce(fn, ms) {
        let t
        return (...args) => {
            clearTimeout(t)
            t = setTimeout(() => fn(...args), ms)
        }
    }
}