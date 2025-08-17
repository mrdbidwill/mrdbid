import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["stateSelect"];
    static values = { url: String };

    connect() {
        console.log("CountrySelectController connected", this.stateSelectTarget);
    }

    async change(event) {
        const countryId = event.target.value;

        if (!countryId) {
            // Clear the state dropdown and add default option
            this.stateSelectTarget.innerHTML = '<option value="">Select a State</option>';
            return;
        }

        // Fetch states for the selected country
        try {
            const response = await fetch(`${this.urlValue}?country_id=${countryId}`);
            const html = await response.text();

            // Update the state dropdown with prompt + fetched options
            this.stateSelectTarget.innerHTML = '<option value="">Select a State</option>' + html;
        } catch (error) {
            console.error("Error fetching states:", error);
            this.stateSelectTarget.innerHTML = '<option value="">Error loading states</option>';
        }
    }
}
