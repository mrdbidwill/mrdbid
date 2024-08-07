@php
    use App\Models\ImageSpecimen;use Illuminate\Support\Facades\DB
    ;@endphp
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
            <div class="columns-8 flex items-center space-x-4">
                @php
                    // get the passed in id
                    $specimen_id = $specimen['id'];
                    //dd($specimen_id);

                    $images_specimens = DB::table('image_specimens')->simplePaginate(8)
                    ->where('specimen_id', '=', $specimen_id);
                    // dd($images_specimens);

                    foreach ($images_specimens as $images_specimen) {
                        $image_address = url('storage/uploaded_images/thumbnail/thumb_'.$images_specimen->file_address);
                        $parts = DB::table('parts')
                                ->where('id', '=', $images_specimen->parts)
                                ->first();
                                // dd($parts);

                        echo "<div class=\"p-6  rounded-xl shadow-lg \">
                                  <div class=\"shrink-0\">
                                      <img class=\"h-100 w-100\" src=$image_address alt=\"$image_address\">
                                  </div>
                                  <div>
                                     <!--  <div class=\"text-xl font-medium text-black\">$parts->name:  $images_specimen->description</div>
                                      <div class=\"text-xl font-medium text-black\">$parts->name</div>
                                      <div class=\"text-xl font-medium text-black\">$images_specimen->description</div>   -->
                                  </div>
                              </div>";}
                @endphp
            </div>

            <div class="border-gray-200 rounded-lg">
                <!--  add edit buttons  -->
                <div class="m-4 px-4 py-4">
                    <a href="/specimens/{{ $specimen['id'] }}/edit"
                       class="px-4 py-2 bg-blue-500 text-white rounded-lg">Edit</a>

                    <a href="/characters/"
                       class="px-4 py-2 bg-blue-500 text-white rounded-lg">Add Character</a>

                    <div class="m-4 px-4 py-4">

                        <form method="GET" action="/image_specimen/create" id="upload-image">
                            @csrf
                            <!-- add hidden field specimen_id -->
                            <input type="hidden" name="specimen_id" value="{{ $specimen['id'] }}">
                            @php

                                $image_count = ImageSpecimen::where('specimen_id', $specimen['id'])->count();
                            @endphp
                            <div>
                                <button type="submit"
                                        class="rounded-md bg-indigo-600 px-6 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                                    Upload Image for this specimen. ({{$image_count }}) images uploaded.
                                </button>
                            </div>
                        </form>
                    </div>

                    <a href="/groups/{{ $specimen['id'] }}"
                       class="px-4 py-2 bg-blue-500 text-white rounded-lg">Add this specimen to one of your Groups</a>

                    <a href="/clusters/{{ $specimen['id'] }}"
                       class="px-4 py-2 bg-blue-500 text-white rounded-lg">Add this specimen to one of your Clusters</a>

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
