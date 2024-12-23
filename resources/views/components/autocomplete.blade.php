<div>
    <label for="autocomplete_{{ $type }}">{{ ucfirst($type) }}</label>
    <input type="text" id="autocomplete_{{ $type }}" name="{{ $type }}" value="{{ $value }}" placeholder="Start typing {{ $type }}..."/>
    <ul id="autocomplete_{{ $type }}_list" class="autocomplete-suggestions"></ul>
    <input type="hidden" id="character_value_{{ $type }}" name="character_value" value="">
    <input type="hidden" id="character_id_{{ $type }}" name="character_id" value="">
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        console.log('Autocomplete component loaded for type: {{ $type }}'); // Debugging log

        const type = '{{ $type }}';
        const input = document.getElementById('autocomplete_{{ $type }}');
        const suggestionList = document.getElementById('autocomplete_{{ $type }}_list');
        const hiddenValueInput = document.getElementById('character_value_{{ $type }}');
        const hiddenIdInput = document.getElementById('character_id_{{ $type }}');

        // Event listener for input changes
        input.addEventListener('input', function () {
            const query = input.value;

            if (query.length >= 2) { // Start searching after 2 characters
                fetch(`/autocomplete/species?query=${query}`)
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Network response was not ok: ' + response.statusText);
                        }
                        return response.json(); // This will throw if the response is not valid JSON
                    })
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
