@php
    use App\Models\Lookup\Character;use App\Repositories\Lookup\CharacterRepository; use App\Utils\StringUtils;
@endphp
<x-layout>
    <x-specimens-nav-bar></x-specimens-nav-bar>
    <p>resources/views/character_specimens/edit.blade.php</p>
    @php
        // dd($specimenId);
    @endphp
    @if (Session::has('message'))
        <div class="text-3xl text-red-700">{{ Session::get('message') }}</div>
    @endif

    @php $list_of_set_characters_array[] = '';  @endphp
    @foreach ($list_of_set_characters as $list_of_set_character)
        @php    //dd($set_specimen);
        $list_of_set_characters_array[] = $list_of_set_character['character_id'];@endphp
            <!-- Add your form fields here to edit the specimen -->
    @endforeach

    <div class="bg-gray-200 mx-auto max-w-7xl py-10 px-4 sm:px-6 lg:px-8">         <!-- 1 -->
        <div class="sm:flex sm:items-center">                                                  <!-- 2 -->
            <div class="sm:flex-auto">    <!-- 3 -->
                <h1 class="text-base font-semibold leading-6 text-black">Specimen ID: {{$specimen_id}}</h1>
                <h3 class="text-base font-semibold leading-6 text-black">Character Specimens
                    (character_specimens/edit.blade.php) L19</h3>
                <p class="mt-2 text-sm text-black">Use this list to add characters to your specimen. L20</p>
            </div>                                                                             <!-- 2 -->
        </div>                                                                                 <!-- 1 -->

        <div class="mt-8 flow-root">                                                           <!-- 2 -->
            <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">                        <!-- 3 -->
                <div class="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">        <!-- 4 -->

                    <!-- display-existing-specimen-characters does not properly execute colors -->
                    <!-- so try display-switch feeding it list of existing characters for display -->
                    <x-display-existing-specimen-characters :specimenId="$specimen_id"/>


                    <x-display-switch :specimenId="$specimen_id"/>

                    <form method="POST" action="/character_specimens" id="color_character">
                        @csrf
                        <x-character-specimen-form :colors="$colors" :color_character_names="$color_character_names"
                                                   :list_of_set_characters="$list_of_set_characters_array"
                                                   :specimen_id="$specimen_id"/>
                    </form>
                    <!-- character_specimens/edit.blade.php Line  33  -->
                    @csrf


                    <!--      </form>  -->
                </div>      <!-- 3 -->
            </div>    <!-- 2 -->
        </div>                  <!-- 1 -->
    </div>        <!-- 0 -->
</x-layout>
