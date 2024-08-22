@foreach ($characters as $character)
    <tr>
        <td>
            @php
                $characterName = $character['name'];
            @endphp
            <x-convert-table-name-to-display :characterName="$characterName"></x-convert-table-name-to-display>
            <!-- display all of the switch cases as a grid  -->
            @php
                //dd($characters);    // list of ALL characters in characters table
                //dd($characterSpecimens);  // list of EXISTING characters in character_specimens table



                //$character_name = str_replace('_', ' ', $character['name']);
                //$character_name = ucwords($character_name);
            @endphp

            @switch($character['display_options'])
                @case(1)
                    <!--  Do not display  -->

                    @break

                @case(2)
                    <!--  text box number mm is measure  NO lookup table -->
                    <!--  <p>{{$display_character_name}}: text box number mm - line 18 component
                        edit-characters-switch.blade.php</p>  -->

                    <label for="{{$character['id']}}">{{$display_character_name}}
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
                    <!--  text box number um is measure   NO lookup table -->
                    <p>{{$display_character_name}}: text box number um - line 37</p>

                    <label for="{{$character['id']}}">{{$display_character_name}}
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
                    <!--  text box string   NO lookup table -->
                    <p>{{$character_name}}: text box string - line 56</p>

                    <label for="{{$character['id']}}">{{$character_name}}
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
                    <!--  text box number general format for temperatures ph  etc    NO lookup table -->

                    <p>{{$character['name']}}: text box number general format - line
                        77</p>

                    <label for="{{$character['id']}}">{{$character_name}}
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
                    <!-- <p>{{$character['name']}}: color - line 138</p>  -->
                    @php
                        //    $color_character_names = array();  // declared above
                            $color_character_names[] = $character['name'];
                    @endphp
                    @break

                @case(7)
                    <!--  taste ALL taste characters use the tastes table-->
                    <p>{{$character_name}}: taste - line 107</p>
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
                    <p>{{$character_name}}: odor - line 123</p>
                    @php
                        $data = DB::table( 'odors' )->get();
                    @endphp
                    @break

                @case(9)
                    <!--  radio USE LOOKUP TABLE -->
                    @php
                        //  avoid self confusion over pluralization of table names
                        if( ( $character['name'] ==  'cap_surface_dryness')  || ( $character['name'] ==  'genus' ) || ( $character['name'] ==  'gill_thickness' )
                                                                     || ( $character['name'] ==  'species' ) || ( $character['name'] ==  'veil_annulus' ) )
                        {
                            $data = DB::table( $character['name'] )->get();
                        }
                        else
                        {
                            $data = DB::table( $character['name'].'s' )->get();
                        }
                    @endphp

                    @if( $characterIds->contains($character['id']) )
                        <hr>
                        <p>Character ID: {{$character['id']}}
                            <b>{{$character['name']}}</b> {{$item]'name'}}</p>
                        <hr>
                    @else
                        <!--
                                                            <hr>
                                                            <p>Character ID: {{$character['id']}}
                        Name: {{$character['name']}} is NOT in the array</p>
                                                            <hr>
                                                            -->
                    @endif



                    <!--  <p>{{$character['name']}} on <b>line 160</b></p>  -->


                    @break

                @case(10)
                    <!--  dropdown -->
                    <p>{{$character_name}}: dropdown - line 167</p>
                    @break

                @case(11)
                    <!--  state -->
                    <p>{{$character_name}}: state - line 172</p>
                    @break

                @case(12)
                    <!-- country -->
                    <p>{{$character_name}}: country - line 177</p>
                    @break

                @case(13)
                    <!--  texture -->
                    <p>{{$character_name}}: texture - line 182</p>
                    @break
                @case(14)
                    <!-- yes_no  -->
                    <p>{{$character_name}}: yes_no - line 186</p>
                    @break
                @case(15)
                    <!--  abundance -->
                    <p>{{$character_name}}: abundance - line 190</p>
                    @break
                @case(16)
                    <!--  text box number grams measurement -->
                    <p>{{$character_name}}: text box number grams
                        measurement - line 195</p>
                    @break
                @default
                    <!--       Default case... -->
                    <p>{{$character_name}}: Default case - line 199</p>
            @endswitch

        </td>
    </tr>
@endforeach
