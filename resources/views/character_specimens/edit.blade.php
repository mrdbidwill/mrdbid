<x-layout>
    <x-slot:heading>
        Character Listings
    </x-slot:heading>

    <div class="bg-gray-100">
        <div class="mx-auto max-w-7xl">
            <div class="bg-gray-300 py-10">
                <div class="px-4 sm:px-6 lg:px-8">
                    <div class="sm:flex sm:items-center">
                        <div class="sm:flex-auto">
                            <h1 class="text-base font-semibold leading-6 text-black">Character Specimens
                                (character_specimens/edit.blade.php)</h1>
                            <p class="mt-2 text-sm text-black">Use this list to add characters to your specimen.</p>
                        </div>
                    </div>

                    <div class="mt-8 flow-root">
                        <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                            <div class="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">

                                <x-display_existing_specimen_characters :specimenID="$specimenId"/>

                                <table class="min-w-full divide-y divide-gray-700">
                                    <thead>
                                    <tr>
                                        <th scope="col"
                                            class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-black sm:pl-0">
                                            <br>
                                        </th>
                                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-black">
                                            <br>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody class="divide-y divide-gray-800">
                                    {{-- Add your rows here --}}
                                    </tbody>
                                </table>

                                @php $colors = DB::table('colors')->get(); @endphp
                                <table>
                                    <thead>
                                    <tr>
                                        <th colspan="10">Colors from AMS Color Chart</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($colors as $index => $color)
                                        @if($index % 10 == 0)
                                            @if($index != 0)
                                                </tr>
                                    @endif
                                    <tr>
                                        @endif
                                        <td>
                                            {{ $index + 1 }}.
                                            <img
                                                src="{{ url('storage/images/AMS_colors/banner_50x50/banner_'.($index + 1).'.jpg') }}"
                                                alt="{{ $color->latin_name }}">
                                            <input type="radio" id="{{ $index + 1 }}" name="{{ $color->latin_name }}"
                                                   value="{{ $index + 1 }}">
                                            <label for="{{ $index + 1 }}">{{ $color->latin_name }}</label>
                                        </td>
                                    @endforeach
                                    </tbody>
                                </table>

                                @php
                                    $color_character_names = DB::table('characters')->where( 'display_options', '==',  6 )->get();
                                @endphp

                                <table class="min-w-full divide-y divide-gray-700">
                                    <thead>
                                    <tr>
                                        <th scope="col" colspan="10"
                                            class="px-3 py-3.5 text-left text-sm font-semibold text-black">
                                            Color Character Names
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody class="divide-y divide-gray-800">
                                    @foreach($color_character_names as $index => $name)
                                        @if($index % 3 == 0)
                                            @if($index != 0)
                                                </tr>
                                    @endif
                                    <tr>
                                        @endif
                                        <td class="whitespace-nowrap px-3 py-4 text-sm text-black">{{ $index }} {{ $name }}</td>
                                        @endforeach
                                        @if(count($color_character_names) % 3 != 0)
                                    </tr>
                                    @endif
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-layout>
