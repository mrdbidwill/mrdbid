@php
    use App\Models\Lookup\Character;
    use App\Utils\StringUtils;
    use Illuminate\Support\Facades\DB;
@endphp
@props(['unset_characters'])
<!-- resources/views/components/display-unset-characters.blade.php -->
@php //dd($unset_characters); @endphp@php
    // Sort the unset_characters by name alphabetically
    $sorted_characters = $unset_characters->sortBy('name');
@endphp
<table class="min-w-full divide-y divide-gray-700">
    @foreach ($sorted_characters->chunk(3) as $chunk)
        <tr>
            @foreach ($chunk as $unset_character)
                @if ($unset_character->name != 'id')
                    @php $display_name = StringUtils::convert_table_name_for_display($unset_character->name); @endphp
                    <td class="font-bold"><a href="#character_{{ $unset_character->id }}">{{ $display_name }}</a></td>
                @endif
            @endforeach
        </tr>
    @endforeach
</table>



