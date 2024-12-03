@php
    use App\Models\ImageSpecimen;  use App\Models\Specimen;use App\Utils\ImageUtils;use Illuminate\Support\Facades\DB ;
    //dd($specimens);
@endphp

@extends('layouts.app')

@section('content')

    <x-specimens-nav-bar></x-specimens-nav-bar>

    @if(session('success'))
        <div x-data="{ show: true }" x-init="setTimeout(() => show = false, 5000)" x-show="show"
             x-transition:enter="transition ease-out duration-300" x-transition:enter-start="opacity-0"
             x-transition:enter-end="opacity-100" x-transition:leave="transition ease-in duration-500"
             x-transition:leave-start="opacity-100" x-transition:leave-end="opacity-0"
             class="custom-success text-orange-600">
            <strong>Success!</strong> {{ session('success') }}
        </div>
    @endif

    @if(session('error'))
        <div class="alert alert-danger">
            {{ session('error') }}
        </div>
    @endif

    <!-- if no specimens are found, display message -->
    @if ($specimen->count() == 0)
        <p class="text-red-500">No specimens found.</p>
    @endif


    <p>resources/views/specimens/show.blade.php</p>





    @php
        $specimen_id = $specimen->id;
        $selected_country = $specimen->country;
        $selected_state = $specimen->state;


    if($specimen['location_public_y_n'] = 0){
    $location_public = 'Not Public';
    }
    else{
    $location_public = "Public";
    }

    if($specimen['share_data_y_n'] = 0){
    $share_data = 'Do Not Share';
    }
    else{
    $share_data = "Share";
    }

    $fungus_types = DB::table('fungus_types')->get();

    $selected_fungus_type = DB::table('fungus_types')
    ->where('id', '=', $specimen['fungus_type'])
    ->first();
    // dd($fungus_type);


    ImageUtils::displaySpecimenImages( $specimen_id );   // within the foreach loop display the images for each specimen

    @endphp

    <table
        class="w-full table-auto bg-indigo-100 border-separate border border-4-rounded rounded-lg outline-slate-100 outline-4">
        <!-- begin basic specimens table -->
        <tr>
            <td class="p-2">
                <form method="GET" action="/image_specimen/create" id="upload-image">
                    @csrf
                    <!-- add hidden field specimen_id -->
                    <input type="hidden" name="specimen_id" value="{{ $specimen['id'] }}">
                    @php

                        $image_count = ImageSpecimen::where('specimen_id', $specimen['id'])->count();
                    @endphp

                    <button type="submit"
                            class="bg-blue-300 rounded p-1 border border-slate-400 hover:bg-blue-500 hover:text-white">
                        Upload Image for this specimen. ({{$image_count }}) image(s) uploaded.
                    </button>

                </form>
            </td>

            <td class="p-2">
                <form method="GET" action="/character_specimens/{{$specimen['id']}}/edit" id="add_character">
                    @csrf
                    <!-- add hidden field specimen_id -->
                    <input type="hidden" name="specimen_id" value="{{ $specimen['id'] }}">
                    <div>
                        <button type="submit"
                                class="bg-blue-300 rounded p-1 border border-slate-400 hover:bg-blue-500 hover:text-white">
                            Manage characters for this specimen
                        </button>
                    </div>
                </form>
            </td>
        </tr>


        <tr>
            <td class="border-4 border-blue-300 p-2 text-black text-center" colspan="2" >
                These are the basic characters that every specimen should have. To make changes, click on the
                corresponding field and enter new text or select new values, then click the Update button.
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2" colspan="2">
                Specimen ID: {{ $specimen->id }}
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2" colspan="2">
                <form action="{{ route('specimens.updateField', ['id' => $specimen->id, 'field' => 'specimen_name']) }}"
                      method="POST">
                    @csrf
                    @method('PUT')
                    Specimen Name: <input type="text" class="wider-input"  name="specimen_name"
                                          value="{{ old('specimen_name', $specimen->specimen_name) }}">
                    <x-form-button-small class="spaced-button" fieldName="Specimen Name">Update</x-form-button-small>
                </form>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2" colspan="2">
                <form action="{{ route('specimens.updateField', ['id' => $specimen->id, 'field' => 'common_name']) }}"
                      method="POST">
                    @csrf
                    @method('PUT')
                    Common Name: <input type="text" class="wider-input"   name="common_name"
                                        value="{{ old('common_name', $specimen->common_name) }}">
                    <x-form-button-small class="spaced-button" fieldName="Common Name">Update</x-form-button-small>
                </form>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2" colspan="2">
                <form action="{{ route('specimens.updateField', ['id' => $specimen->id, 'field' => 'description']) }}"
                      method="POST">
                    @csrf
                    @method('PUT')
                    Description: <textarea name="description" rows="4"
                                           style="width: 100%;">{{ old('description', $specimen->description) }}</textarea>
                    <br>
                    <x-form-button-small class="spaced-button" fieldName="Description">Update</x-form-button-small>
                </form>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2" colspan="2">
                <form action="{{ route('specimens.updateField', ['id' => $specimen->id, 'field' => 'comment']) }}"
                      method="POST">
                    @csrf
                    @method('PUT')
                    Comment: <textarea name="comment" rows="8"
                                       style="width: 100%;">{{ old('comment', $specimen->comment) }}</textarea> <br>
                    <x-form-button-small class="spaced-button" fieldName="Comment">Update</x-form-button-small>
                </form>
            </td>
        </tr>
        <!-- Country Dropdown -->
        <tr>
            <td class="border-4 border-blue-300 p-2" colspan="2">
                Country:
                <form action="{{ route('specimens.updateField', ['id' => $specimen->id, 'field' => 'country']) }}"
                      method="POST">
                    @csrf
                    @method('PUT')
                    <select name="country" class="form-select">
                        @foreach($countries as $country)
                            <option
                                value="{{ $country->id }}" {{ $selected_country == $country->id ? 'selected' : '' }}>
                                {{ $country->name }}
                            </option>
                        @endforeach
                    </select>
                    <x-form-button-small class="spaced-button" fieldName="Country">Update</x-form-button-small>
                </form>
            </td>
        </tr>

        <!-- State Dropdown -->
        <tr>
            <td class="border-4 border-blue-300 p-2" colspan="2">

                State:
                <form action="{{ route('specimens.updateField', ['id' => $specimen->id, 'field' => 'state']) }}"
                      method="POST">
                    @csrf
                    @method('PUT')
                    <select name="state" class="form-select">
                        @foreach($states as $state)
                            <option value="{{ $state->id }}" {{ $selected_state == $state->id ? 'selected' : '' }}>
                                {{ $state->name }}
                            </option>
                        @endforeach
                    </select>
                    <x-form-button-small class="spaced-button" fieldName="State">Update</x-form-button-small>
                </form>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2" colspan="2">
                <form
                    action="{{ route('specimens.updateField', ['id' => $specimen->id, 'field' => 'location_found_city']) }}"
                    method="POST">
                    @csrf
                    @method('PUT')
                    Location Found City: <input type="text" class="wider-input"   name="location_found_city"
                                                value="{{ old('location_found_city', $specimen->location_found_city) }}">
                    <x-form-button-small class="spaced-button" fieldName="City Found">Update</x-form-button-small>
                </form>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2" colspan="2">
                <form
                    action="{{ route('specimens.updateField', ['id' => $specimen->id, 'field' => 'location_found_county']) }}"
                    method="POST">
                    @csrf
                    @method('PUT')
                    Location Found County: <input type="text" class="wider-input"   name="location_found_county"
                                                  value="{{ old('location_found_county', $specimen->location_found_county) }}">
                    <x-form-button-small class="spaced-button" fieldName="County Found">Update</x-form-button-small>
                </form>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2" colspan="2">
                <form action="{{ route('specimens.updateField', ['id' => $specimen->id, 'field' => 'month_found']) }}"
                      method="POST">
                    @csrf
                    @method('PUT')
                    <div class="form-group">
                        <label for="month_found">Month Found:   </label> <select id="month_found" name="month_found"
                                                                                 class="wider-input">
                            @foreach(App\Utils\DateUtils::getAllMonths() as $num => $name)
                                <option value="{{ $num }}" {{ $specimen->month_found == $num ? 'selected' : '' }}>
                                    {{ $name }}
                                </option>
                            @endforeach
                        </select>

                    <x-form-button-small class="spaced-button" fieldName="Month Found">Update</x-form-button-small>
                    </div>
                </form>

                <form action="{{ route('specimens.updateField', ['id' => $specimen->id, 'field' => 'day_found']) }}"
                      method="POST">
                    @csrf
                    @method('PUT')
                    Day Found:   <input type="text" class="wider-input" name="day_found" value="{{ old('day_found', $specimen->day_found) }}">
                    <x-form-button-small class="spaced-button" fieldName="Day Found">Update</x-form-button-small>
                </form>

                <form action="{{ route('specimens.updateField', ['id' => $specimen->id, 'field' => 'year_found']) }}"
                      method="POST">
                    @csrf
                    @method('PUT')
                    Year Found:   <input type="text"  class="wider-input"   name="year_found"
                                       value="{{ old('year_found', $specimen->year_found) }}">
                    <x-form-button-small class="spaced-button" fieldName="Year Found">Update</x-form-button-small>
                </form>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2" colspan="2">
                <form
                    action="{{ route('specimens.updateField', ['id' => $specimen->id, 'field' => 'location_public_y_n']) }}"
                    method="POST">
                    @csrf
                    @method('PUT')
                    Make Location Public? <select name="location_public_y_n">
                        <option
                            value="0" {{ old('location_public_y_n', $specimen->location_public_y_n) == 0 ? 'selected' : '' }}>
                            Yes
                        </option>
                        <option
                            value="1" {{ old('location_public_y_n', $specimen->location_public_y_n) == 1 ? 'selected' : '' }}>
                            No
                        </option>
                    </select>
                    <x-form-button-small class="spaced-button" fieldName="Location Public?">Update</x-form-button-small>
                </form>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2" colspan="2">
                <form
                    action="{{ route('specimens.updateField', ['id' => $specimen->id, 'field' => 'share_data_y_n']) }}"
                    method="POST">
                    @csrf
                    @method('PUT')
                    Share Data? <select name="share_data_y_n">
                        <option value="0" {{ old('share_data_y_n', $specimen->share_data_y_n) == 0 ? 'selected' : '' }}>
                            Yes
                        </option>
                        <option value="1" {{ old('share_data_y_n', $specimen->share_data_y_n) == 1 ? 'selected' : '' }}>
                            No
                        </option>
                    </select>
                    <x-form-button-small class="spaced-button" fieldName="Share Data">Update</x-form-button-small>
                </form>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2" colspan="2">
                <form action="{{ route('specimens.updateField', ['id' => $specimen->id, 'field' => 'fungus_type']) }}"
                      method="POST">
                    @csrf
                    @method('PUT')
                    Fungus Type: <select name="fungus_type">
                        @foreach($fungus_types as $type)
                            <option
                                value="{{ $type->id }}" {{ old('fungus_type', $specimen->fungus_type) == $type->id ? 'selected' : '' }}>
                                {{ $type->name }}
                            </option>
                        @endforeach
                    </select>
                    <x-form-button-small class="spaced-button" fieldName="Fungus Type">Update</x-form-button-small>
                </form>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2 text-fuchsia-700 text-center" colspan="2">
                End basic characters.
            </td>
        </tr> <!-- end basic specimen table line 180 of specimens/index.blade.php -->
    </table>
@endsection


