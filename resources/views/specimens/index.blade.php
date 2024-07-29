@php use Illuminate\Support\Facades\DB;@endphp
<x-layout>
    <x-slot:heading>
        Specimen Listings
    </x-slot:heading>

    <div class="flex justify-end">
        <a href="/specimens/create" class="px-4 py-2 bg-blue-500 text-white rounded-lg">Add Specimen</a>
    </div>


    <div class="space-y-4">
        <p>This is views/specimens/index.blade.php.</p>

        @foreach ($specimens as $specimen)
            <div class="border-gray-200 rounded-lg">
                <!--  add edit buttons  -->
                <div class="m-4 px-4 py-4">
                    <a href="/specimens/{{ $specimen['id'] }}/edit"
                       class="px-4 py-2 bg-blue-500 text-white rounded-lg">Edit</a>

                    <a href="/characters/"
                       class="px-4 py-2 bg-blue-500 text-white rounded-lg">Add Character</a>

                    <a href="/groups/{{ $specimen['id'] }}"
                       class="px-4 py-2 bg-blue-500 text-white rounded-lg">Add this specimen to one of your Groups</a>

                    <a href="/clusters/{{ $specimen['id'] }}"
                       class="px-4 py-2 bg-blue-500 text-white rounded-lg">Add this specimen to one of your Clusters</a>
                </div>


                <div class="m-4 px-4 py-4">

                    <form method="GET" action="/images_specimen/create" id="upload-image">
                        @csrf
                        <!-- add hidden field specimen_id -->
                        <input type="hidden" name="specimen_id" value="{{ $specimen['id'] }}">
                        <div>
                            <button type="submit"
                                    class="rounded-md bg-indigo-600 px-6 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                                Upload Image for this specimen.
                            </button>
                        </div>
                    </form>
                </div>

                @php

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

                <a href="/specimens/{{ $specimen['id'] }}" class="block px-4 py-6 border border-gray-200 rounded-lg">
                    <div class="font-bold text-blue-500 text-sm">{{ $specimen['specimen_name'] }}</div>

                    <div>
                        <strong>{{ $specimen['common_name'] }}:</strong>
                        {{ $specimen['description'] }}
                        {{ $specimen['comment'] }}

                        {{ $specimen['location_found_city'] }}
                        {{ $specimen['location_found_county'] }}
                        {{ $state->name }}
                        {{ $country->name }}
                        {{ $location_public }}
                        {{ $share_data }}
                        {{ $specimen['month_found'] }}  {{ $specimen['day_found'] }} {{ $specimen['year_found'] }} {{ $fungus_type->name }}
                    </div>
                </a>
                @endforeach

            </div>

    </div>


    <div class="flex bg-amber-600 border-gray-100">
        {{ $specimens->links() }}
    </div>
</x-layout>
