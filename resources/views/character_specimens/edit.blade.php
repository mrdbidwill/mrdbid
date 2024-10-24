@props([
'colors',
'color_character_names',
'list_of_set_characters',
'unset_characters',
'specimen_id'
])@php
    use App\Models\Lookup\Character;use App\Repositories\Lookup\CharacterRepository; use App\Utils\StringUtils;
@endphp
<x-layout>
    <x-specimens-nav-bar/>
    <x-notification message="{{ Session::get('message') }}"/>
    <p>resources/views/character_specimens/edit.blade.php</p>

    @php $list_of_set_characters_array[] = '';  @endphp
    @foreach ($list_of_set_characters as $list_of_set_character)
        @php    //dd($list_of_set_character);
        $list_of_set_characters_array[] = $list_of_set_character; @endphp
    @endforeach

    <div class="bg-gray-200 mx-auto max-w-7xl py-10 px-4 sm:px-6 lg:px-8">
        <div class="sm:flex sm:items-center">
            <div id="top">
                <div class="sm:flex-auto">
                    <h1 class="text-base font-semibold leading-6 text-black">Specimen ID: {{$specimen_id}}</h1>
                    <h3 class="text-base font-semibold leading-6 text-black">Character Specimens
                        (character_specimens/edit.blade.php) L19</h3>
                    <p class="mt-2 text-sm text-black">Use this list to add characters to your specimen. L20</p>
                </div>  <!-- end div top -->
            </div>
        </div>

        <div class="mt-8 flow-root">
            <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                <div class="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">

                    <p>display-existing-specimen-characters :specimen_id="$specimen_id"</p>
                    <x-display-existing-specimen-characters :specimen_id="$specimen_id"/>

                    <p>display-unset-characters :unset_characters="$unset_characters"</p>
                    <x-display-unset-characters :unset_characters="$unset_characters"/>

                    <p>display-character-by-display-option-switch :specimen_id="$specimen_id"</p>
                    <x-display-character-by-display-option-switch :specimen_id="$specimen_id"
                                                                  :unset_characters="$unset_characters"/>

                    <x-display-colors-top-characters-bottom-form-table :colors="$colors"
                                                                       :color_character_names="$color_character_names"
                                                                       :list_of_set_characters="$list_of_set_characters"
                                                                       :specimen_id="$specimen_id"/>

                </div>
            </div>
        </div>
    </div>
</x-layout>
