@php
    use App\Models\ImageSpecimen;  use App\Utils\ImageUtils;use Illuminate\Support\Facades\DB ;
    //dd($specimens);
@endphp
<x-layout>

    <p>This is views/specimens/index.blade.php.</p>

    @if (Session::has('message'))
        <div class="text-3xl text-red-700">{{ Session::get('message') }}</div>
    @endif

    <!-- if no specimens are found, display message -->
    @if ($specimens->count() == 0)
        <p class="text-red-500">No specimens found.</p>
    @endif


    <a href="/specimens/create" class="px-4 py-2 bg-blue-500 text-white rounded-lg">Add Specimen Compare</a>


    @foreach ($specimens as $specimen)

        @php
            // get the passed in id
            $specimen_compareid = $specimen['id'];
            //dd($specimen_compareid);

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


        ImageUtils::displaySpecimenImages( $specimen_compareid );   // within the foreach loop display the images for each specimen_comparecompare

        @endphp

        <table
            class="table-auto size-full  bg-indigo-100 border-separate border border-slate-900 border-4-rounded rounded-lg outline-slate-100 outline-4">
            <!-- begin basic specimens table -->

            <tr>
                <td class="p-2">
                    <a href="/specimens/{{ $specimen['id'] }}/edit"
                       class="bg-blue-300 rounded p-1 border border-slate-400 hover:bg-blue-500 hover:text-white">Edit
                        Basic Specimen Compare Info</a>
                </td>
            </tr>
            <tr>
                <td class="p-2">
                    <form method="GET" action="/image_specimen/create" id="upload-image">
                        @csrf
                        <!-- add hidden field specimen_compareid -->
                        <input type="hidden" name="specimen_compareid" value="{{ $specimen['id'] }}">
                        @php

                            $image_count = ImageSpecimen::where('specimen_compareid', $specimen['id'])->count();
                        @endphp

                        <button type="submit"
                                class="bg-blue-300 rounded p-1 border border-slate-400 hover:bg-blue-500 hover:text-white">
                            Upload Image for this specimen_comparecompare. ({{$image_count }}) image(s) uploaded.
                        </button>

                    </form>
                </td>
            </tr>
            <tr>

                <td class="p-2">
                    <form method="GET" action="/character_specimens/{{$specimen['id']}}/edit"
                          id="add_character">
                        @csrf
                        <!-- add hidden field specimen_compareid -->
                        <input type="hidden" name="specimen_compareid" value="{{ $specimen['id'] }}">
                        <div>
                            <button type="submit"
                                    class="bg-blue-300 rounded p-1 border border-slate-400 hover:bg-blue-500 hover:text-white">
                                Manage characters for this specimen_comparecompare
                            </button>
                        </div>
                    </form>
                </td>
            </tr>

            <tr>
                <td class="border-4 border-black p-2 text-fuchsia-700 text-center">
                    These are the basic characters that every specimen_comparecompare should have:
                </td>
            </tr>

            <tr>
                <td class="border-4 border-black p-2">Specimen Compare ID: {{ $specimen['id'] }}</td>
            </tr>
            <tr>
                <td class="border-4 border-black p-2">Specimen Compare
                    Name: {{ $specimen['specimen_comparename'] }}</td>
            </tr>
            <tr>
                <td class="border-4 border-black p-2">Common Name: {{ $specimen['common_name'] }}</td>
            </tr>

            <tr>
                <td class="border-4 border-black p-2">
                    Description: {{ $specimen['description'] }}</td>
            </tr>

            <tr>
                <td class="border-4 border-black p-2">Comment: {{ $specimen['comment'] }}</td>
            </tr>

            <tr>
                <td class="border-4 border-black p-2">{{ $specimen['location_found_city'] }}
                    , {{ $state->name }} {{$country->name}} on Date
                    Found: {{ $specimen['month_found'] }} / {{ $specimen['day_found'] }}
                    / {{ $specimen['year_found'] }}
                </td>
            </tr>

            <tr>
                <td class="border-4 border-black p-2">Make Location Public? {{ $location_public }}</td>
            </tr>
            <tr>
                <td class="border-4 border-black p-2">Share Data? {{ $share_data }}</td>
            </tr>
            <tr>
                <td class="border-4 border-black p-2">Fungus Type: {{ $fungus_type->name }}</td>
            </tr>

            <tr>
                <td class="border-4 border-black p-2 text-fuchsia-700 text-center">
                    End basic characters.
                </td>
            </tr>
            <tr>
                <td class="border border-slate-400 p-2"><a
                        class="bg-blue-300 rounded p-1 border border-slate-400 hover:bg-blue-500 hover:text-white"
                        href="/specimen_comparegroup">Add this specimen_comparecompare to one of your Groups</a>
                </td>
            <tr>
                <td class="border border-slate-400 p-2"><br></td>
            </tr>
            <tr>
                <td>
                    <a class="bg-blue-300 rounded p-1 border border-slate-400 hover:bg-blue-500 hover:text-white"
                       href="/specimen_comparecluster">Add this specimen_comparecompare to one of your Clusters</a>
                </td>
            </tr>

            <tr>
                <td class="bg-blue-400 border border-slate-800 p-2"></td>
            </tr>
        </table>    <!-- end basic specimen_comparecompare table line 180 of specimens/index.blade.php -->
    @endforeach
</x-layout>
