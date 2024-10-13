@php
    use App\Models\CharacterSpecimen;use App\Models\Lookup\Character;use App\Utils\StringUtils;
@endphp@props([
    'specimen_id',
    'unset_characters',
])

@php //dd($unset_characters); @endphp
<table class="min-w-full hover:table-fixed border-collapse border border-blue-700 p-4">
    <!-- begin display-character-by-display-option-switch.blade.php -->


    @php
        $characters = $unset_characters->sortBy('name');
        $color_character_names = array();
    @endphp

    <tbody>


    @foreach ($characters as $character)
        @php //dd($character->name); @endphp

        @switch($character->display_options)
            @case(1)
                <!-- ID - Do not display  -->

                @break

            @case(2)
                <!--  text box number mm is measure  NO Lookup table -->
                <tr>
                    <td class="border border-collapse border-gray-400 p-4">
                        <div id="character_{{ $character->id  }}">  <!-- div for tag -->

                            <form method="POST" action="{{ route('character_specimens.store') }}">
                                @csrf
                                @php $display_name = StringUtils::convert_table_name_for_display($character->name); @endphp
                                <label for="character_value"><b>{{ $display_name }}</b> (text box number mm is measure
                                    NO Lookup table)</label> <input type="number" id="character_value"
                                                                    name="character_value" value="">

                                @php //dd($character->id); @endphp
                                <input type="hidden" name="character_value" value="48"> <input type="hidden"
                                                                                               name="character_id"
                                                                                               value="{{ $character->id }}">
                                <input type="hidden" name="specimen_id" value="{{ $specimen_id }} ">

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
                                        Update
                                        Character: @php StringUtils::convert_table_name_for_display($character->name); @endphp
                                    </button>
                                @endif
                            </form>
                        </div>  <!-- end div for tag -->

                        @error('$character->name')
                        <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                        @php
                            // dd($character->name']);
                            //dd( old($character->name']));
                        @endphp
                        <div class="text-right text-orange-600 font-bold"><a href="#top">Top</a></div>
                    </td>
                </tr>
                @break


            @case(3)

                <!--  text box number um is measure   NO Lookup table -->
                <tr>
                    <td class="border border-collapse border-gray-400 p-4">
                        <div id="character_{{ $character->id  }}">  <!-- div for tag -->
                            @php $display_name = StringUtils::convert_table_name_for_display($character->name); @endphp
                            <label for="{{ $character->id }}"><b>{{ $display_name }}</b> (text box number um is measure)</label>

                            <input id="{{ $character->id }}" type="text" value="{{ old($character->name ) }}"
                                   class="@error('{{ $character->id }}') is-invalid @enderror">
                        </div>  <!-- end div for tag -->

                        @error('$character->name')
                        <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                        <button
                            class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                            type="submit">
                            Add Character
                        </button>
                        <div class="text-right text-orange-600 font-bold"><a href="#top">Top</a></div>
                    </td>
                </tr>
                @break

            @case(4)

                <!--  text box string   NO Lookup table -->
                <tr>
                    <td class="border border-collapse border-gray-400 p-4">
                        <div id="character_{{ $character->id  }}">  <!-- div for tag -->
                            @php $display_name = StringUtils::convert_table_name_for_display($character->name); @endphp
                            <label for="{{ $character->id }}"><b>{{$display_name }}</b> (text box string NO Lookup
                                table) : </label>

                            <input id="{{ $character->id }}" type="text" value="{{ old($character->name ) }}"
                                   class="@error('{{ $character->id }}') is-invalid @enderror">
                        </div>  <!-- end div for tag -->

                        @error('$character->name')
                        <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                        <button
                            class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                            type="submit">
                            Add Character
                        </button>
                        <div class="text-right text-orange-600 font-bold"><a href="#top">Top</a></div>
                    </td>
                </tr>
                @break

            @case(5)
                <!--  text box number general format for temperatures ph  etc    NO Lookup table -->
                <tr>
                    <td class="border border-collapse border-gray-400 p-4">
                        <div id="character_{{ $character->id  }}">  <!-- div for tag -->
                            @php $display_name = StringUtils::convert_table_name_for_display($character->name); @endphp
                            <label for="{{ $character->id }}"><b>{{ $display_name }}</b> (text box number general format
                                for temperatures ph etc NO Lookup table)</label>

                            <input id="{{ $character->id  }}" type="text" value="{{ old($character->name ) }}"
                                   class="@error('{{ $character->id }}') is-invalid @enderror">
                        </div>  <!-- end div for tag -->

                        @error('$character->name')
                        <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                        <button
                            class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                            type="submit">
                            Add Character
                        </button>
                        <div class="text-right text-orange-600 font-bold"><a href="#top">Top</a></div>
                    </td>
                </tr>
                @break

            @case(6)
                @php
                    $color_character_names[] = $character->name;

                @endphp

                @break

            @case(7)
                <!--  taste ALL taste characters use the tastes table-->
                <tr>
                    <td class="border border-collapse border-gray-400 p-4">
                        @php $display_taste = StringUtils::convert_table_name_for_display($character->name); @endphp
                        <p><b>{{ $display_taste }}</b> (taste table)</p>
                        @php
                            $data = DB::table( 'tastes' )->get();
                        @endphp
                        @foreach($data as $item)
                            <div id="character_{{ $character->id  }}">  <!-- div for tag -->
                                <input type="radio" id="{{ $item->id }}" name="{{ $character->name }}"
                                       value="{{ $item->id }}">
                                @php $display_name = StringUtils::convert_table_name_for_display($item->name); @endphp
                                <label for="{{ $item->id }}">{{ $display_name }}</label>
                            </div>  <!-- end div for tag -->
                            <br>
                        @endforeach
                        <input type="hidden" name="character_id" value="{{ $character->id }}">

                        <input type="hidden" name="specimen_id" value="{{ $specimen_id }}">

                        <input type="hidden" name="entered_by" value="{{ auth()->id()}}">

                        <button
                            class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                            type="submit">
                            Add Character
                        </button>
                        <div class="text-right text-orange-600 font-bold"><a href="#top">Top</a></div>
                    </td>
                </tr>
                @break

            @case(8)
                <!-- odor ALL odor characters use the odors table-->
                <tr>
                    <td class="border border-collapse border-gray-400 p-4">
                        <div id="character_{{ $character->id  }}">  <!-- div for tag -->
                            @php $display_name = StringUtils::convert_table_name_for_display($character->name); @endphp
                            <p><b>{{ $display_name }}</b> (odor table)</p></div>
                        @php
                            $data = DB::table( 'odors' )->get();
                        @endphp
                        <button
                            class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                            type="submit">
                            Add Character
                        </button>
                        <div class="text-right text-orange-600 font-bold"><a href="#top">Top</a></div>
                    </td>
                </tr>
                @break

            @case(9)
                <!--  radio USE LOOKUP TABLE -->
                <tr>
                    <td class="border border-collapse border-gray-400 p-4">
                        @php
                            if( ( $character->name ==  'cap_surface_dryness')  || ( $character->name ==  'genus' ) || ( $character->name ==  'gill_edges' )|| ( $character->name ==  'gill_thickness' )|| ( $character->name ==  'species' ) || ( $character->name ==  'veil_annulus' ) )
                            {
                            $data = DB::table( $character->name )->get();  // ALL from character Lookup table
                            }
                            else
                            {
                            $data = DB::table( $character->name.'s' )->get();
                            //dd($data);
                            }
                        @endphp

                        <div id="character_{{ $character->id  }}">  <!-- div for tag  -->
                            @php $display_name = StringUtils::convert_table_name_for_display($character->name); @endphp
                            <p><b>{{$display_name }}</b></p>
                        </div>   <!-- end div for tag -->

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
                                @php $display_name = StringUtils::convert_table_name_for_display($item->name); @endphp
                                <label for="{{$item->id}}">{{$display_name}}
                                    - {{$item->description}}</label>

                                <br>

                            @endforeach

                            <input type="hidden" name="character_id" value="{{ $character->id }}">

                            <input type="hidden" name="specimen_id" value="{{ $specimen_id }} ">


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

                        <div class="text-right text-orange-600 font-bold"><a href="#top">Top</a></div>
                    </td>
                </tr>
                @break

            @case(10)
                <!--  dropdown -->
                <tr>
                    <td class="border border-collapse border-gray-400 p-4">
                        <div id="character_{{ $character->id  }}">  <!-- div for tag -->
                            @php $display_name = StringUtils::convert_table_name_for_display($character->name); @endphp
                            <p><b>{{ $display_name }}</b> (dropdown)</p>
                        </div>  <!-- end div for tag -->
                        <button
                            class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                            type="submit">
                            Add Character
                        </button>
                        <div class="text-right text-orange-600 font-bold"><a href="#top">Top</a></div>
                    </td>
                </tr>
                @break

            @case(11)
                <!--  state -->
                <tr>
                    <td class="border border-collapse border-gray-400 p-4">
                        <div id="character_{{ $character->id  }}">   <!-- div for tag -->
                            @php $display_name = StringUtils::convert_table_name_for_display($character->name); @endphp
                            <p><b>{{ $display_name }}</b> (state table)</p>
                        </div>  <!-- end div for tag -->
                        <button
                            class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                            type="submit">
                            Add Character
                        </button>
                        <div class="text-right text-orange-600 font-bold"><a href="#top">Top</a></div>
                    </td>
                </tr>
                @break

            @case(12)
                <!-- country -->
                <tr>
                    <td class="border border-collapse border-gray-400 p-4">
                        <div id="character_{{ $character->id  }}">   <!-- div for tag -->
                            <p><b>{{ $character->name }}</b> (country table)</p>
                        </div>     <!-- end div for tag -->
                        <button
                            class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                            type="submit">
                            Add Character
                        </button>
                        <div class="text-right text-orange-600 font-bold"><a href="#top">Top</a></div>
                    </td>
                </tr>
                @break

            @case(13)
                <!--  texture -->
                <tr>
                    <td class="border border-collapse border-gray-400 p-4">
                        <div id="character_{{ $character->id  }}">    <!-- div for tag -->
                            @php $display_name = StringUtils::convert_table_name_for_display($character->name); @endphp
                            <p><b>{{ $display_name }}</b> (texture table)</p>
                        </div>   <!-- end div for tag -->
                        <button
                            class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                            type="submit">
                            Add Character
                        </button>
                        <div class="text-right text-orange-600 font-bold"><a href="#top">Top</a></div>
                    </td>
                </tr>
                @break
            @case(14)
                <!-- yes_no  -->
                <tr>
                    <td class="border border-collapse border-gray-400 p-4">
                        <div id="character_{{ $character->id  }}">   <!-- div for tag -->
                            @php $display_name = StringUtils::convert_table_name_for_display($character->name); @endphp
                            <p><b>{{ $display_name }}</b> (yes_no)</p>
                        </div>   <!-- end div for tag -->
                        <button
                            class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                            type="submit">
                            Add Character
                        </button>
                        <div class="text-right text-orange-600 font-bold"><a href="#top">Top</a></div>
                    </td>
                </tr>
                @break
            @case(15)
                <!--  abundance -->
                <tr>
                    <td class="border border-collapse border-gray-400 p-4">
                        <div id="character_{{ $character->id  }}">   <!-- div for tag -->
                            @php $display_name = StringUtils::convert_table_name_for_display($character->name); @endphp
                            <p><b>{{ $display_name }}</b> (abundance table)</p>
                        </div>    <!-- div for tag -->
                        <button
                            class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                            type="submit">
                            Add Character
                        </button>
                        <div class="text-right text-orange-600 font-bold"><a href="#top">Top</a></div>
                    </td>
                </tr>
                @break
            @case(16)
                <!--  text box number grams measurement -->
                <tr>
                    <td class="border border-collapse border-gray-400 p-4">
                        <div id="character_{{ $character->id  }}">   <!-- div for tag -->
                            @php $display_name = StringUtils::convert_table_name_for_display($character->name); @endphp
                            <p><b>{{ $display_name }}</b> (text box number grams measurement)</p>
                        </div>   <!-- div for tag -->
                        <button
                            class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                            type="submit">
                            Add Character
                        </button>
                        <div class="text-right text-orange-600 font-bold"><a href="#top">Top</a></div>
                    </td>
                </tr>
                @break
            @case(17)
                @php //dd($character);
                    $current_value = '';
                @endphp

                    <!--  genus and species autocomplete -->
                <tr>
                    <td class="border border-collapse border-gray-400 p-4">
                        <div id="character_{{ $character->id  }}">  <!-- div for tag  -->Genus! Species!
                            @if ($character->name === 'genus')
                                @component('components.autocomplete', ['type' => 'genus', 'value' => $current_value])
                                @endcomponent
                            @elseif ($character->name === 'species')
                                @component('components.autocomplete', ['type' => 'species', 'value' => $current_value])
                                @endcomponent
                            @else
                                Invalid Input!
                            @endif
                            <button
                                class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                                type="submit">
                                Add Character
                            </button>
                            <div class="text-right text-orange-600 font-bold"><a href="#top">Top</a></div>
                        </div>   <!-- div for tag  -->
                    </td>
                </tr>
                @break
            @default
                <!--       Default case... -->
                <tr>
                    <td class="border border-collapse border-gray-400 p-4">
                        <p><b>{{ $character->name }} Default case</b></p>
                    </td>
                </tr>
        @endswitch

    @endforeach


    </tbody>

</table>     <!-- end display-character-by-display-option-switch.blade.php --><?php
