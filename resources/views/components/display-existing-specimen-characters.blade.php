@php
    use App\Models\Lookup\Character;use App\Utils\StringUtils;use Illuminate\Support\Facades\DB;
    // The number of possible characters is over 100 in the characters table right now, certain to increase
    // A specimen needs some characters to be useful but all are optional - there is limit of one character_id to specimen_id
    // for each character - for example there can not be two cap_margin_type
    // Retrieve CharacterSpecimens for the given specimen ID if any have been entered
    $characterSpecimens = DB::table('character_specimens')->where('specimen_id', '=', $specimenId )->get();
    //dd($characterSpecimens);
    //echo "Specimen ID: ".e($specimenId)." from component display-existing-specimen-characters.blade.php line ".__LINE__."";
@endphp


@foreach ($characterSpecimens as $characterSpecimen)
    @php //dd($characterSpecimen);
         // for each character that has been set - get the table information
         $characterRecord = DB::table('characters')
         ->where('id', '=', $characterSpecimen->character_id )
         ->orderBy('name')
         ->first();
         //dd($characterRecord);

        // Check if the character record exists before accessing its name property
    if($characterRecord)
    {
        // below get_table_name_special_cases will add plural s where needed
        if( str_contains( $characterRecord->name, 'color'))
        {
            // maintain original name for display at bottom
            $color_character_name = $characterRecord->name;
            $character_table_name = 'color';
        }
        elseif( str_contains( $characterRecord->name, 'odor'))
        {
            $character_table_name = 'odor';
        }
        elseif( str_contains( $characterRecord->name, 'taste'))
        {
            $character_table_name = 'taste';
        }
        elseif( str_contains( $characterRecord->name, 'texture'))
        {
            $character_table_name = 'texture';
        }
        elseif( str_contains( $characterRecord->name, 'abun'))
        {
            $character_table_name = 'abundance';
        }
        else
        {
            $character_table_name = $characterRecord->name;
        }

        if( $character_table_name == 'color')
        {

            $character = DB::table('colors')->where('id', '=', $characterSpecimen->character_value )->first();
            //dd($character->latin_name);
            if($character)
            {
                $tableName = StringUtils::get_table_name_special_cases($character_table_name);
                $displayCharacterName = StringUtils::convert_table_name_for_display($tableName);
                $displayColorCharacterName = StringUtils::convert_table_name_for_display($color_character_name);
                $latin_name  = $character->latin_name;
                $common_name = $character->common_name;
                $color_group = $character->color_group;
                $hex         = $character->hex;
                $cwc         = $character->closest_websafe_color;

            }
        }
        else
        {

            if( $characterRecord->look_up_y_n == 0 )  // if not a lookup table - just display data
            {
                $display_table_name = StringUtils::convert_table_name_for_display($character_table_name);
    @endphp
    <div class="border-2 border-amber-400 bg-amber-200 m-auto p-2">
        <b>{{ $display_table_name }}:</b> {{ $characterSpecimen->character_value }}
    </div>

    @php
        }
        else
        {
            $character = Character::find($characterSpecimen->character_id);
            if($character)
            {
                //dd($character);
                $tableName = StringUtils::get_table_name_special_cases($character_table_name);
                //dd($tableName);
                //$data = DB::table($tableName)->get()->dd();
                $data = DB::table($tableName)->get();
                //dd($data);
                $displayCharacterName = StringUtils::convert_table_name_for_display($tableName);

                foreach ($data as $item)
                {
                    $value = DB::table($tableName)->find($characterSpecimen->character_value);
                    //echo e($displayCharacterName);   // e is same as HTML::entities($displayCharacterName

                    if ($value && property_exists($value, 'source'))
                    {
                       $source = DB::table('data_sources')->where('id', $value->source)->first();

                       $description = $value->description;
                       $valueName = $value->name;
                       $comments = $value->comments;
                       $title  = $source->title;
                       $author = $source->author;
                       break;
                    }
                }
            }
        }
    }
}


if( $character_table_name == 'color')
{
    @endphp
    <div class="border-2 border-amber-400 bg-amber-200 m-auto p-2">
        @if (isset($value) && property_exists($value, 'name'))
            <b>{{$displayColorCharacterName}}: Latin Name: {{$latin_name}}</b> Common Name:  {{$common_name}}<br>
            @if( !empty($cwc))
                Closest Websafe Color: {{$cwc}}<br>
                <div class="text-sm">Source: Alabama Mushroom Society's "Latin Colors Used In Many Mushroom Names" chart
                </div>
            @else
                <div class="text-sm">Source: Alabama Mushroom Society's "Latin Colors Used In Many Mushroom Names" chart
                </div>
            @endif
        @endif
    </div>
    @php
        }
        else
        {
    @endphp
    <div class="border-2 border-amber-400 bg-amber-200 m-auto p-2">
        @if (isset($value) && property_exists($value, 'name'))
            <b>{{$displayCharacterName}}: {{$valueName}}</b> {{$description}}<br>
            @if( !empty($comments))
                {{$comments}}<br>
                <div class="text-sm">Source: <i>{{$title}}</i> {{$author}}</div>
            @else
                <div class="text-sm">Source: <i>{{$title}}</i> {{$author}}</div>
            @endif
        @endif
    </div>
    @php
        }
    @endphp
@endforeach

