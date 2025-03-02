@php
    use App\Repositories\ImageRepository;use App\Repositories\Lookup\CharacterRepository;use App\Utils\ImageUtils;use App\Utils\StringUtils;use Illuminate\Support\Facades\DB;
    // get the passed in id
    $specimen_compare_id = $specimen['id'];
    //dd($specimen_compare_id);
@endphp@extends('layouts.app')

@section('content')

    <h2>Specimen Compare ID: {{$specimen_compare_id}}</h2>
    <p>This is views/specimens/edit.blade.php</p>


    @if (Session::has('message'))
        <div class="text-3xl text-red-700">{{ Session::get('message') }}</div>
    @endif
    @php
        ImageUtils::displaySpecimenImages( $specimen_compare_id );
    @endphp


    <form method="POST" action="/specimens/{{ $specimen_compare_id }}">
        @csrf
        @method('PATCH')


        <label for="specimen_compare_name" class="block text-sm font-medium leading-6 text-gray-900">Specimen Compare
            Name</label>

        <input type="text" name="specimen_compare_name" id="specimen_compare_name"
               class="block flex-1 border-0 bg-transparent py-1 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
               placeholder="Specimen Compare Name" value="{{ $specimen_compare['specimen_compare_name'] }}" required>


        @error('specimen_compare_name')
        <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
        @enderror


        <label for="common_name" class="block text-sm font-medium leading-6 text-gray-900">Common Name</label> <input
            type="text" name="common_name" id="common_name"
            class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
            placeholder="Little Brown Mushroom - Front Yard" value="{{ $specimen_compare['common_name'] }}" required>


        @error('common_name')
        <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
        @enderror


        <label for="description" class="block text-sm font-medium leading-6 text-gray-900">Description</label> <input
            type="text" name="description" id="description"
            class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
            placeholder="Description" value="{{ $specimen_compare['description'] }}">


        @error('description')
        <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
        @enderror


        <label for="comment" class="block text-sm font-medium leading-6 text-gray-900">Comment</label>

        <input type="text" name="comment" id="comment"
               class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
               placeholder="Comment" value="{{ $specimen_compare['comment'] }}">


        @error('comment')
        <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
        @enderror


        <label for="specimen_compare_location_now" class="block text-sm font-medium leading-6 text-gray-900">Specimen
            Compare Location Now</label>

        <input type="number" name="specimen_compare_location_now" id="specimen_compare_location_now"
               class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
               value="{{ $specimen_compare['specimen_compare_location_now'] }}" required>


        @error('specimen_compare_location_now')
        <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
        @enderror


        <label for="location_found_city" class="block text-sm font-medium leading-6 text-gray-900">Nearest city or
            town</label>

        <input type="text" name="location_found_city" id="location_found_city"
               class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
               placeholder="City or town where found" value="{{ $specimen_compare['location_found_city'] }}" required>


        @error('location_found_city')
        <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
        @enderror


        <label for="location_found_county" class="block text-sm font-medium leading-6 text-gray-900">County</label>

        <input type="text" name="location_found_county" id="location_found_county"
               class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
               placeholder="County where found" value="{{ $specimen_compare['location_found_county'] }}" required>


        @error('location_found_county')
        <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
        @enderror


        <label for="state" class="block text-sm font-medium leading-6 text-gray-900">State</label>

        <input type="number" name="state" id="state"
               class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
               value="{{ $specimen_compare['state'] }}" required>


        @error('state')
        <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
        @enderror


        <label for="country" class="block text-sm font-medium leading-6 text-gray-900">Country</label>

        <input type="number" name="country" id="country"
               class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
               value="{{ $specimen_compare['country'] }}">


        @error('country')
        <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
        @enderror


        <label for="location_public_y_n" class="block text-sm font-medium leading-6 text-gray-900">Make location visible
            to others?</label>

        <input type="number" name="location_public_y_n" id="location_public_y_n"
               class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
               value="{{ $specimen_compare['location_public_y_n'] }}">


        @error('location_public_y_n')
        <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
        @enderror


        <label for="share_data_y_n" class="block text-sm font-medium leading-6 text-gray-900">Share this data with
            others?</label>

        <input type="number" name="share_data_y_n" id="share_data_y_n"
               class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
               value="{{ $specimen_compare['share_data_y_n'] }}">

        @error('share_data_y_n')
        <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
        @enderror

        <label for="month_found" class="block text-sm font-medium leading-6 text-gray-900">Month Found</label>

        <input type="number" name="month_found" id="month_found"
               class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
               value="{{ $specimen_compare['month_found'] }}" required>


        @error('month_found')
        <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
        @enderror


        <label for="day_found" class="block text-sm font-medium leading-6 text-gray-900">Day Found</label>

        <input type="number" name="day_found" id="day_found"
               class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
               value="{{ $specimen_compare['day_found'] }}" required>


        @error('day_found')
        <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
        @enderror


        <label for="year_found" class="block text-sm font-medium leading-6 text-gray-900">Year Found</label>

        <input type="number" name="year_found" id="year_found"
               class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
               value="{{ $specimen_compare['year_found'] }}" required>

        @error('year_found')
        <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
        @enderror


        <label for="fungus_type" class="block text-sm font-medium leading-6 text-gray-900">Fungus Type</label>

        <input type="number" name="fungus_type" id="fungus_type"
               class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
               value="{{ $specimen_compare['fungus_type'] }}" required>

        @error('fungus_type')
        <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
        @enderror


        <label for="entered_by" class="block text-sm font-medium leading-6 text-gray-900">Entered By:</label>

        <input type="number" name="entered_by" id="entered_by"
               class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
               value="{{ $specimen_compare['entered_by'] }}" required>


        @error('entered_by')
        <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
        @enderror


        <div class="mt-6 flex items-center justify-between gap-x-6">
            <div class="flex items-center">
                <button form="delete-form" class="text-red-500 text-sm font-bold">Delete</button>
            </div>

            <div class="flex items-center gap-x-6">
                <a href="/specimens/{{ $specimen_compare['id'] }}"
                   class="text-sm font-semibold leading-6 text-gray-900">Cancel</a>

                <div>
                    <button type="submit"
                            class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                        Update
                    </button>
                </div>
            </div>
        </div>
    </form>

    <form method="POST" action="/specimens_compare/{{ $specimen_compare['id'] }}" id="delete-form" class="hidden">
        @csrf
        @method('DELETE')
    </form>
@endsection


