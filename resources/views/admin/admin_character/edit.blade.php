<x-layout>
    <x-admin-dashboard-nav-bar></x-admin-dashboard-nav-bar>
    @php
        //dd($lookup_table);
        // $name does not work
        // $lookup_table['name'] does not work
        // $lookup_table->name does not work
        // $lookup_table[0]['name'] works

    if ( $lookup_table[0]['look_up_y_n'] == 1 ) {
        $look_up_y_n_DISPLAY = 'Yes';
    } else {
        $look_up_y_n_DISPLAY = 'No';
    }

    $display_options = DB::table('display_options')
        ->where('id', '=', $lookup_table[0]['display_options'])
        ->first();

        $parts = DB::table('parts')
        ->where('id', '=', $lookup_table[0]['parts'])
        ->first();

        $source = DB::table('data_sources')
        ->where('id', '=', $lookup_table[0]['source'])
        ->first();
    @endphp

    <div class="bg-amber-600 text-white p-4 rounded-lg">
        <h2 class="text-2xl font-bold">Edit lookup Table (admin_lookup/edit.blade.php)</h2>
        <h2 class="text-sm font-semibold leading-5 text-red-800">Admin! Admin! Admin! Admin! Admin!</h2>
    </div>


    <form method="POST" action="/admin_lookup/{{ $lookup_table[0]['id'] }} ">
        @csrf
        @method('PATCH')

        <div class="space-y-12">
            <div class="border-b border-gray-900/10 pb-12">
                <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
                    <div class="sm:col-span-4">
                        <label for="name" class="block text-sm font-medium leading-6 text-gray-900">Name</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input type="text" name="name" id="name"
                                       class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                       value="{{ $lookup_table[0]['name'] }}" required>
                            </div>


                            @error('name')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>


                    <div class="sm:col-span-4">
                        <label for="display_options" class="block text-sm font-medium leading-6 text-gray-900">Display
                            Option</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input type="text" name="display_options" id="display_options"
                                       class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                       value="{{ $lookup_table[0]['display_options'] }}" -
                                       {{$display_options->name}}required>
                            </div>

                            @error('display_options')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>


                    <div class="sm:col-span-4">
                        <label for="look_up_y_n" class="block text-sm font-medium leading-6 text-gray-900">Is Lookup
                            Table?</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input type="text" name="look_up_y_n" id="look_up_y_n"
                                       class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                       value="{{ $lookup_table[0]['look_up_y_n'] }}"> - {{ $look_up_y_n_DISPLAY }}
                            </div>

                            @error('look_up_y_n')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>


                    <div class="sm:col-span-4">
                        <label for="parts" class="block text-sm font-medium leading-6 text-gray-900">What part of
                            mushroom?</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input type="text" name="parts" id="parts"
                                       class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                       value="{{ $lookup_table[0]['parts'] }}"> - {{$parts->name}}
                            </div>

                            @error('parts')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>

                    <div class="sm:col-span-4">
                        <label for="source" class="block text-sm font-medium leading-6 text-gray-900">Source</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input type="text" name="source" id="source"
                                       class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                       value="{{ $lookup_table[0]['source'] }}"> - {{ $source->title }}
                            </div>

                            @error('source')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>

                    <input type="hidden" name="id" value="{{ $lookup_table[0]['id'] }}">
                </div>
            </div>
        </div>

        <div class="mt-6 flex items-center justify-between gap-x-6">
            <div class="flex items-center">
                <button form="delete-form" class="text-red-500 text-sm font-bold">Delete</button>
            </div>

            <div class="flex items-center gap-x-6">
                <a href="/lookups/{{ $lookup_table[0]['id'] }}" class="text-sm font-semibold leading-6 text-gray-900">Cancel</a>

                <div>
                    <button type="submit"
                            class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                        Update
                    </button>
                </div>
            </div>
        </div>
    </form>

    <form method="POST" action="/lookups/{{ $lookup_table[0]['id'] }}" id="delete-form" class="hidden">
        @csrf
        @method('DELETE')
    </form>
</x-layout>
