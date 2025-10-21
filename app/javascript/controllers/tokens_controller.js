import { Controller } from "@hotwired/stimulus"

// Usage: Attach data-controller="tokens" and appropriate data attributes.
// Requirements: An autocomplete endpoint that returns [{id, name}] in JSON.

export default class extends Controller {
    static targets = [
        "input", "dropdown", "list", "hiddenIds", "loader"
    ]
    static values = {
        url: String,
        min: { type: Number, default: 3 },
        mushroomId: String,
        kind: String
    }

    connect() {
        this.selected = new Map()
        this.debounceTimer = null
        this.inputTarget.addEventListener("input", this.onInput.bind(this))
        this.inputTarget.addEventListener("focus", this.onInput.bind(this))
        this.listTarget.querySelectorAll("[data-token-id]").forEach(el => {
            this.selected.set(el.dataset.tokenId, el.textContent.trim())
        })
        this.dropdownTarget.addEventListener("click", this.onDropdownClick.bind(this))
    }

    onInput() {
        clearTimeout(this.debounceTimer)
        let query = this.inputTarget.value.trim()

        // Show immediate feedback
        if(query.length > 0 && query.length < (parseInt(this.inputTarget.getAttribute("minlength")) || 3)) {
            this.dropdownTarget.innerHTML = `<li class='px-3 py-2 text-sm text-gray-400'>Type ${(parseInt(this.inputTarget.getAttribute("minlength")) || 3) - query.length} more character(s)...</li>`
            this.dropdownTarget.classList.remove("hidden")
            return
        }

        if(query.length < (parseInt(this.inputTarget.getAttribute("minlength")) || 3)) {
            this.hideDropdown()
            return
        }

        // Show loading immediately before debounce
        this.showLoader()
        this.debounceTimer = setTimeout(() => {
            this.autocomplete(query)
        }, 150)
    }

    autocomplete(query) {
        this.showLoader()
        const url = new URL(this.urlValue, window.location.origin)
        url.searchParams.append("q", query)

        // For species autocomplete, pass mushroom_id to filter by selected genera
        if(this.kindValue === "species" && this.hasMushroomIdValue) {
            url.searchParams.append("mushroom_id", this.mushroomIdValue)
        }

        fetch(url, { headers: {"Accept": "application/json"} })
            .then(r => r.json())
            .then(items => {
                this.renderDropdown(items)
            })
            .catch(_err => this.hideDropdown())
            .finally(() => this.hideLoader())
    }

    renderDropdown(items) {
        if(!items.length) {
            this.dropdownTarget.innerHTML = "<li class='px-3 py-2 text-sm text-gray-400'>No results</li>"
            this.dropdownTarget.classList.remove("hidden")
            return
        }
        this.dropdownTarget.innerHTML = items
            .map(item =>
                `<li class="hover:bg-blue-100 cursor-pointer px-3 py-2"
             data-id="${item.id}"
             data-label="${item.name}">
          ${item.name}
        </li>`
            ).join("")
        this.dropdownTarget.classList.remove("hidden")
    }

    hideDropdown() {
        this.dropdownTarget.classList.add("hidden")
        this.dropdownTarget.innerHTML = ""
    }

    showLoader() {
        if(this.hasLoaderTarget) this.loaderTarget.classList.remove("hidden")
    }
    hideLoader() {
        if(this.hasLoaderTarget) this.loaderTarget.classList.add("hidden")
    }

    onDropdownClick(e) {
        const li = e.target.closest("li[data-id]")
        if(!li) return
        const id = li.dataset.id
        const label = li.dataset.label
        if(this.selected.has(id)) {
            this.hideDropdown()
            this.inputTarget.value = ""
            return
        }
        this.createToken({id, label})
        this.hideDropdown()
        this.inputTarget.value = ""
        this.inputTarget.focus()
        // Save via AJAX
        this.saveToken(id, label)
    }

    createToken({id, label}) {
        if(this.selected.has(id)) return
        this.selected.set(id, label)
        // Create pill
        const pill = document.createElement("span")
        pill.className = "inline-flex items-center bg-gray-200 rounded px-2 py-0.5 text-sm mr-1 mb-1"
        pill.setAttribute("data-token-id", id)
        pill.innerHTML = `
      ${label}
      <button type="button" class="ml-1 text-gray-600 hover:text-red-600" aria-label="Remove" data-action="tokens#removeToken" data-id="${id}">&times;</button>
    `
        this.listTarget.appendChild(pill)
        this.updateHiddenIds()
    }

    removeToken(e) {
        const id = e.target.dataset.id
        this.selected.delete(id)
        const pill = this.listTarget.querySelector(`[data-token-id="${id}"]`)
        if(pill) pill.remove()
        this.updateHiddenIds()
        // Remove via AJAX
        this.deleteToken(id)
    }

    updateHiddenIds() {
        if(this.hasHiddenIdsTarget) {
            this.hiddenIdsTarget.value = Array.from(this.selected.keys()).join(",")
        }
    }

    // AJAX save for genus, species, tree, or plant association
    saveToken(id, label) {
        const kind = this.kindValue
        const mushroomId = this.mushroomIdValue
        if(!kind || !mushroomId) return
        let route, body
        if(kind=="genera") {
            route = `/genus_mushrooms.json`
            body = JSON.stringify({genus_mushroom: {mushroom_id: mushroomId, genus_id: id}})
        } else if (kind=="species") {
            route = `/mushroom_species.json`
            body = JSON.stringify({mushroom_species: {mushroom_id: mushroomId, species_id: id}})
        } else if (kind=="trees") {
            route = `/mushroom_trees.json`
            body = JSON.stringify({mushroom_tree: {mushroom_id: mushroomId, tree_id: id}})
        } else if (kind=="plants") {
            route = `/mushroom_plants.json`
            body = JSON.stringify({mushroom_plant: {mushroom_id: mushroomId, plant_id: id}})
        } else {
            return
        }
        fetch(route, {
            method: "POST",
            headers: { "Content-Type": "application/json", "Accept": "application/json", "X-CSRF-Token": this.csrfToken() },
            body: body
        }).then(resp => {
            if(!resp.ok) {
                return resp.json().then(data => {
                    throw new Error(data.errors ? data.errors.join(", ") : "Save failed")
                })
            }
            // Optionally: visual feedback
        }).catch(err => {
            // Remove pill if failed
            this.removePillById(id)
            alert(err.message || "Failed to add. Please try again.")
        })
    }

    deleteToken(id) {
        const kind = this.kindValue
        const mushroomId = this.mushroomIdValue
        if(!kind || !mushroomId) return
        let route
        if(kind=="genera") {
            route = `/genus_mushrooms/destroy_by_relation.json?mushroom_id=${mushroomId}&genus_id=${id}`
        } else if (kind=="species") {
            route = `/mushroom_species/destroy_by_relation.json?mushroom_id=${mushroomId}&species_id=${id}`
        } else if (kind=="trees") {
            route = `/mushroom_trees/destroy_by_relation.json?mushroom_id=${mushroomId}&tree_id=${id}`
        } else if (kind=="plants") {
            route = `/mushroom_plants/destroy_by_relation.json?mushroom_id=${mushroomId}&plant_id=${id}`
        } else {
            return
        }
        fetch(route, {
            method: "DELETE",
            headers: {"Accept": "application/json", "X-CSRF-Token": this.csrfToken()}
        }).then(resp => {
            if(!resp.ok) throw new Error("Delete failed")
            // Optionally: visual feedback
        }).catch(_err => {
            alert("Failed to remove. Please try again.")
            // Could re-add pill if needed
        })
    }

    removePillById(id) {
        const pill = this.listTarget.querySelector(`[data-token-id="${id}"]`)
        if(pill) pill.remove()
        this.selected.delete(id)
        this.updateHiddenIds()
    }

    csrfToken() {
        const meta = document.querySelector('meta[name=csrf-token]')
        return meta && meta.content
    }
}
