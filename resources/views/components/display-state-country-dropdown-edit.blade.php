@props(['countries', 'selectedCountry' => null, 'selectedState' => null])

<div>
    Country: {{ $selectedCountry }}
    <label for="country">Country</label> <select name="country" id="country_{{ $selectedCountry }}"
                                                 class="form-control country-dropdown"
                                                 data-state-select-id="state_{{ $selectedCountry }}" required>
        <option value="" disabled>Select your country</option>
        @foreach($countries as $country)
            <option value="{{ $country->id }}" {{ $selectedCountry == $country->id ? 'selected' : '' }}>
                {{ $country->name }}
            </option>
        @endforeach
    </select>

    State: {{ $selectedState }}
    <label for="state">State</label> <select name="state" id="state_{{ $selectedState }}" class="form-control" required>
        <option value="" disabled>Select your state</option>
        <!-- States will be populated by JavaScript based on the selected country -->
    </select>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const countrySelects = document.querySelectorAll('.country-dropdown');

        countrySelects.forEach(countrySelect => {
            const stateSelectId = countrySelect.getAttribute('data-state-select-id');
            const stateSelect = document.getElementById(stateSelectId);
            const selectedState = stateSelect.getAttribute('id').split('_')[1];

            function updateStates() {
                const countryId = countrySelect.value;
                if (countryId) {
                    fetch(`/get-states/${countryId}`)
                        .then(response => response.json())
                        .then(data => {
                            stateSelect.innerHTML = '<option value="" disabled>Select your state</option>';
                            data.forEach(state => {
                                const option = document.createElement('option');
                                option.value = state.id;
                                option.text = state.name;
                                if (state.id === selectedState) {
                                    option.selected = true;
                                }
                                stateSelect.appendChild(option);
                            });
                        });
                } else {
                    stateSelect.innerHTML = '<option value="" disabled>Select your state</option>';
                }
            }

            if (stateSelect) {
                countrySelect.addEventListener('change', updateStates);

                if (countrySelect.value) {
                    updateStates();
                }
            }
        });
    });
</script>
