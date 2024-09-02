@php
    //dd($characterName);
    $display_character_name = str_replace('_', ' ', $characterName);
    $display_character_name = ucwords($display_character_name);
    //dd($display_character_name);
@endphp
{{$display_character_name}}
