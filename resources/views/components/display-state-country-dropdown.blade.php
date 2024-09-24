@props([
    /** @var \Illuminate\Database\Eloquent\Collection */
    'countries',
    'states'
])

<!-- display-state-country-dropdown.blade.php -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#country').on('change', function () {
            var countryId = $(this).val();
            if (countryId) {
                $.ajax({
                    url: '{{ route("getStates") }}',
                    type: 'GET',
                    data: {country_id: countryId},
                    success: function (data) {
                        $('#state').empty();
                        $('#state').append('<option value="">Select State</option>');
                        $.each(data, function (key, state) {
                            $('#state').append('<option value="' + state.id + '">' + state.name + '</option>');
                        });
                    }
                });
            } else {
                $('#state').empty();
                $('#state').append('<option value="">Select State</option>');
            }
        });
    });
</script>


@php // dd($countries); // countries good here @endphp

<div class="sm:col-span-4">
    <label for="country"
           class="block text-sm font-medium leading-6 text-gray-900">Country</label>
    <div class="mt-2">
        <div
            class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
            @php
                // $specimen_data = DB::table( 'countries' )->get();
                 //dd($specimen_data);
            // dd($countries);
            @endphp
            <table>
                {{--    @foreach($specimen_data as $item) --}}

                <tr>
                    <td>
                        <label for="country">
                            <select class="form-control" id="country" name="country">
                                @foreach ($countries as $country)
                                    <option
                                        value="{{ $country->id }}">{{ $country['name'] }}</option>
                                @endforeach
                            </select></label>
                    </td>
                </tr>
                {{--       @endforeach   --}}
            </table>
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
            @php
                //$specimen_data = DB::table( 'states' )->get();
                //dd($specimen_data);
            @endphp
            <table>
                {{--     @foreach($specimen_data as $item)  --}}

                <tr>
                    <td>
                        <div class="form-group">
                            <label for="state">
                                <select class="form-control" id="state" name="state">
                                    <option value="">Select State</option>
                                </select></label>
                        </div>
                    </td>
                </tr>
                {{--    @endforeach  --}}
            </table>
        </div>

        @error('state')
        <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
        @enderror
    </div>
</div>
