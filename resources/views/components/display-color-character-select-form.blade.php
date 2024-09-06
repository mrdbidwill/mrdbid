@php

    use Illuminate\Support\Facades\DB;

    $color_character_names = DB::table('characters')->where( 'display_options', '==',  6 )->get();
    $colors     = DB::table('colors')->get();
@endphp

<table>        <!-- display-color-character-select-form.blade.php  L11-->
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
            {{ $index + 1 }}.
            <img
                src="{{ url('storage/images/AMS_colors/banner_50x50/banner_'.($index + 1).'.jpg') }}"
                alt="{{ $color->latin_name }}">
            <input type="radio" id="{{ $index + 1 }}" name="{{ $color->latin_name }}"
                   value="{{ $index + 1 }}">
            <label for="{{ $index + 1 }}">{{ $color->latin_name }}</label>
        </td>
    @endforeach
    </tbody>
</table>          <!-- display-color-character-select-form.blade.php  L 36 -->


<table
    class="min-w-full divide-y divide-gray-700">          <!-- display-color-character-select-form.blade.php  L 40  -->
    <thead>
    <tr>
        <th scope="col" colspan="10"
            class="px-3 py-3.5 text-left text-sm font-semibold text-black">
            Color Character Names (display-color-character-select-form.blade.php)
        </th>
    </tr>
    </thead>
    <tbody class="divide-y divide-gray-800">
    @foreach($color_character_names as $index => $name)
        @if($index % 3 == 0)
            @if($index != 0)
                </tr>
    @endif
    <tr>
        @endif
        <td class="whitespace-nowrap px-3 py-4 text-sm text-black">{{ $index }} {{ $name }}</td>
        @endforeach
        @if(count($color_character_names) % 3 != 0)
    </tr>
    @endif
    </tbody>
</table>        <!-- display-color-character-select-form.blade.php Line 63 -->
