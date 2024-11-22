<div>
    <label for="autocomplete_{{ $name }}">{{ ucfirst(str_replace('_', ' ', $name))  }}</label> <input type="text"
                                                                                                      id="autocomplete_{{ $name }}"
                                                                                                      name="{{ $name }}"
                                                                                                      value="{{ $value }}"
                                                                                                      placeholder="Start typing {{ $name }}..."/>
    <ul id="autocomplete_{{ $name }}_list" class="autocomplete-suggestions"></ul>
    <input type="hidden" id="character_value_{{ $name }}" name="character_value" value=""> <input type="hidden"
                                                                                                  id="character_id_{{ $name }}"
                                                                                                  name="character_id"
                                                                                                  value="">
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        console.log('Autocomplete component loaded for name: {{ $name }}'); // Debugging log

        const input = document.getElementById('autocomplete_{{ $name }}');
        const suggestionList = document.getElementById('autocomplete_{{ $name }}_list');
        const hiddenValueInput = document.getElementById('character_value_{{ $name }}');
        const hiddenIdInput = document.getElementById('character_id_{{ $name }}');

        // Event listener for input changes
        input.addEventListener('input', function () {
            const query = input.value;

            if (query.length >= 2) { // Start searching after 2 characters
                fetch(`/api/autocomplete/{{ $name }}?query=${query}`)
                    .then(response => response.json())
                    .then(data => {
                        suggestionList.innerHTML = ''; // Clear previous suggestions

                        // Populate the suggestions list
                        data.forEach(item => {
                            const listItem = document.createElement('li');
                            listItem.textContent = item.Taxon_name;
                            listItem.dataset.id = item.id; // Store the ID in a data attribute
                            suggestionList.appendChild(listItem);
                        });
                    })
                    .catch(error => {
                        console.error('Error fetching autocomplete data:', error);
                    });
            } else {
                suggestionList.innerHTML = ''; // Clear suggestions if query length is less than 2
            }
        });

        // Handle click on suggestion items to fill the input and hidden input
        suggestionList.addEventListener('click', function (event) {
            if (event.target.tagName === 'LI') {
                input.value = event.target.textContent;
                hiddenValueInput.value = event.target.dataset.id; // Set the hidden input to the ID
                hiddenIdInput.value = event.target.dataset.id; // Set the hidden input to the ID
                suggestionList.innerHTML = ''; // Clear suggestions after selection
            }
        });
    });
</script>

<style>
    .autocomplete-suggestions {
        list-style-type: none;
        margin: 0;
        padding: 0;
        border: 1px solid #ccc;
        max-height: 150px;
        overflow-y: auto;
    }

    .autocomplete-suggestions li {
        padding: 5px;
        cursor: pointer;
    }

    .autocomplete-suggestions li:hover {
        background-color: #ddd;
    }
</style>
