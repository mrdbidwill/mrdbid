@props([
    /** @var \Illuminate\Database\Eloquent\Collection */
    'countries',
])
@php // dd($countries); @endphp
{{--                    @php dd($countries); @endphp--}}
<!-- Place country and state dropdowns here -->
<div class="sm:col-span-4">
    <label for="country" class="block text-sm font-medium leading-6 text-gray-900">Country</label>
    <div class="mt-2">
        <select name="country" id="country"
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
</div>

<div class="sm:col-span-4">
    <label for="state" class="block text-sm font-medium leading-6 text-gray-900">State</label>
    <div class="mt-2">
        <select name="state" id="state"
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
        $('#country').on('change', function () {
            var countryId = $(this).val();
            if (countryId) {
                $.ajax({
                    url: '/get-states/' + countryId,
                    type: "GET",
                    dataType: "json",
                    success: function (data) {
                        $('#state').empty();
                        $('#state').append('<option value="" disabled selected>Select your state</option>');
                        $.each(data, function (key, value) {
                            $('#state').append('<option value="' + key + '">' + value + '</option>');
                        });
                    }
                });
            } else {
                $('#state').empty();
                $('#state').append('<option value="" disabled selected>Select your state</option>');
            }
        });
    });
</script>
