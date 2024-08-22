@php
    dd($characterName);
    $display_character_name = str_replace('_', ' ', $characterName);
    $display_character_name = ucwords($display_character_name);
    //dd($display_character_name);
@endphp
<p>SB display_character_name: {{$display_character_name}}</p>
