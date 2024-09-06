@php

    use App\Models\Lookup\Character;use Illuminate\Support\Facades\DB;

    // Retrieve CharacterSpecimens for the given specimen ID
    $characterSpecimens = DB::table('character_specimens')->where('specimen_id', '=', $specimenId )->get();

    //dd($characterSpecimens);
    echo "Specimen ID: ".e($specimenId)." from component display-existing-specimen-characters.blade.php line ".__LINE__."";

@endphp

@foreach ($characterSpecimens as $characterSpecimen)
    @php //dd($characterSpecimen); @endphp
    <div>
        <!-- Display character specimen details here -->
        Value: {{ $characterSpecimen->character_value }} from component display-existing-specimen-characters.blade.php
        line <?php echo __LINE__; ?>
    </div>

    @php

        $character = Character::find($characterSpecimen->character_id);
        //dd($character);

        $tableName = getTableName($character['name']);
        //dd($tableName);
        //$data = DB::table($tableName)->get()->dd();
        $data = DB::table($tableName)->get();
        //dd($data);
        $displayCharacterName = formatCharacterName($character['name']);


        foreach ($data as $item):
            $value = DB::table($tableName)->find($characterSpecimen->character_value);
            //echo e($displayCharacterName);   // e is same as HTML::entities($displayCharacterName
        endforeach;

        $source = DB::table('data_sources')->where('id', $value->source)->first();
        //dd($source);
    @endphp

    <div class="border-2 border-amber-400 bg-amber-200 m-auto p-2">
        <b>{{$displayCharacterName}}: {{$value->name}}</b> {{$value->description}}<br>
        @if( !empty($value->comments))
            {{$value->comments}}<br>
            <div class="text-sm">Source: <i>{{$source->title}}</i> {{$source->author}}</div>
        @else
            <div class="text-sm">Source: <i>{{$source->title}}</i> {{$source->author}}</div>
        @endif
    </div>

@endforeach

@php

    /**
     * Generate table name based on character name
     *
     * @param  string  $characterName
     * @return string
     */
    function getTableName(string $characterName): string
    {
        $specialCases = ['cap_surface_dryness', 'genus', 'gill_thickness', 'species', 'veil_annulus'];  // table names already ending in letter s

        return in_array($characterName, $specialCases) ? $characterName : $characterName.'s';
    }

    /**
     * Format character name for display
     *
     * @param  string  $characterName
     * @return string
     */
    function formatCharacterName(string $characterName): string
    {
        return ucwords(str_replace('_', ' ', $characterName));
    }
@endphp

