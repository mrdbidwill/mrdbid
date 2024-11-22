@php

    use App\Models\Lookup\Character;use App\Models\Specimen;use Illuminate\Support\Facades\DB;use App\Utils\StringUtils;

    // Retrieve Specimens for the given specimen ID
    $specimens = Specimen::where('specimen_id', $specimenID)->get();

    echo "Specimen ID: ".e($specimenID)."  <!-- from display-existing-basic-specimen-characters.blade.php -->";
@endphp

@foreach ($specimens as $specimen)

    @php
        $character = Character::find($specimen['character_id']);
        $tableName = getTableName($character['name']);
        $data = DB::table($tableName)->get();
        $displayCharacterName = formatCharacterName($character['name']);


        foreach ($data as $item):
            $value = DB::table($tableName)->find($specimen['character_value']);
            //echo e($displayCharacterName);   // e is same as HTML::entities($displayCharacterName
        endforeach;

        $source = DB::table('data_sources')->where('id', $value->source)->first();
        //dd($source);
    @endphp

    <div class="border-2 border-amber-400 bg-amber-200 m-auto p-2">
        <!-- begin from display-existing-basic-specimen-characters.blade.php -->
        <b>{{$displayCharacterName}}: {{$value->name}}</b> {{$value->description}}<br>
        @if( !empty($value->comments))
            {{$value->comments}}<br>
            <div class="text-sm">Source: <i>{{$source->title}}</i> {{$source->author}}</div>
        @else
            <div class="text-sm">Source: <i>{{$source->title}}</i> {{$source->author}}</div>
        @endif
    </div>         <!-- end from display-existing-basic-specimen-characters.blade.php -->

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

