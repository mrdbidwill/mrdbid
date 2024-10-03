@php
    use App\Models\Lookup\Character;use App\Repositories\Lookup\CharacterRepository; use \App\Utils\StringUtils; ;
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

    @php $list_of_set_characters[] = '';  @endphp
    @foreach ($set_specimens as $set_specimen)
        @php    //dd($set_specimen);
        $list_of_set_characters[] = $set_specimen['character_id'];@endphp
            <!-- Add your form fields here to edit the specimen -->
    @endforeach

    <div class="bg-gray-200 mx-auto max-w-7xl py-10 px-4 sm:px-6 lg:px-8">         <!-- 1 -->
        <div class="sm:flex sm:items-center">                                                  <!-- 2 -->
            <div class="sm:flex-auto">    <!-- 3 -->
                <h1 class="text-base font-semibold leading-6 text-black">Specimen ID: {{$specimenId}}</h1>
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
                    <x-display-existing-specimen-characters :specimenId="$specimenId"/>


                    <x-display-switch :specimenId="$specimenId"/>

                    @php $colors = DB::table('colors')->get(); @endphp
                    <form method="POST" action="/character_specimens" id="color_character">
                        <!-- character_specimens/edit.blade.php Line  33  -->
                        @csrf
                        <table>      <!-- character_specimens/edit.blade.php Line 35 -->
                            <thead>
                            <tr>
                                <th colspan="10">Colors from AMS Color Chart L38</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td colspan="10">Select which color for which character. L43</td>
                            </tr>
                            <tr>
                                @foreach($colors as $index => $color)
                                    @if($index % 10 == 0)
                                        @if($index != 0)
                            </tr>
                            @endif
                            <tr>
                                @endif
                                @php
                                    $image_address_banner =  url('storage/images/AMS_colors/banner_50x50/banner_'.($index + 1).'.jpg');
                                    $image_address_big    =  url('storage/images/AMS_colors/color_big/color_big_'.($index + 1).'.jpg');
                                @endphp
                                <td>
                                    {{ $index + 1 }}. <label for="color">{{ $color->latin_name }}</label><br> <input
                                        type="radio" id="color" name="color" value="{{ $index + 1 }}"><br> <input
                                        type="hidden" id="color" name="color" value="{{ $index + 1 }}"> <img
                                        class="h-100 w-100" src="{{ $image_address_banner }}"
                                        alt="{{ $image_address_banner }}" data-banner="{{ $image_address_banner }}"
                                        data-big="{{ $image_address_big }}" onclick="toggleColorImage(this)">

                                </td>
                                @endforeach
                            </tr>
                            </tbody>
                        </table> <!-- character_specimens/edit.blade.php Line  78  -->

                        @php
                            //$color_character_names = DB::table('characters')->where( 'display_options', '==',  6 )->get();
                            $color_character_names = Character::where('display_options', 6)->get();
                            //dd($color_character_names);
                        @endphp

                        <table class="min-w-full divide-y divide-gray-700">
                            <!-- character_specimens/edit.blade.php Line  87 -->
                            <tr>
                                @foreach($color_character_names as $key => $color_character_name)

                                    @if(!in_array( $color_character_name['id'], $list_of_set_characters ))


                                        {{-- Open a new row every 3 items --}}
                                        @if ($key % 3 == 0)
                                            @if ($key != 0)
                            </tr> {{-- Close the previous row if it's not the first row --}}
                            @endif
                            <tr>
                                @endif


                                <td class="whitespace-nowrap px-3 py-4 text-sm text-black">
                                    @php
                                        //dd($index);
                                        //dd($name);

                                        $characterRepository = new CharacterRepository();

                                        $display_name =  StringUtils::convert_table_name_for_display( $color_character_name['name'] );
                                    @endphp

                                    {{$key}}
                                    <input type="radio" id="character" name="character"
                                           value="{{ $color_character_name['id'] }}"> <label
                                        for="{{$color_character_name['name']}}">{{ $display_name }}</label>
                                </td>


                                @endif <!-- {{--  @if(!in_array( $name['id'], $list_of_set_characters )) --}} -->
                                @endforeach
                                {{-- Ensure proper closing of the last row if items aren't divisible by 3 --}}
                                @if (count($color_character_names) % 3 != 0)
                            </tr>
                            @endif
                        </table> <!-- character_specimens/edit.blade.php Line  121 -->

                        <input type="hidden" name="specimen_id" value="{{ $specimenId }}">

                        <div>   <!-- 5 -->

                            <button type="submit"
                                    class="bg-blue-300 rounded p-1 border border-slate-400 hover:bg-blue-500 hover:text-white">
                                Submit
                            </button>
                        </div>   <!-- 4 -->

                    </form> <!-- character_specimens/edit.blade.php Line 133  -->
                </div>      <!-- 3 -->
            </div>    <!-- 2 -->
        </div>                  <!-- 1 -->
    </div>        <!-- 0 -->
</x-layout>
