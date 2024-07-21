@php use Illuminate\Support\Facades\DB;@endphp
<x-layout>
    <x-slot:heading>
        Specimen Listings
    </x-slot:heading>

    <div class="flex justify-end">
        <a href="/specimens/create" class="px-4 py-2 bg-blue-500 text-white rounded-lg">Add Specimen</a>
    </div>

    <div class="space-y-4">
        <p>This is views/specimens/index.blade.php</p>

        @foreach ($specimens as $specimen)
            <!--  add edit buttons  -->
            <div class="flex justify-middle">
                <a href="/specimens/{{ $specimen['id'] }}/edit"
                   class="px-4 py-2 bg-blue-500 text-white rounded-lg">Edit</a>
            </div>

            <!--  add image upload button  -->
            <div class="flex justify-middle">
                <a href="{{ route('images.create') }}"
                   class="px-4 py-2 bg-blue-500 text-white rounded-lg">Upload Image</a>
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

    <div class="flex bg-amber-600 border-gray-100">
        {{ $specimens->links() }}
    </div>
</x-layout>
