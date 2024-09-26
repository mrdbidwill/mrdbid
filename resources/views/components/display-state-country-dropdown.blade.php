@props([
    /** @var \Illuminate\Database\Eloquent\Collection */
    'countries',
])
@php // dd($countries); @endphp
<script type="text/javascript">
    // JavaScript to handle the state loading
    document.addEventListener('DOMContentLoaded', function () {   // DOM Content Loaded Event:  The script waits until the DOM content is fully loaded before executing
        const countryElement = document.getElementById('country');  //Element References: It gets the references to the dropdown elements for countries (countryElement) and states (stateElement).
        const stateElement = document.getElementById('state');

        function loadStates(countryCode) {   // Load States Function: This function fetches the states for a given country code via an API call. This populates the states dropdown based on the selected country.
            if (!countryCode) {
                stateElement.innerHTML = '<option value="" disabled selected>Please select a country first</option>';
                return;
            }

            fetch(`/api/states/${countryCode}`)
                .then(response => response.json())
                .then(states => {
                    stateElement.innerHTML = '<option value="" disabled selected>Please select a state</option>';
                    states.forEach(state => {
                        const option = document.createElement('option');
                        option.value = state.code;
                        option.textContent = state.name;
                        stateElement.appendChild(option);
                    });
                });
        }

        countryElement.addEventListener('change', function () {  //Event Listener for Country Change: Adds an event listener to the country dropdown. When the country changes, it calls the loadStates function with the selected country code.
            loadStates(this.value);
        });

        // Check if a country is selected on page load and load the states
        const initialCountryCode = countryElement.value;  // Initial Load of States: Checks if a country is already selected when the page loads and immediately loads the states for that country.
        if (initialCountryCode) {
            loadStates(initialCountryCode);
        }
    });
</script>

<div class="sm:col-span-4">
    <label for="country"
           class="block text-sm font-medium leading-6 text-gray-900">Country</label>
    <div class="mt-2">
        <div
            class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
            <select id="country" name="country">
                <option value="" disabled selected>Please select a country</option>
                @foreach ($countries as $country)
                    @unless($country->name === 'default_name')
                        <option value="{{ $country->code }}">{{ $country->name }}</option>
                    @endunless
                @endforeach
            </select>
        </div>

        @error('country')
        <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
        @enderror
    </div>
</div>

<div class="sm:col-span-4">
    <label for="state"
           class="block text-sm font-medium leading-6 text-gray-900">State</label>
    <div class="mt-2">
        <div
            class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
            <select id="state" name="state">
                <option value="" disabled selected>Please select a state</option>
                <!-- Options will be dynamically loaded based on selected country -->
            </select>
        </div>

        @error('state')
        <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
        @enderror
    </div>
</div>
