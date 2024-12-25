@props(['countries'])

@extends('layouts.app')

@section('content')


    <x-specimens-nav-bar></x-specimens-nav-bar>

    {{-- Show file address if in development environment --}}
    @if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/specimens/create.blade.php</p>
    @endif


    <p>resources/views/specimens/create.blade.php</p>

    <form method="POST" action="{{ route('specimens.store') }}">
        @csrf

        <table style="width: 100%; border-collapse: separate; border-spacing: 0; background-color:#e0e7ff; border: 4px solid #93c5fd; border-radius: 0.5rem; outline: 4px solid #f1f5f9;">
            <tr>
                <td style="padding: 0.5rem; border: 4px solid #93c5fd;">
                <label for="specimen_name" class="block text-sm font-medium leading-6 text-black">Specimen
                            Name</label>
                <input  class="consistent-width"    type="text" name="specimen_name" id="specimen_name" placeholder="You pick the name, such as abc_12_31_99_agaricus_maybe..." value="" required>


                @error('specimen_name')
                <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                @enderror
            </td>
        </tr>
        <tr>
            <td style="padding: 0.5rem; border: 4px solid #93c5fd;">

                        <label for="common_name" class="block text-sm font-medium leading-6 text-gray-900">Common
                            Name</label>
                                <input  class="consistent-width"    type="text" name="common_name" id="common_name"

                                       placeholder="Whatever helps you." value="" required>


                            @error('common_name')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror

            </td>
        </tr>
        <tr>
            <td style="padding: 0.5rem; border: 4px solid #93c5fd;">
                        <label for="description"
                               class="block text-sm font-medium leading-6 text-gray-900">Description</label>
                                <input  class="consistent-width"    type="text" name="description" id="description"

                                       placeholder="Type here..." value="">

                            @error('description')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror

            </td>
        </tr>
        <tr>
            <td style="padding: 0.5rem; border: 4px solid #93c5fd;">

                        <label for="comment" class="block text-sm font-medium leading-6 text-gray-900">Comment</label>
                                <input  class="consistent-width"   type="text" name="comment" id="comment"

                                       placeholder="Type here..." value="">


                            @error('comment')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror


            </td>
        </tr>
        <tr>
            <td style="padding: 0.5rem; border: 4px solid #93c5fd;">
                        Specimen Location Now: (todo: list of herbariums)

                                @php
                                    $specimen_data = DB::table( 'specimen_locations_now' )->get();
                                    // dd($specimen_data);
                                @endphp
                                <table>
                                    @foreach($specimen_data as $item)

                                        <tr>
                                            <td class="radio-cell">
                                                <div class="radio-wrapper">
                                                @if( $item->id == 1)
                                                    {{-- For standard lookup tables 1 is Not Entered --}}
                                                    <input  class="radio-button"    type="radio" id="specimen_location_now"
                                                           name="specimen_location_now" value="{{$item->id}}" required
                                                           checked>
                                                @else
                                                    <input  class="radio-button"    type="radio" id="specimen_location_now"
                                                           name="specimen_location_now" value="{{$item->id}}" required>
                                                @endif
                                                <label for="specimen_location_now">{{$item->name}}</label>
                                                </div>
                                            </td>
                                        </tr>
                                    @endforeach
                                </table>


                            @error('specimen_location_now')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
            </td>
        </tr>
        <tr>
            <td style="padding: 0.5rem; border: 4px solid #93c5fd;">
                Select Country first and then State. Only USA, Mexico and Canada are supported at this time.
                    {{-- use the component for country state drop down menus using js to load appropriate states for country selected --}}
                    <x-display-state-country-dropdown id="unique-id" :countries="$countries"/>

            </td>
        </tr>
        <tr>
            <td style="padding: 0.5rem; border: 4px solid #93c5fd;">
                        <label for="location_found_city" class="block text-sm font-medium leading-6 text-gray-900">Nearest
                            city or town</label>
                                <input  class="consistent-width"    type="text" name="location_found_city" id="location_found_city"

                                       placeholder="City or town where found" value="" required>


                            @error('location_found_city')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror

            </td>
        </tr>
        <tr>
            <td style="padding: 0.5rem; border: 4px solid #93c5fd;">

                        <label for="location_found_county" class="block text-sm font-medium leading-6 text-gray-900">County</label>
                                <input  class="consistent-width"    type="text" name="location_found_county" id="location_found_county"

                                       placeholder="Type here..." value="" required>


                            @error('location_found_county')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror

            </td>
        </tr>
        <tr>
            <td style="padding: 0.5rem; border: 4px solid #93c5fd;">

                        <label for="location_public_y_n" class="block text-sm font-medium leading-6 text-gray-900">Make
                            location visible to others?</label>
                                <input type="radio" id="location_public_y_n" name="location_public_y_n" value="1"
                                       required checked> <label for="location_public_y_n">Yes</label>

                                <input type="radio" id="location_public_y_n" name="location_public_y_n" value="0"
                                       required> <label for="location_public_y_n">No</label>

                            @error('location_public_y_n')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror

            </td>
        </tr>
        <tr>
            <td style="padding: 0.5rem; border: 4px solid #93c5fd;">

                        <label for="share_data_y_n" class="block text-sm font-medium leading-6 text-gray-900">Share this
                            data with others?</label>
                                <input type="radio" id="share_data_y_n" name="share_data_y_n" value="1" required
                                       checked> <label for="share_data_y_n">Yes</label>

                                <input type="radio" id="share_data_y_n" name="share_data_y_n" value="0" required> <label
                                    for="share_data_y_n">No</label>

                            @error('share_data_y_n')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror

            </td>
        </tr>
        <tr>
            <td style="padding: 0.5rem; border: 4px solid #93c5fd;">


                                <!-- radio list of months -->
                                <!-- radio list of months -->
                                @php
                                    $month_array = [
                                        ["1", "January"],
                                        ["2", "February"],
                                        ["3", "March"],
                                        ["4", "April"],
                                        ["5", "May"],
                                        ["6", "June"],
                                        ["7", "July"],
                                        ["8", "August"],
                                        ["9", "September"],
                                        ["10", "October"],
                                        ["11", "November"],
                                        ["12", "December"]
                                    ];
                                @endphp

                                <table>
                                    @foreach($month_array as $month)
                                        <tr>
                                            <td class="radio-cell">
                                                <div class="radio-wrapper">
                                                    <input class="radio-button" type="radio" id="{{ $month[0] }}" name="month_found"
                                                           value="{{ $month[0] }}" required @if($loop->first) checked @endif>
                                                    <label for="month_{{ $month[0] }}" class="radio-label">{{ $month[1] }}</label>
                                                </div>
                                            </td>
                                        </tr>
                                    @endforeach
                                </table>


                            @error('month_found')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror

            </td>
        </tr>
        <tr>
            <td style="padding: 0.5rem; border: 4px solid #93c5fd;">

                        <label for="day_found" class="block text-sm font-medium leading-6 text-gray-900">Day
                            Found</label>

                                <!-- drop down from 1 to 31 -->
                                <select  class="consistent-width"    name="day_found" id="day_found" required>
                                    @for ($i = 1; $i <= 31; $i++)
                                        <option value="{{ $i }}">{{ $i }}</option>
                                    @endfor
                                </select>


                            @error('day_found')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror

            </td>
        </tr>
        <tr>
            <td style="padding: 0.5rem; border: 4px solid #93c5fd;">

                <label for="year_found" class="block text-sm font-medium leading-6 text-gray-900">Year Found
                    (todo: year range 1900 to 2024?)</label>
                                <!-- drop down for years subject to change -->
                                <select  class="consistent-width"    name="year_found" id="year_found" required>
                                    @for ($i = 2020; $i <= 2024; $i++)
                                        <option value="{{ $i }}">{{ $i }}</option>
                                    @endfor
                                </select>

                            @error('year_found')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror

            </td>
        </tr>
        <tr>
            <td style="padding: 0.5rem; border: 4px solid #93c5fd;">

                        <label for="fungus_type" class="block text-sm font-medium leading-6 text-gray-900">Fungus
                            Type</label>
                                @php
                                    $specimen_data = DB::table( 'fungus_types' )->get();
                                    //dd($specimen_data);
                                @endphp
                                <table>
                                    @foreach($specimen_data as $item)

                                        <tr>
                                            <td class="radio-cell">
                                                <div class="radio-wrapper">
                                                @if( $item->id == 1)
                                                    <input type="radio"  class="radio-button"    id="fungus_type" name="fungus_type"
                                                           value="{{$item->id}}" required checked>
                                                @else
                                                    <input type="radio" class="consistent-width" id="fungus_type" name="fungus_type"
                                                           value="{{$item->id}}" required>
                                                @endif
                                                <label for="fungus_type">{{$item->name }}</label>
                                                </div>
                                            </td>
                                        </tr>
                                    @endforeach
                                </table>


                            @error('fungus_type')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
            </td>
        </tr>
            <tr>
                <td style="padding: 0.5rem; border: 4px solid #93c5fd;">
                    <div style="display: flex; justify-content: space-between; align-items: center;">
                        <x-primary-button>Submit</x-primary-button>
                        <x-cancel-button :cancelUrl="route('specimens.index')" />
                    </div>
                </td>
            </tr>
    </table>

    </form>


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
@endsection


