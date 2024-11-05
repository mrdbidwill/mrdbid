@php
    use App\Models\CharacterSpecimen;use App\Models\Lookup\Character;use App\Utils\StringUtils;
@endphp

@props([
   'specimen_id',
   'unset_characters',
])

@php  //dd($specimen_id); @endphp

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

        @if( $character->display_options != 6 )
            <tr>
                <td class="border border-collapse border-gray-400 p-4">
                    <form method="POST" action="{{ route('character_specimens.store') }}">
                        @csrf
        @endif

        @switch($character->display_options)
            @case(1)
                <!-- ID - Do not display  -->

                @break

            @case(2)
                <!--  text box number mm is measure  NO Lookup table -->

                 @php $display_name = StringUtils::convert_table_name_for_display($character->name); @endphp
                 <div id="character_{{ $character->id  }}">  <!-- div for tag -->
                 <label for="character_value"><b>{{ $display_name }}</b></label>

                 <input type="number"
                         id="character_value"
                         name="character_value"
                         value="">
                 </div>   <!-- end div for tag -->
                         @error('$character->name')
                         <div class="alert alert-danger">{{ $message }}</div>
                         @enderror
                         <input type="hidden" name="character_id" value="{{ $character->id }}">

                         <input type="hidden" name="specimen_id" value="{{ $specimen_id }}">

                         <input type="hidden" name="entered_by" value="{{ auth()->id()}}">

                @break


            @case(3)

                <!--  text box number um is measure   NO Lookup table -->
                @php
                    //dd($character->name);
                @endphp
                text box number um is measure   NO Lookup table
                                @php $display_name = StringUtils::convert_table_name_for_display($character->name); @endphp
                                <div id="character_{{ $character->id  }}">  <!-- div for tag -->
                                <label for="character_value"><b>{{ $display_name }}</b></label>
                                 <input type="number"
                                                    id="character_value"
                                                    name="character_value"
                                                    value="">
                                 </div>   <!-- end div for tag -->

                                @error('$character->name')
                                <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                                <input type="hidden" name="character_id" value="{{ $character->id }}">

                                <input type="hidden" name="specimen_id" value="{{ $specimen_id }}">

                                <input type="hidden" name="entered_by" value="{{ auth()->id()}}">

                @break

            @case(4)

                <!--  text box string   NO Lookup table -->

                                @php $display_name = StringUtils::convert_table_name_for_display($character->name); @endphp
text box string   NO Lookup table
                                <div id="character_{{ $character->id  }}">  <!-- div for tag -->
                                <label for="character_value"><b>{{ $display_name }}</b></label> <input type="text"
                                                                                                       id="character_value"
                                                                                                       name="character_value"
                                                                                                       value="">
                                </div>   <!-- end div for tag -->
                                @error('$character->name')
                                <div class="alert alert-danger">{{ $message }}</div>
                                @enderror

                                <input type="hidden" name="character_id" value="{{ $character->id }}">

                                <input type="hidden" name="specimen_id" value="{{ $specimen_id }}">

                                <input type="hidden" name="entered_by" value="{{ auth()->id()}}">

                @break

            @case(5)
                <!--  text box number general format for temperatures ph  etc    NO Lookup table -->
text box number general format for temperatures ph  etc    NO Lookup tabl
                                <div id="character_{{ $character->id  }}">  <!-- div for tag -->
                                <label for="character_value"><b>{{ $display_name }}</b></label> <input type="number"
                                                                                                       id="character_value"
                                                                                                       name="character_value"
                                                                                                       value="">
                                </div>   <!-- end div for tag -->
                                @error('$character->name')
                                <div class="alert alert-danger">{{ $message }}</div>
                                @enderror

                                @error('$character->name')
                                <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                                <input type="hidden" name="character_id" value="{{ $character->id }}">

                                <input type="hidden" name="specimen_id" value="{{ $specimen_id }}">

                                <input type="hidden" name="entered_by" value="{{ auth()->id()}}">


                @break

            @case(6)
            colors
                @php

                    $color_character_names[] = $character->name;
                @endphp

                @break

            @case(7)
                <!--  taste ALL taste characters use the tastes table-->
                        @php $display_taste = StringUtils::convert_table_name_for_display($character->name); @endphp
                                <p><b>{{ $display_taste }}</b> (taste table)</p>
                                @php
                                    $data = DB::table( 'tastes' )->get();
                                @endphp
                                <div id="character_{{ $character->id  }}">   <!-- div for tag -->
                                @foreach($data as $item)
                                <input type="radio" name="character_value" id="character_value" value="{{ $item->id }}">
                                <label for="character_value">{{$item->name}}</label><br>
                                </div>   <!-- end div for tag -->
                               @endforeach

                                @error('$character->name')
                                <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                                <input type="hidden" name="character_id" value="{{ $character->id }}">

                                <input type="hidden" name="specimen_id" value="{{ $specimen_id }}">

                                <input type="hidden" name="entered_by" value="{{ auth()->id()}}">

                @break

            @case(8)
                <!-- odor ALL odor characters use the odors table-->
                @php $display_odor = StringUtils::convert_table_name_for_display($character->name); @endphp
                                <p><b>{{ $display_odor }}</b> (odor table)</p>
                                @php
                                    $data = DB::table( 'odors' )->get();
                                @endphp
                                @foreach($data as $item)
                                    @php
                                        // dd($item);
                                    @endphp
                                    <input type="radio" id="character_value" name="character_value"
                                           value="{{ $item->id }}">
                                    @php $display_name = StringUtils::convert_table_name_for_display($item->name); @endphp
                                    <div id="character_{{ $character->id  }}">  <!-- div for tag -->
                                    <label for="character_value">{{ $display_name }}</label>
                                </div>   <!-- end div for tag -->
                                    <br>
                                @endforeach

                                @error('$character->name')
                                <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                                <input type="hidden" name="character_id" value="{{ $character->id }}">

                                <input type="hidden" name="specimen_id" value="{{ $specimen_id }}">

                                <input type="hidden" name="entered_by" value="{{ auth()->id()}}">


                @break

            @case(9)
                <!--  radio USE LOOKUP TABLE -->
                @php
                    //dd($character->name );
                @endphp

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
                            @php
                                if( $character->name ==  'part_in_veil_ann_ri_posit' )
                                {
                                    $display_name = 'Partial Inner Veil Annulus Ring Position';
                                }
                                else
                                {
                                     $display_name = StringUtils::convert_table_name_for_display($character->name);
                                }
                            @endphp
                            <div id="character_{{ $character->id  }}">  <!-- div for tag -->
                            <label for="character_value"><b>{{ $display_name }}</b></label>
                        </div>   <!-- end div for tag -->



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


                            @error('$character->name')
                            <div class="alert alert-danger">{{ $message }}</div>
                            @enderror

                @break

            @case(10)
                <!--  dropdown -->


                                @php $display_name = StringUtils::convert_table_name_for_display($character->name); @endphp
                                <div id="character_{{ $character->id  }}">  <!-- div for tag -->
                                <label for="character_value"><b>{{ $display_name }}</b></label>
                                </div>   <!-- end div for tag -->

                                @error('$character->name')
                                <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                                <input type="hidden" name="character_id" value="{{ $character->id }}">

                                <input type="hidden" name="specimen_id" value="{{ $specimen_id }}">

                                <input type="hidden" name="entered_by" value="{{ auth()->id()}}">

                @break

            @case(11)
                <!--  state -->

                                @php $display_name = StringUtils::convert_table_name_for_display($character->name); @endphp
                                <div id="character_{{ $character->id  }}">  <!-- div for tag -->
                                <label for="character_value"><b>{{ $display_name }}</b></label>
                                </div>   <!-- end div for tag -->
                                @error('$character->name')
                                <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                                <input type="hidden" name="character_id" value="{{ $character->id }}">

                                <input type="hidden" name="specimen_id" value="{{ $specimen_id }}">

                                <input type="hidden" name="entered_by" value="{{ auth()->id()}}">


                @break

            @case(12)
                <!-- country -->
                                <div id="character_{{ $character->id  }}">  <!-- div for tag -->
                                <label for {{$character->name}}><p><b>{{ $character->name }}</b> (country table)</p>
                                </label>
                                </div>   <!-- end div for tag -->
                                @error('$character->name')
                                <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                                <input type="hidden" name="character_id" value="{{ $character->id }}">

                                <input type="hidden" name="specimen_id" value="{{ $specimen_id }}">

                                <input type="hidden" name="entered_by" value="{{ auth()->id()}}">

                @break

            @case(13)
                <!--  texture -->
                        @php $display_name = StringUtils::convert_table_name_for_display($character->name); @endphp
                                <p><b>{{ $display_name }}</b> (texture table)</p>
                                @php
                                    $data = DB::table( 'textures' )->get();
                                @endphp
                                @foreach($data as $item)
                                    @php
                                        // dd($item);
                                    @endphp
                                    <input type="radio" id="character_value" name="character_value"
                                           value="{{ $item->id }}">
                                    @php $display_name = StringUtils::convert_table_name_for_display($item->name); @endphp
                                    <div id="character_{{ $character->id  }}">  <!-- div for tag -->
                                    <label for="character_value">{{ $display_name }}</label>
                                </div>   <!-- end div for tag -->
                                    <br>
                                @endforeach

                                @error('$character->name')
                                <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                                <input type="hidden" name="character_id" value="{{ $character->id }}">

                                <input type="hidden" name="specimen_id" value="{{ $specimen_id }}">

                                <input type="hidden" name="entered_by" value="{{ auth()->id()}}">


                @break
            @case(14)
                <!-- yes_no  -->

                                @php $display_name = StringUtils::convert_table_name_for_display($character->name); @endphp
                                <p><b>{{ $display_name }}</b> (yes_no)</p>
                                <div id="character_{{ $character->id  }}">  <!-- div for tag -->
                                <label for="yes_no"><b>Yes or No</b></label><br> <input type="radio" id="yes"
                                                                                        name="yes_no" value="yes">
                                <label for="yes">Yes</label><br> <input type="radio" id="no" name="yes_no" value="no">
                                <label for="no">No</label><br>
                                </div>   <!-- end div for tag -->
                                @error('$character->name')
                                <div class="alert alert-danger">{{ $message }}</div>
                                @enderror

                                <input type="hidden" name="character_id" value="{{ $character->id }}">

                                <input type="hidden" name="specimen_id" value="{{ $specimen_id }}">

                                <input type="hidden" name="entered_by" value="{{ auth()->id()}}">

                @break
            @case(15)
                <!--  abundance -->

                                @php
                                    $display_name = StringUtils::convert_table_name_for_display($character->name);
                                    $data = DB::table( 'abundances' )->get();
                                @endphp

                                <div id="character_{{ $character->id  }}">   <!-- div for tag -->
                                <b>{{ $display_name }}</b><br>
                                @foreach($data as $item)
                                <input type="radio" name="character_value" id="character_value" value="{{ $item->id }}">
                                <label for="character_value">{{$item->name}}</label><br>
                                </div>   <!-- end div for tag -->
                               @endforeach



                                @error('$character->name')
                                <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                                <input type="hidden" name="character_id" value="{{ $character->id }}">

                                <input type="hidden" name="specimen_id" value="{{ $specimen_id }}">

                                <input type="hidden" name="entered_by" value="{{ auth()->id()}}">

                @break
            @case(16)
                <!--  text box number grams measurement -->
                                <div id="character_{{ $character->id  }}">  <!-- div for tag -->
                                @php $display_name = StringUtils::convert_table_name_for_display($character->name); @endphp
                                <label for="character_value"><b>{{ $display_name }}</b></label>
                                </div>   <!-- end div for tag -->
                                @error('$character->name')
                                <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                                <input type="hidden" name="character_id" value="{{ $character->id }}">

                                <input type="hidden" name="specimen_id" value="{{ $specimen_id }}">

                                <input type="hidden" name="entered_by" value="{{ auth()->id()}}">

                @break
            @case(17)
                <!--  genus and species autocomplete -->

                                @php //dd($character);
                                    $current_value = '';
                                @endphp
                                <div id="character_{{ $character->id  }}">  <!-- div for tag -->
                                @if ($character->name === 'genus')
                                    @component('components.autocomplete', ['type' => 'genus', 'value' => $current_value])
                                    @endcomponent
                                @elseif ($character->name === 'species')
                                    @component('components.autocomplete', ['type' => 'species', 'value' => $current_value])
                                    @endcomponent
                                @else
                                    Invalid Input!
                                @endif
                                </div>   <!-- end div for tag -->
                                @error('$character->name')
                                <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                                <input type="hidden" name="character_id" value="{{ $character->id }}">

                                <input type="hidden" name="specimen_id" value="{{ $specimen_id }}">

                                <input type="hidden" name="entered_by" value="{{ auth()->id()}}">

                @break
            @default
                <!--       Default case... -->

                        <p><b>{{ $character->name }} Default case</b></p>

        @endswitch
        @if( $character->display_options != 6 )
           <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="submit">
               Add Character
            </button>
</div>
            </form>

    <div class="text-right text-orange-600 font-bold"><a href="#top">Top</a></div>
        </td>
            </tr>
        @endif
 @endforeach


    </tbody>

</table>     <!-- end display-character-by-display-option-switch.blade.php --><?php
