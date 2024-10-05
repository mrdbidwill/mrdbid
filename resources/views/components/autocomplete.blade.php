<!-- resources/views/components/autocomplete.blade.php -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>

<script>
    $(document).ready(function () {
        function setupAutocomplete(elementId, route) {
            $('#' + elementId).autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: route,
                        data: {query: request.term},
                        success: function (data) {
                            response(data.map(item => item.Taxon_name));
                        }
                    });
                }
            });
        }

        setupAutocomplete('genus', "{{ route('autocomplete.genus') }}");
        setupAutocomplete('species', "{{ route('autocomplete.species') }}");
    });
</script>

<!-- Autocomplete input fields -->
@if ($type === 'genus')
    <div class="form-group">
        <label for="genus">Genus:</label> <input type="text" id="genus" name="genus" class="form-control"
                                                 value="{{ $value ?? '' }}">
    </div>
@endif

@if ($type === 'species')
    <div class="form-group">
        <label for="species">Species:</label> <input type="text" id="species" name="species" class="form-control"
                                                     value="{{ $value ?? '' }}">
    </div>
@endif
