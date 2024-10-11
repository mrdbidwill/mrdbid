<div>
    <label for="autocomplete_{{ $type }}">{{ ucfirst($type) }}</label> <input type="text" id="autocomplete_{{ $type }}"
                                                                              name="{{ $type }}" value="{{ $value }}"
                                                                              placeholder="Start typing {{ $type }}..."/>
    <ul id="autocomplete_{{ $type }}_list" class="autocomplete-suggestions"></ul>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        console.log('Autocomplete component loaded for type: {{ $type }}'); // Debugging log

        const input = document.getElementById('autocomplete_{{ $type }}');
        const suggestionList = document.getElementById('autocomplete_{{ $type }}_list');

        // Event listener for input changes
        input.addEventListener('input', function () {
            const query = input.value;

            if (query.length >= 2) { // Start searching after 2 characters
                fetch(`/api/autocomplete/{{ $type }}?query=${query}`)
                    .then(response => response.json())
                    .then(data => {
                        suggestionList.innerHTML = ''; // Clear previous suggestions

                        // Populate the suggestions list
                        data.forEach(item => {
                            const listItem = document.createElement('li');
                            listItem.textContent = item.Taxon_name;
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

        // Optionally handle click on suggestion items to fill the input
        suggestionList.addEventListener('click', function (event) {
            if (event.target.tagName === 'LI') {
                input.value = event.target.textContent;
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
