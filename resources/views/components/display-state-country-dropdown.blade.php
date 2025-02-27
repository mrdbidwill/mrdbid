@php use Illuminate\Database\Eloquent\Collection; @endphp{{-- resources/views/components/display-state-country-dropdown.blade.php --}}

@props([
    /** @var Collection */
    'countries',
])

<div class="sm:col-span-4">
    <label for="country_id" class="block text-sm font-medium leading-6 text-gray-900">Country</label>
    <div class="mt-2">
        <select name="country_id" id="country_id"
                class="block w-full border-0 bg-transparent py-1.5 px-3 text-gray-900 focus:ring-0 sm:text-sm sm:leading-6">
            <option value="" disabled selected>Select your country</option>
            @foreach($countries as $country)
                <option value="{{ $country->id }}">{{ $country['name'] }}</option>
            @endforeach
        </select>
        @error('country_id')
        <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
        @enderror
    </div>
</div>

<div class="sm:col-span-4">
    <label for="state_id" class="block text-sm font-medium leading-6 text-gray-900">State</label>
    <div class="mt-2">
        <select name="state_id" id="state_id"
                class="block w-full border-0 bg-transparent py-1.5 px-3 text-gray-900 focus:ring-0 sm:text-sm sm:leading-6">
            <option value="" disabled selected>Select your state</option>
            <!-- States will be populated here -->
        </select>
        @error('state_id')
        <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
        @enderror
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        // Bind change event to the country dropdown
        $('#country_id').on('change', function () {
            var countryId = $(this).val();
            // Cache the state dropdown selector
            var $stateDropdown = $('#state_id');

            // Clear and reset state dropdown
            $stateDropdown.empty().append('<option value="" disabled selected>Select your state</option>');

            if (countryId) {
                $.ajax({
                    url: '{{ route("getStates") }}',
                    type: "GET",
                    data: {country: countryId},
                    dataType: "json",
                    success: function (data) {
                        // Populate the state dropdown with received data
                        $.each(data, function (key, value) {
                            $stateDropdown.append('<option value="' + key + '">' + value + '</option>');
                        });
                    },
                    error: function () {
                        alert('Unable to load states. Please try again.');
                    }
                });
            }
        });
    });
</script>
