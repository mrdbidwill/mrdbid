@php
    use App\Models\CharacterSpecimen;
@endphp

<table>

    <tr>
        <td>These characters are set for this specimen.</td>
    </tr>

    @foreach ($characterIds as $characterId)
        <tr>
            <td>
                @php
                    //dd($characterIds[0]);   // is an integer for character_value of character_specimens table
                    //dd($characters);       // all characters in characters table

                    $character = $characters->where('id', $characterId)->first();
                    //dd($characterId);   // integer for character_id in character_specimens table
                    //dd($specimenID);    // integer for specimen_id in character_specimens table
                    //dd($character);     // character object



                        if( ( $character['name'] ==  'cap_surface_dryness')  || ( $character['name'] ==  'genus' ) || ( $character['name'] ==  'gill_thickness' )
                        || ( $character['name'] ==  'species' ) || ( $character['name'] ==  'veil_annulus' ) )
                        {
                        $data = DB::table( $character['name'] )->get();
                        }
                        else
                        {
                        $data = DB::table( $character['name'].'s' )->get();
                        }
                        // dd($data);  // loop through this to get the values for the radio buttons
                @endphp
                <p>character name:{{ $character['name'] }}</p>
                @foreach( $data as $item )

                    <input type="radio" id="{{ $item->id }}"
                           name="{{ $character['name'] }}"
                           value="{{ $item->id }}">
                    <label
                        for="{{ $item->id }}">{{ $item->name }} {{ $item->description }}</label>
                    <br>
                @endforeach
                @error('$character->name')
                <div class="alert alert-danger">{{ $message }}</div>
                @enderror

            </td>
        </tr>
    @endforeach
</table>
