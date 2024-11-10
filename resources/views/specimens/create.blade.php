@extends('layouts.app')

@section('content')

    <x-specimens-nav-bar></x-specimens-nav-bar>
    <form method="POST" action="{{ route('specimens.store') }}">
        @csrf

        <div class="space-y-12">
            <div class="border-b border-gray-900/10 pb-12">
                <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
                    <div class="sm:col-span-4">
                        <label for="specimen_name" class="block text-sm font-medium leading-6 text-gray-900">Specimen
                            Name</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input type="text" name="specimen_name" id="specimen_name"
                                       class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                       placeholder="Specimen Name" value="" required>
                            </div>

                            @error('specimen_name')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>

                    <div class="sm:col-span-4">
                        <label for="common_name" class="block text-sm font-medium leading-6 text-gray-900">Common
                            Name</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input type="text" name="common_name" id="common_name"
                                       class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                       placeholder="Little Brown Mushroom - Front Yard" value="" required>
                            </div>

                            @error('common_name')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>

                    <div class="sm:col-span-4">
                        <label for="description"
                               class="block text-sm font-medium leading-6 text-gray-900">Description</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input type="text" name="description" id="description"
                                       class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                       placeholder="Description" value="">
                            </div>
                            @error('description')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>


                    <div class="sm:col-span-4">
                        <label for="comment" class="block text-sm font-medium leading-6 text-gray-900">Comment</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input type="text" name="comment" id="comment"
                                       class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                       placeholder="Comment" value="">
                            </div>

                            @error('comment')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>


                    <div class="sm:col-span-4">
                        Specimen Location Now: (todo: list of herbariums)
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">

                                @php
                                    $specimen_data = DB::table( 'specimen_locations_now' )->get();
                                    // dd($specimen_data);
                                @endphp
                                <table>
                                    @foreach($specimen_data as $item)

                                        <tr>
                                            <td>
                                                @if( $item->id == 1)
                                                    {{-- For standard lookup tables 1 is Not Entered --}}
                                                    <input type="radio" id="specimen_location_now"
                                                           name="specimen_location_now" value="{{$item->id}}" required
                                                           checked>
                                                @else
                                                    <input type="radio" id="specimen_location_now"
                                                           name="specimen_location_now" value="{{$item->id}}" required>
                                                @endif
                                                <label for="specimen_location_now">{{$item->name}}</label>
                                            </td>
                                        </tr>
                                    @endforeach
                                </table>
                            </div>

                            @error('specimen_location_now')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>

                    {{-- use the component for country state drop down menus using js to load appropriate states for country selected --}}
                    <x-display-state-country-dropdown :countries="$countries"></x-display-state-country-dropdown>

                    <div class="sm:col-span-4">
                        <label for="location_found_city" class="block text-sm font-medium leading-6 text-gray-900">Nearest
                            city or town</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input type="text" name="location_found_city" id="location_found_city"
                                       class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                       placeholder="City or town where found" value="" required>
                            </div>

                            @error('location_found_city')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>


                    <div class="sm:col-span-4">
                        <label for="location_found_county" class="block text-sm font-medium leading-6 text-gray-900">County</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input type="text" name="location_found_county" id="location_found_county"
                                       class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                       placeholder="County where found" value="" required>
                            </div>

                            @error('location_found_county')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>


                    <div class="sm:col-span-4">
                        <label for="location_public_y_n" class="block text-sm font-medium leading-6 text-gray-900">Make
                            location visible to others?</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input type="radio" id="location_public_y_n" name="location_public_y_n" value="1"
                                       required checked> <label for="{{$item->id}}">Yes</label>

                                <input type="radio" id="location_public_y_n" name="location_public_y_n" value="0"
                                       required> <label for="location_public_y_n">No</label>
                            </div>

                            @error('location_public_y_n')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>


                    <div class="sm:col-span-4">
                        <label for="share_data_y_n" class="block text-sm font-medium leading-6 text-gray-900">Share this
                            data with others?</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input type="radio" id="share_data_y_n" name="share_data_y_n" value="1" required
                                       checked> <label for="{{$item->id}}">Yes</label>

                                <input type="radio" id="share_data_y_n" name="share_data_y_n" value="0" required> <label
                                    for="share_data_y_n">No</label>
                            </div>

                            @error('share_data_y_n')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>


                    <div class="sm:col-span-4">

                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <!-- radio list of months -->
                                @php
                                    $month_array = array( array("01" , "January"), array("02" , "February"), array("03" ,
                                    "March"), array("04" , "April"), array("05" , "May"), array("06" , "June"), array("07" ,
                                    "July"), array("08" , "August"), array("09" , "September"), array("10" , "October"),
                                    array("11" , "November"), array("12" , "December") );
                                    //dd($month_array);
                                @endphp

                                <table>
                                    @foreach($month_array as $month )
                                        @php
                                            //dd($item);
                                        @endphp
                                        <tr>
                                            <td>
                                                <label for="month_found"
                                                       class="text-sm font-medium leading-6 text-gray-900">{{$month[1]}}</label>
                                                @if( $month[0][1] == "01")
                                                    <input type="radio" id="month_found" name="month_found"
                                                           value="{{$month[0][1]}}" required checked>
                                                @else
                                                    <input type="radio" id="month_found" name="month_found"
                                                           value="{{$month[0][1]}}" required>
                                                @endif

                                            </td>
                                        </tr>
                                    @endforeach
                                </table>

                            </div>

                            @error('month_found')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>


                    <div class="sm:col-span-4">
                        <label for="day_found" class="block text-sm font-medium leading-6 text-gray-900">Day
                            Found</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">

                                <!-- drop down from 1 to 31 -->
                                <select name="day_found" id="day_found" required>
                                    @for ($i = 1; $i <= 31; $i++)
                                        <option value="{{ $i }}">{{ $i }}</option>
                                    @endfor
                                </select>
                            </div>

                            @error('day_found')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>


                    <div class="sm:col-span-4">
                        <label for="year_found" class="block text-sm font-medium leading-6 text-gray-900">Year Found
                            (todo: year range 1900 to 2024?)</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <!-- drop down for years subject to change -->
                                <select name="year_found" id="year_found" required>
                                    @for ($i = 2020; $i <= 2024; $i++)
                                        <option value="{{ $i }}">{{ $i }}</option>
                                    @endfor
                                </select>
                            </div>
                            @error('year_found')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>


                    <div class="sm:col-span-4">
                        <label for="fungus_type" class="block text-sm font-medium leading-6 text-gray-900">Fungus
                            Type</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                @php
                                    $specimen_data = DB::table( 'fungus_types' )->get();
                                    //dd($specimen_data);
                                @endphp
                                <table>
                                    @foreach($specimen_data as $item)

                                        <tr>
                                            <td>
                                                @if( $item->id == 1)
                                                    <input type="radio" id="fungus_type" name="fungus_type"
                                                           value="{{$item->id}}" required checked>
                                                @else
                                                    <input type="radio" id="fungus_type" name="fungus_type"
                                                           value="{{$item->id}}" required>
                                                @endif
                                                <label for="fungus_type">{{$item->id }}. {{$item->name }}</label>
                                            </td>
                                        </tr>
                                    @endforeach
                                </table>
                            </div>

                            @error('fungus_type')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>
                </div>


                <div>
                    <input type="hidden" name="entered_by" id="entered_by" value="{{auth()->user()->id}}">

                    <div class="mx-auto mt-6">
                        <x-primary-button>Submit</x-primary-button>
                    </div>


                </div>
            </div>
        </div>
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


