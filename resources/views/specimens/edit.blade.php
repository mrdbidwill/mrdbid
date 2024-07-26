@php use Illuminate\Support\Facades\DB; @endphp
<x-layout>
    <div class="mt-6 flex items-center justify-between gap-x-6"></div>
    <p>This is views/specimens/edit.blade.php</p>

    <div class="columns-8 flex items-center space-x-4">
        @php
            // get the passed in id
            $specimen_id = $specimen['id'];
            //dd($specimen_id);

            $images_specimens = DB::table('images_specimens')->simplePaginate(8)
            ->where('specimen_id', '=', $specimen_id);
            // dd($images_specimens);

            foreach ($images_specimens as $images_specimen) {
                $image_address = url('storage/uploaded_images/thumbnail/'.$images_specimen->file_address);
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
    <form method="POST" action="/specimens/{{ $specimen_id }}">
        @csrf
        @method('PATCH')

        <div class="space-y-12">
            <div class="border-b border-gray-900/10 pb-12">
                <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
                    <div class="sm:col-span-4">
                        <label for="specimen_name" class="block text-sm font-medium leading-6 text-gray-900">Specimen
                            Name</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input
                                    type="text"
                                    name="specimen_name"
                                    id="specimen_name"
                                    class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                    placeholder="Specimen Name"
                                    value="{{ $specimen['specimen_name'] }}"
                                    required>
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
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md"
                            >
                                <input
                                    type="text"
                                    name="common_name"
                                    id="common_name"
                                    class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                    placeholder="Little Brown Mushroom - Front Yard"
                                    value="{{ $specimen['common_name'] }}"
                                    required>
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
                                <input
                                    type="text"
                                    name="description"
                                    id="description"
                                    class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                    placeholder="Description"
                                    value="{{ $specimen['description'] }}">
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
                                <input
                                    type="text"
                                    name="comment"
                                    id="comment"
                                    class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                    placeholder="Comment"
                                    value="{{ $specimen['comment'] }}">
                            </div>

                            @error('comment')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>


                    <div class="sm:col-span-4">
                        <label for="specimen_location_now" class="block text-sm font-medium leading-6 text-gray-900">Specimen
                            Location Now</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input
                                    type="number"
                                    name="specimen_location_now"
                                    id="specimen_location_now"
                                    class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                    value="{{ $specimen['specimen_location_now'] }}"
                                    required>
                            </div>

                            @error('specimen_location_now')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>


                    <div class="sm:col-span-4">
                        <label for="location_found_city"
                               class="block text-sm font-medium leading-6 text-gray-900">Nearest city or town</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input
                                    type="text"
                                    name="location_found_city"
                                    id="location_found_city"
                                    class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                    placeholder="City or town where found"
                                    value="{{ $specimen['location_found_city'] }}"
                                    required>
                            </div>

                            @error('location_found_city')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>


                    <div class="sm:col-span-4">
                        <label for="location_found_county"
                               class="block text-sm font-medium leading-6 text-gray-900">County</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input
                                    type="text"
                                    name="location_found_county"
                                    id="location_found_county"
                                    class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                    placeholder="County where found"
                                    value="{{ $specimen['location_found_county'] }}"
                                    required>
                            </div>

                            @error('location_found_county')
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
                                <input
                                    type="number"
                                    name="state"
                                    id="state"
                                    class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                    value="{{ $specimen['state'] }}"
                                    required>
                            </div>

                            @error('state')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>


                    <div class="sm:col-span-4">
                        <label for="country"
                               class="block text-sm font-medium leading-6 text-gray-900">Country</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input
                                    type="number"
                                    name="country"
                                    id="country"
                                    class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                    value="{{ $specimen['country'] }}">
                            </div>

                            @error('country')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>


                    <div class="sm:col-span-4">
                        <label for="location_public_y_n"
                               class="block text-sm font-medium leading-6 text-gray-900">Make location visible to
                            others?</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input
                                    type="number"
                                    name="location_public_y_n"
                                    id="location_public_y_n"
                                    class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                    value="{{ $specimen['location_public_y_n'] }}">
                            </div>

                            @error('location_public_y_n')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>


                    <div class="sm:col-span-4">
                        <label for="share_data_y_n"
                               class="block text-sm font-medium leading-6 text-gray-900">Share this data with
                            others?</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input
                                    type="number"
                                    name="share_data_y_n"
                                    id="share_data_y_n"
                                    class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                    value="{{ $specimen['share_data_y_n'] }}">
                            </div>

                            @error('share_data_y_n')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>


                    <div class="sm:col-span-4">
                        <label for="month_found"
                               class="block text-sm font-medium leading-6 text-gray-900">Month Found</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input
                                    type="number"
                                    name="month_found"
                                    id="month_found"
                                    class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                    value="{{ $specimen['month_found'] }}"
                                    required>
                            </div>

                            @error('month_found')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>


                    <div class="sm:col-span-4">
                        <label for="day_found"
                               class="block text-sm font-medium leading-6 text-gray-900">Day Found</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input
                                    type="number"
                                    name="day_found"
                                    id="day_found"
                                    class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                    value="{{ $specimen['day_found'] }}"
                                    required>
                            </div>

                            @error('day_found')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>


                    <div class="sm:col-span-4">
                        <label for="year_found"
                               class="block text-sm font-medium leading-6 text-gray-900">Year Found</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input
                                    type="number"
                                    name="year_found"
                                    id="year_found"
                                    class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                    value="{{ $specimen['year_found'] }}"
                                    required>
                            </div>

                            @error('year_found')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>


                    <div class="sm:col-span-4">
                        <label for="fungus_type"
                               class="block text-sm font-medium leading-6 text-gray-900">Fungus Type</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input
                                    type="number"
                                    name="fungus_type"
                                    id="fungus_type"
                                    class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                    value="{{ $specimen['fungus_type'] }}"
                                    required>
                            </div>

                            @error('fungus_type')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>


                    <div class="sm:col-span-4">
                        <label for="entered_by"
                               class="block text-sm font-medium leading-6 text-gray-900">Entered By:</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input
                                    type="number"
                                    name="entered_by"
                                    id="entered_by"
                                    class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                    value="{{ $specimen['entered_by'] }}"
                                    required>
                            </div>

                            @error('entered_by')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>


                </div>
            </div>
        </div>

        <div class="mt-6 flex items-center justify-between gap-x-6">
            <div class="flex items-center">
                <button form="delete-form" class="text-red-500 text-sm font-bold">Delete</button>
            </div>

            <div class="flex items-center gap-x-6">
                <a href="/specimens/{{ $specimen['id'] }}"
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

    <form method="POST" action="/specimens/{{ $specimen['id'] }}" id="delete-form" class="hidden">
        @csrf
        @method('DELETE')
    </form>
</x-layout>
