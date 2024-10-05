<table class="min-w-full divide-y divide-gray-700">    <!-- begin display-switch.blade.php -->
    <thead>
    <tr>
        <th scope="col" class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-black sm:pl-0">
            ID
        </th>
        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-black">
            Name
        </th>
    </tr>
    </thead>

    @php
        use App\Models\CharacterSpecimen;use App\Models\Lookup\Character;use App\Utils\StringUtils;
        $characters = Character::get();
        $color_character_names = array();
    @endphp

    <tbody class="divide-y divide-gray-800">


    @foreach ($characters as $character)
        <tr>
            <td>

                @switch($character->display_options)
                    @case(1)
                        <!--  Do not display  -->
                        @break

                    @case(2)
                        <!--  text box number mm is measure  NO Lookup table -->

                        <label for="{{ $character->id }}">{{$character->name}}
                            : </label>


                        <input id="{{ $character->id }}" type="text" value="{{ old($character->name) }}"
                               class="@error('{{ $character->id }}') is-invalid @enderror">


                        @error('$character->name')
                        <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                        @php
                            // dd($character->name']);
                            //dd( old($character->name']));
                        @endphp
                        <button
                            class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                            type="submit">
                            Add Character
                        </button>
                        @break

                    @case(3)
                        <!--  text box number um is measure   NO Lookup table -->
                        <label for="{{ $character->id }}">{{ $character->name }}
                            : </label>

                        <input id="{{ $character->id }}" type="text" value="{{ old($character->name ) }}"
                               class="@error('{{ $character->id }}') is-invalid @enderror">


                        @error('$character->name')
                        <div class="alert alert-danger">{{ $message }}</div>
                        @enderror

                        @break

                    @case(4)
                        <!--  text box string   NO Lookup table -->
                        <label for="{{ $character->id }}">{{$character->name }}
                            : </label>

                        <input id="{{ $character->id }}" type="text" value="{{ old($character->name ) }}"
                               class="@error('{{ $character->id }}') is-invalid @enderror">


                        @error('$character->name')
                        <div class="alert alert-danger">{{ $message }}</div>
                        @enderror

                        @break

                    @case(5)
                        <!--  text box number general format for temperatures ph  etc    NO Lookup table -->
                        <label for="{{ $character->id }}">{{ $character->name }}
                            : </label>

                        <input id="{{ $character->id  }}" type="text" value="{{ old($character->name ) }}"
                               class="@error('{{ $character->id }}') is-invalid @enderror">


                        @error('$character->name')
                        <div class="alert alert-danger">{{ $message }}</div>
                        @enderror

                        @break

                    @case(6)
                        <!--  color  ALL color characters use the colors table-->
                        <!-- <p>Color Table: I'm working here!</p> -->
                        <!-- print all colors one time BELOW with color character names -->
                        <!-- <p>{{ $character->name }}: color</p>  -->
                        @php
                            //    $color_character_names = array();  // declared above
                                $color_character_names[] = $character->name;
                        @endphp
                        @break

                    @case(7)
                        <!--  taste ALL taste characters use the tastes table-->
                        <p>{{ $character->name }}: taste</p>
                        @php
                            $data = DB::table( 'tastes' )->get();
                        @endphp
                        @foreach($data as $item)
                            <input type="radio" id="{{ $item->id }}" name="{{ $character->name }}"
                                   value="{{ $item->id }}">
                            <label for="{{ $item->id }}">{{ $item->name }}</label>
                            <br>
                        @endforeach
                        <input type="hidden" name="character_id" value="{{ $character->id }}">

                        <input type="hidden" name="specimen_id" value="{{ $specimenId }}">

                        <input type="hidden" name="entered_by" value="{{ auth()->id()}}">

                        <button
                            class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                            type="submit">
                            Add Character
                        </button>

                        @break

                    @case(8)
                        <!-- odor ALL odor characters use the odors table-->
                        <p>{{ $character->name }}: odor</p>
                        @php
                            $data = DB::table( 'odors' )->get();
                        @endphp
                        @break

                    @case(9)
                        <!--  radio USE LOOKUP TABLE -->
                        @php
                            if( ( $character->name ==  'cap_surface_dryness')  || ( $character->name ==  'genus' ) || ( $character->name ==  'gill_thickness' )|| ( $character->name ==  'species' ) || ( $character->name ==  'veil_annulus' ) )
                            {
                            $data = DB::table( $character->name )->get();  // ALL from character Lookup table
                            }
                            else
                            {
                            $data = DB::table( $character->name.'s' )->get();
                            //dd($data);
                            }


                        @endphp

                        <p>Character Name: {{$character->name }}</p>



                        <form method="POST" action="{{ route('character_specimens.store') }}">
                            @csrf

                            @foreach($data as $item)

                                @php
                                    //dd($data);  // all data
                                    //dd($item);    // one item
                                       $select = CharacterSpecimen::where('character_id', $character->id )->first();

                                       //dd($select);
                                //dd($request->session()->all());

                                @endphp

                                <input type="radio" id="{{ $item->id }}" name="character_value"

                                       @if((isset($select->character_value) && ($item->id == $select->character_value)) ||
                                           (isset($select->character_value) && ($select->character_value == 'Not Entered')) ||
                                           (!isset($select->character_value) && ($item->name == 'Not Entered')))
                                           checked @endif

                                       value="{{$item->id}}">
                                <label for="{{$item->id}}">{{$item->name}}
                                    - {{$item->description}}</label>
                                <br>

                            @endforeach

                            <input type="hidden" name="character_id" value="{{ $character->id }}">

                            <input type="hidden" name="specimen_id" value="{{ $specimenId }} ">

                            <input type="hidden" name="entered_by" value="{{ auth()->id() }}">

                            @php //dd($select); @endphp

                            @if(   (isset($select->value)  &&   ( $select->value == '1')) || (!isset($select->value)) )
                                <button
                                    class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                                    type="submit">
                                    Add Character
                                </button>
                            @else
                                <button
                                    class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                                    type="submit">
                                    Update Character:
                                    @php StringUtils::convert_table_name_for_display($character->name); @endphp
                                </button>
                            @endif


                        </form>


                        @break

                    @case(10)
                        <!--  dropdown -->
                        <p>{{ $character->name }}: dropdown</p>
                        @break

                    @case(11)
                        <!--  state -->
                        <p>{{ $character->name }}: state</p>
                        @break

                    @case(12)
                        <!-- country -->
                        <p>{{ $character->name }}: country</p>
                        @break

                    @case(13)
                        <!--  texture -->
                        <p>{{ $character->name }}: texture</p>
                        @break
                    @case(14)
                        <!-- yes_no  -->
                        <p>{{ $character->name }}: yes_no</p>
                        @break
                    @case(15)
                        <!--  abundance -->
                        <p>{{ $character->name }}: abundance</p>
                        @break
                    @case(16)
                        <!--  text box number grams measurement -->
                        <p>{{ $character->name }}: text box number grams measurement</p>
                        @break
                    @case(17)
                        <!--  genus and species autocomplete -->
                        <p>{{ $character->name }}: on line 257 of display-switch.blade.php </p>

                        <!-- resources/views/character_specimens/display-switch.blade.php -->
                        @if ($character->name === 'genus' && $character->display_option == 17)
                            @component('components.autocomplete', ['type' => 'genus', 'value' => $current_value])
                            @endcomponent
                        @elseif ($character->name === 'species' && $character->display_option == 17)
                            @component('components.autocomplete', ['type' => 'species', 'value' => $current_value])
                            @endcomponent
                        @endif
                        @break
                    @default
                        <!--       Default case... -->
                        <p>{{ $character->name }}: Default case</p>
                @endswitch

            </td>
        </tr>
    @endforeach


    </tbody>

</table>     <!-- end display-switch.blade.php --><?php
