<div>
    @props([
    'colors',
    'color_character_names',
    'list_of_set_characters',
    'specimen_id'
])
    <!-- resources/views/components/character-specimen-form.blade.php -->
    @php
        // dd($colors); // OK
        // dd($color_character_names); // OK
        // dd($list_of_set_characters); //OK
        //dd($specimen_id);
    @endphp
    <table>
        <thead>
        <tr>
            <th colspan="10">Colors from AMS Color Chart</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td colspan="10">Select which color for which character.</td>
        </tr>
        @foreach($colors as $index => $color)
            @if($index % 10 == 0)
                @if($index != 0)
                    <!--   </tr>  -->
                    <tr>
                        @endif
                        @endif
                        @php
                            $image_address_banner =  url('storage/images/AMS_colors/banner_50x50/banner_'.($index + 1).'.jpg');
                            $image_address_big    =  url('storage/images/AMS_colors/color_big/color_big_'.($index + 1).'.jpg');
                        @endphp
                        <td>
                            {{ $index + 1 }}. <label for="color">{{ $color->latin_name }}</label> <input type="radio"
                                                                                                         id="color"
                                                                                                         name="color"
                                                                                                         value="{{ $index + 1 }}">
                            <img class="h-100 w-100" src="{{ $image_address_banner }}" alt="{{ $color->latin_name }}"
                                 data-banner="{{ $image_address_banner }}" data-big="{{ $image_address_big }}"
                                 onclick="toggleColorImage(this)">
                        </td>
                        @endforeach
                        @if(count($colors) % 10 != 0)
                    </tr>
                @endif
        </tbody>
    </table>

    <table class="min-w-full divide-y divide-gray-700">
        @foreach($color_character_names as $key => $color_character_name)
            @if(!in_array($color_character_name['id'], $list_of_set_characters))
                @if ($key % 3 == 0)
                    @if ($key != 0)
                        </tr>
        @endif
        <tr>
            @endif
            <td class="whitespace-nowrap px-3 py-4 text-sm text-black">
                @php
                    $display_name =  \App\Utils\StringUtils::convert_table_name_for_display($color_character_name['name']);
                @endphp
                <input type="radio" id="character_{{ $color_character_name['id'] }}" name="character"
                       value="{{ $color_character_name['id'] }}"> <label
                    for="character_{{ $color_character_name['name'] }}">{{ $display_name }}</label>
            </td>
            @endif
            @endforeach
            @if(count($color_character_names) % 3 != 0)
        </tr>
        @endif
    </table>

    <input type="hidden" name="specimen_id" value="{{ $specimen_id }}">

    <div>
        <button type="submit"
                class="bg-blue-300 rounded p-1 border border-slate-400 hover:bg-blue-500 hover:text-white">
            Submit
        </button>
    </div>
</div>
