{{-- resources/views/components/display-state-country-dropdown.blade.php --}}

@props([
    /** @var \Illuminate\Database\Eloquent\Collection */
    'countries',
])

<div class="sm:col-span-4">
    <label for="country-{{ $attributes['id'] }}">Country</label>
        <select name="country" id="country-{{ $attributes['id'] }}"
                class="block w-full border-0 bg-transparent py-1.5 px-3 text-gray-900 focus:ring-0 sm:text-sm sm:leading-6">
            <option value="" disabled selected>Select your country</option>
            @foreach($countries as $country)
                <option value="{{ $country->id }}">{{ $country['name'] }}</option>
            @endforeach
        </select>
        @error('country')
        <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
        @enderror
</div>

<div class="sm:col-span-4">
    <label for="state-{{ $attributes['id'] }}" class="visually-hidden">State</label>
    <div class="mt-2">
        <select name="state" id="state-{{ $attributes['id'] }}"
                class="block w-full border-0 bg-transparent py-1.5 px-3 text-gray-900 focus:ring-0 sm:text-sm sm:leading-6">
            <option value="" disabled selected>Select your state</option>
            <!-- States will be populated here -->
        </select>
        @error('state')
        <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
        @enderror
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        // Ensure unique selectors if there are multiple instances
        $('#country-{{ $attributes['id'] }}').on('change', function () {
            var countryId = $(this).val();
            if (countryId) {
                $.ajax({
                    url: '{{ route("getStates") }}',
                    type: "GET",
                    data: {country: countryId},
                    dataType: "json",
                    success: function (data) {
                        $('#state-{{ $attributes['id'] }}').empty();
                        $('#state-{{ $attributes['id'] }}').append('<option value="" disabled selected>Select your state</option>');
                        $.each(data, function (key, value) {
                            $('#state-{{ $attributes['id'] }}').append('<option value="' + key + '">' + value + '</option>');
                        });
                    }
                });
            } else {
                $('#state-{{ $attributes['id'] }}').empty();
                $('#state-{{ $attributes['id'] }}').append('<option value="" disabled selected>Select your state</option>');
            }
        });
    });
</script>
