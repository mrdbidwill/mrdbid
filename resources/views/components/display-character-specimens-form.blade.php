<div>
    @props([
    'color_character_names',
    'list_of_set_characters',
    'specimen_id'
])
    <!-- resources/views/components/display-character-specimens-form.blade.php -->
    @php

        //dd($color_character_names); // OK
       // dd($list_of_set_characters); //OK
       //dd($specimen_id);
    @endphp

    <table class="min-w-full divide-y divide-gray-700">
        @foreach($color_character_names->chunk(3) as $chunk)
            <tr>
                @foreach($chunk as $color_character_name)
                    @if(!in_array($color_character_name['id'], $list_of_set_characters))
                        <td class="whitespace-nowrap px-3 py-4 text-sm text-black">
                            @php
                                $display_name = \App\Utils\StringUtils::convert_table_name_for_display($color_character_name['name']);
                            @endphp
                            <input type="radio" id="character_id" name="character_id"
                                   value="{{ $color_character_name['id'] }}"> <label
                                for="character_{{ $color_character_name['name'] }}">{{ $display_name }}</label>
                        </td>
                    @endif
                @endforeach
            </tr>
        @endforeach
    </table>

    <div class="text-right text-orange-600 font-bold"><a href="#top">Top</a></div>
</div>
