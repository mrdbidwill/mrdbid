import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="lookup"
export default class extends Controller {
  static targets = ["lookupType"];

  updateParts(event) {
    const lookupTypeId = event.target.value; // Get the selected lookup_type_id
    const url = new URL(window.location.href);

    if (lookupTypeId) {
      url.searchParams.set("lookup_type_id", lookupTypeId); // Dynamically update the URL
    } else {
      url.searchParams.delete("lookup_type_id"); // Remove the parameter if empty
    }

    url.searchParams.delete("part_id"); // Reset parts when lookup_type changes
    Turbo.visit(url, { action: "replace" }); // Fetch updated parts with Turbo
  }
}

