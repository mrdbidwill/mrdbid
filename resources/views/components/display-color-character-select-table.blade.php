@props([
'colors',
'color_character_names',
'list_of_set_characters',
'specimen_id'
])


<table>        <!-- display-color-character-select-table.blade.php  L9-->
    <thead>
    <tr>
        <th colspan="10">Colors from AMS Color Chart Line 14</th>
    </tr>
    </thead>
    <tbody>
    @foreach($colors as $index => $color)
        @if($index % 10 == 0)
            @if($index != 0)
                </tr>
    @endif
    <tr>
        @endif
        <td>
            <div id="character_{{$index + 1  }}">   <!-- div for tag -->
                <img src="{{ url('storage/images/AMS_colors/banner_50x50/banner_'.($index + 1).'.jpg') }}"
                     alt="{{ $color->latin_name }}"> <input type="radio" id="character_value" name="character_value"
                                                            value="{{ $index + 1 }}"> <label
                    for="{{ $index + 1 }}">{{ $color->latin_name }}</label>
            </div>   <!-- div for tag  -->
        </td>
    @endforeach
    </tbody>
</table>          <!-- display-color-character-select-table.blade.php  L 36 -->
