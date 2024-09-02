@php
    use App\Models\ImageSpecimen;  use Illuminate\Support\Facades\DB ;
    //dd($specimens);
@endphp
<x-layout>
    <x-slot:heading>
        Specimen Listings
    </x-slot:heading>

    <p>This is views/specimens/index.blade.php.</p>

    <div class="m-auto p-6">
        <!-- if no specimens are found, display message -->

        @if ($specimens->count() == 0)
            <p class="text-red-500">No specimens found.</p>
        @endif
    </div>

    <div class="flex justify-end">
        <a href="/specimens/create" class="px-4 py-2 bg-blue-500 text-white rounded-lg">Add Specimen</a>
    </div>

    <div class="space-y-4">
        <div class="flex items-center space-x-4">

            <table
                class="table-auto size-full  bg-indigo-100 border-separate border border-slate-900 border-4-rounded rounded-lg outline-slate-100 outline-4">
                <!-- $specimens = Specimen::where('user_id', auth()->id())->latest()->simplePaginate(6);  -->

                @foreach ($specimens as $specimen)

                    @php
                        // get the passed in id
                        $specimen_id = $specimen['id'];
                        //dd($specimen_id);

                        $images_specimens = DB::table('image_specimens')->simplePaginate(8)
                        ->where('specimen_id', '=', $specimen_id);
                        // dd($images_specimens);

                    $state = DB::table('states')
                    ->where('id', '=', $specimen['state'])
                    ->first();
                    //dd($state);

                    $country = DB::table('countries')
                    ->where('id', '=', $specimen['country'])
                    ->first();
                    // dd($country);


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

                    $fungus_type = DB::table('fungus_types')
                    ->where('id', '=', $specimen['fungus_type'])
                    ->first();
                    // dd($fungus_type);
                    @endphp

                    <tr>
                        <td colspan="3" class="border border-slate-400 p-2 text-fuchsia-700 text-center">
                            Click on thumbnail to view larger image. Click again to return to thumbnail.
                        </td>
                    </tr>

                    @foreach ($images_specimens as $images_specimen)
                        @php
                            $image_address_thumbnail = url('storage/uploaded_images/thumbnail/thumb_'.$images_specimen->file_address);
                            $parts = DB::table('parts')
                            ->where('id', '=', $images_specimen->parts)
                            ->first();
                            // dd($parts);
                            $image_address_full_size = url('storage/uploaded_images/'.$images_specimen->file_address);
                        @endphp

                        <tr>
                            <td colspan="3" class="border border-slate-400 p-2">
                                <!--   <img class="h-100 w-100" src="{{$image_address_thumbnail}}"
                                     alt="{{$image_address_thumbnail}}"><br>{{$parts->name}}
                                : {{$images_specimen->description}}  -->

                                <img
                                    class="h-100 w-100"
                                    src="{{ $image_address_thumbnail }}"
                                    alt="{{ $image_address_thumbnail }}"
                                    data-thumbnail="{{ $image_address_thumbnail }}"
                                    data-fullsize="{{ $image_address_full_size }}"
                                    onclick="toggleImage(this)"
                                >
                                <br>
                                {{ $parts->name }}: {{ $images_specimen->description }}
                            </td>
                        </tr>
                    @endforeach

                    <tr>
                        <td class="p-2">
                            <div class="m-4 px-4 py-4">
                                <a href="/specimens/{{ $specimen['id'] }}/edit"
                                   class="bg-blue-300 rounded p-1 border border-slate-400 hover:bg-blue-500 hover:text-white">Edit
                                    Basic Specimen Info</a>
                            </div>
                        </td>

                        <td class="p-2">
                            <form method="GET" action="/image_specimen/create" id="upload-image">
                                @csrf
                                <!-- add hidden field specimen_id -->
                                <input type="hidden" name="specimen_id" value="{{ $specimen['id'] }}">
                                @php

                                    $image_count = ImageSpecimen::where('specimen_id', $specimen['id'])->count();
                                @endphp
                                <div>
                                    <button type="submit"
                                            class="bg-blue-300 rounded p-1 border border-slate-400 hover:bg-blue-500 hover:text-white">
                                        Upload Image for this specimen. ({{$image_count }}) image(s) uploaded.
                                    </button>
                                </div>
                            </form>
                        </td>


                        <td class="p-2">
                            <form method="GET" action="/character_specimens/{{$specimen['id']}}/edit"
                                  id="add_character">
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
                    <!-- Begin Basic Characters -->
                    <tr>
                        <td colspan="3" class="border-4 border-black p-2 text-fuchsia-700 text-center">
                            These are the basic characters that every specimen should have:
                        </td>
                    </tr>

                    <tr>
                        <td class="border-4 border-black p-2">Specimen ID: {{ $specimen['id'] }}</td>
                        <td class="border-4 border-black p-2">Specimen Name: {{ $specimen['specimen_name'] }}</td>
                        <td class="border-4 border-black p-2">Common Name: {{ $specimen['common_name'] }}</td>
                    </tr>

                    <tr>
                        <td colspan="3" class="border-4 border-black p-2">
                            Description: {{ $specimen['description'] }}</td>
                    </tr>

                    <tr>
                        <td colspan="3" class="border-4 border-black p-2">Comment: {{ $specimen['comment'] }}</td>
                    </tr>

                    <tr>
                        <td colspan="3" class="border-4 border-black p-2">{{ $specimen['location_found_city'] }}
                            , {{ $state->name }} {{$country->name}} on Date
                            Found: {{ $specimen['month_found'] }} / {{ $specimen['day_found'] }}
                            / {{ $specimen['year_found'] }}</td>
                    </tr>

                    <tr>
                        <td class="border-4 border-black p-2">Make Location Public? {{ $location_public }}</td>
                        <td class="border-4 border-black p-2">Share Data? {{ $share_data }}</td>
                        <td class="border-4 border-black p-2">Fungus Type: {{ $fungus_type->name }}</td>
                    </tr>

                    <tr>
                        <td colspan="3" class="border-4 border-black p-2 text-fuchsia-700 text-center">
                            End basic characters.
                        </td>
                    </tr>
                    <!-- end basic characters -->
                    <tr>
                        <td class="border border-slate-400 p-2"><a
                                class="bg-blue-300 rounded p-1 border border-slate-400 hover:bg-blue-500 hover:text-white"
                                href="/specimen_group">Add
                                this specimen to one of your Groups</a>
                        </td>

                        <td class="border border-slate-400 p-2"><br></td>

                        <td>
                            <a class="bg-blue-300 rounded p-1 border border-slate-400 hover:bg-blue-500 hover:text-white"
                               href="/specimen_cluster">Add
                                this specimen to
                                one of your Clusters</a>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="3" class="bg-blue-400 border border-slate-800 p-2"></td>
                    </tr>

                @endforeach
            </table>
        </div>
    </div>
</x-layout>
