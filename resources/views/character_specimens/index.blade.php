<x-layout>
    <x-specimens-nav-bar></x-specimens-nav-bar>
    <div class="bg-gray-100">    <!--  bg-gray-100 no effect?-->
        <div class="mx-auto max-w-7xl">
            <div class="bg-gray-300 py-10"> <!-- bg-gray-300 works-->
                <div class="px-4 sm:px-6 lg:px-8">
                    <div class="sm:flex sm:items-center">
                        <div class="sm:flex-auto">
                            <h1 class="text-base font-semibold leading-6 text-black">Character-Specimens
                                (character_specimens/index.blade.php)</h1>

                            <p class="mt-2 text-xl text-black">When you created this specimen, you entered the <b>required</b>
                                basic
                                characters that you should have for every specimen. After the initial entry, those are
                                done for the time being.
                                As always, the basic characters can be edited, if needed.</p>

                            <p class="mt-2 text-xl text-black">The characters listed below on this page are <b>all
                                    optional</b>.
                                While it is obvious that a specimen
                                with no characters is not very useful, which ones you enter <u>and when</u> are up to
                                you.</p>

                            <p class="mt-2 text-xl text-black">One of the goals or maybe a by product of the MRDBID
                                process
                                will be the creation of a standard
                                set of characters. If you do not see the character you need, email a well defined
                                explanation, including the source, and it can be added. </p>

                            <p class="mt-2 text-xl text-black">MRDBID is not trying to be any type of "gatekeeper" of
                                character knowledge. Keep in mind that the database is set up to allow for searching
                                comparisons of specimens. "Slightly hairy" and "somewhat hairy" and "not very hairy"
                                seem to say the same thing, but are 3 different rows in a database to attempt to match
                                up.</p>

                            <p class="mt-2 text-xl text-black">I added a cap_color_2 and cap_color_3 because I can
                                see
                                that may be helpful for that <u>one</u> main "cap color" character. It will get unwieldy
                                quickly if I did that to many characters.</p>

                            <p class="mt-2 text-xl text-black">That said, I do not have a limit on the number of
                                helpful
                                characters that knowledgeable people want to add as useful identification tools.</p>

                            <p class="mt-2 text-xl text-black">Below is a list of characters. Due to the (ongoing)
                                design of this website and the desire to streamline the process of managing specimens,
                                additions to each specimen are now done when you are looking at the specimen data. Below
                                is just informational. However, the list below should remain up to date.</p>

                            <p class="mt-2 text-xl text-black">Also note how many characters have a prefilled list of
                                possible options. These options are stored in what I call "lookup tables". If you
                                propose a new character and it has these type options particular to that table, please
                                include them with any correspondence proposing new character(s). A csv format would be
                                great. If you don't know what that is, send what you got and I will try to work with
                                it.</p>

                        </div>
                    </div>
                    <div class="mt-8 flow-root">
                        <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                            <div class="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">


                                <table class="min-w-full divide-y divide-gray-700">
                                    <thead>
                                    <tr>
                                        <th scope="col"
                                            class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-black sm:pl-0">
                                            ID
                                        </th>
                                        <th scope="col"
                                            class="px-3 py-3.5 text-left text-sm font-semibold text-black">
                                            Name
                                        </th>
                                    </tr>
                                    </thead>

                                    @php  $color_character_names = array(); @endphp
                                    <tbody class="divide-y divide-gray-800">


                                    @foreach ($characters as $character)
                                        <tr>
                                            <td>
                                                <!-- display all of the switch cases as a grid  -->


                                                @switch($character['display_options'])
                                                    @case(1)
                                                        <!--  Do not display  -->
                                                        <!-- <p>{{$character['name']}}: Do not display</p> -->
                                                        @break

                                                    @case(2)
                                                        <!--  text box number mm is measure  NO Lookup table -->
                                                        <label for="{{$character['id']}}">{{$character['name']}}
                                                            : </label>


                                                        <input id="{{ $character['id'] }}"
                                                               type="text"
                                                               value="{{ old($character['name']) }}"
                                                               class="@error('{{ $character->id }}') is-invalid @enderror">


                                                        @error('$character->name')
                                                        <div class="alert alert-danger">{{ $message }}</div>
                                                        @enderror
                                                        @break

                                                    @case(3)
                                                        <!--  text box number um is measure   NO Lookup table -->
                                                        <label for="{{$character['id']}}">{{$character['name']}}
                                                            : </label>

                                                        <input id="{{ $character['id'] }}"
                                                               type="text"
                                                               value="{{ old($character['name']) }}"
                                                               class="@error('{{ $character->id }}') is-invalid @enderror">


                                                        @error('$character->name')
                                                        <div class="alert alert-danger">{{ $message }}</div>
                                                        @enderror

                                                        @break

                                                    @case(4)
                                                        <!--  text box string   NO Lookup table -->
                                                        <label for="{{$character['id']}}">{{$character['name']}}
                                                            : </label>

                                                        <input id="{{ $character['id'] }}"
                                                               type="text"
                                                               value="{{ old($character['name']) }}"
                                                               class="@error('{{ $character->id }}') is-invalid @enderror">


                                                        @error('$character->name')
                                                        <div class="alert alert-danger">{{ $message }}</div>
                                                        @enderror

                                                        @break

                                                    @case(5)
                                                        <!--  text box number general format for temperatures ph  etc    NO Lookup table -->


                                                        <label for="{{$character['id']}}">{{$character['name']}}
                                                            : </label>

                                                        <input id="{{ $character['id'] }}"
                                                               type="text"
                                                               value="{{ old($character['name']) }}"
                                                               class="@error('{{ $character->id }}') is-invalid @enderror">


                                                        @error('$character->name')
                                                        <div class="alert alert-danger">{{ $message }}</div>
                                                        @enderror

                                                        @break

                                                    @case(6)
                                                        <!--  color  ALL color characters use the colors table-->
                                                        <!-- <p>Color Table: I'm working here!</p> -->
                                                        <!-- print all colors one time BELOW with color character names -->
                                                        <!-- <p>{{$character['name']}}: color</p>  -->
                                                        @php
                                                            //    $color_character_names = array();  // declared above
                                                                $color_character_names[] = $character['name'];
                                                        @endphp
                                                        @break

                                                    @case(7)
                                                        <!--  taste ALL taste characters use the tastes table-->
                                                        <p>{{$character['name']}}: taste</p>
                                                        @php
                                                            $data = DB::table( 'tastes' )->get();
                                                        @endphp
                                                        @foreach($data as $item)
                                                            <input type="radio" id="{{$item->id}}"
                                                                   name="{{$character['name']}}"
                                                                   value="{{$item->id}}">
                                                            <label
                                                                for="{{$item->id}}">{{$item->name}}</label>
                                                            <br>
                                                        @endforeach
                                                        @break

                                                    @case(8)
                                                        <!-- odor ALL odor characters use the odors table-->
                                                        <p>{{$character['name']}}: odor</p>
                                                        @php
                                                            $data = DB::table( 'odors' )->get();
                                                        @endphp
                                                        @break

                                                    @case(9)
                                                        <!--  radio USE LOOKUP TABLE -->
                                                        @php
                                                            if( ( $character['name'] ==  'cap_surface_dryness')  || ( $character['name'] ==  'genus' ) || ( $character['name'] ==  'gill_thickness' )|| ( $character['name'] ==  'species' ) || ( $character['name'] ==  'veil_annulus' ) )
                                                            {
                                                            $data = DB::table( $character['name'] )->get();
                                                            }
                                                            else
                                                            {
                                                            $data = DB::table( $character['name'].'s' )->get();
                                                            //dd($data);
                                                            }
                                                        @endphp

                                                        <p>Character Name: {{$character['name']}}</p>



                                                        <form method="POST"
                                                              action="{{ route('character_specimens.store') }}">
                                                            @csrf

                                                            @foreach($data as $item)
                                                                <input type="hidden" name="character_id"
                                                                       value="{{$character['id']}}">

                                                                <input type="radio" id="{{$item->id}}"
                                                                       name="{{$character['name']}}"
                                                                       value="{{$item->id}}">
                                                                <label
                                                                    for="{{$item->id}}">{{$item->name}}
                                                                    - {{$item->description}}</label>
                                                                <br>

                                                            @endforeach
                                                            <!-- <input type="submit" value="Submit">
                                                        </form> -->




                                                            @break

                                                            @case(10)
                                                                <!--  dropdown -->
                                                                <p>{{$character['name']}}: dropdown</p>
                                                                @break

                                                            @case(11)
                                                                <!--  state -->
                                                                <p>{{$character['name']}}: state</p>
                                                                @break

                                                            @case(12)
                                                                <!-- country -->
                                                                <p>{{$character['name']}}: country</p>
                                                                @break

                                                            @case(13)
                                                                <!--  texture -->
                                                                <p>{{$character['name']}}: texture</p>
                                                                @break
                                                            @case(14)
                                                                <!-- yes_no  -->
                                                                <p>{{$character['name']}}: yes_no</p>
                                                                @break
                                                            @case(15)
                                                                <!--  abundance -->
                                                                <p>{{$character['name']}}: abundance</p>
                                                                @break
                                                            @case(16)
                                                                <!--  text box number grams measurement -->
                                                                <p>{{$character['name']}}: text box number grams
                                                                    measurement</p>
                                                                @break
                                                            @default
                                                                <!--       Default case... -->
                                                                <p>{{$character['name']}}: Default case</p>
                                                @endswitch

                                            </td>
                                        </tr>
                                    @endforeach

                                    </tbody>

                                </table>

                                @php
                                    $colors =  DB::table('colors')->get();
                                    //dd($colors);
                                @endphp
                                <table>
                                    <thead>
                                    <tr>
                                        <th colspan="10">Colors from
                                            AMS Color Chart
                                        </th>

                                    </tr>
                                    </thead>
                                    <tbody>

                                    <tr>
                                        @for ($i = 1; $i < 51; $i++)
                                            @php $array_num = $i - 1; @endphp
                                            @if($i % 10 == 1 && $i != 1)</tr>
                                    <tr>@endif
                                        <td>{{$i}}. <img
                                                src="{{url('storage/images/AMS_colors/banner_50x50/banner_'.$i.'.jpg ')}}"
                                                alt="{{$colors[$array_num]->latin_name}}">
                                            <input type="radio" id="{{$i}}" name="{{$colors[$array_num]->latin_name }}"
                                                   value="{{$i}}">
                                            <label for="{{$i}}">{{$colors[$array_num]->latin_name}}</label>
                                        </td>
                                        @endfor

                                    </tr>
                                    </tbody>
                                </table>


                                <table class="min-w-full divide-y divide-gray-700">
                                    <thead>
                                    <tr>
                                        <th scope="col" colspan="10"
                                            class="px-3 py-3.5 text-left text-sm font-semibold text-black">Color
                                            Character Names
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody class="divide-y divide-gray-800">
                                    <tr class="divide-y divide-gray-800">
                                        @php
                                            //dd($color_character_names);
                                               $num_color_character_names = count($color_character_names);
                                               //dd($color_character_names);
                                        @endphp


                                        @for ($ct = 0; $ct <$num_color_character_names; $ct++)
                                            @php
                                                if($ct % 3 == 1 && $ct != 1)
                                                {
                                                echo '</tr><tr>';
                                                    }
                                            @endphp
                                            <td class="whitespace-nowrap px-3 py-4 text-sm text-black">
                                                {{ $ct  }}  {{$color_character_names[$ct] }}</td>

                                        @endfor
                                    </tr>
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
