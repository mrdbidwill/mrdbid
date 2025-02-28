@php use App\Utils\StringUtils; @endphp
<div>
    <h3>You have set these characters:</h3>
    <table class="table-auto w-full">
        @foreach ($setCharacters as $setCharacter)
            <tr class="{{ $loop->odd ? 'bg-amber-100' : 'bg-green-100' }}">
                <td class="border border-collapse border-gray-400 p-2">
                    <p>
                        <strong>{{ StringUtils::convert_table_name_for_display($setCharacter['name']) }}
                            :</strong>
                        @if ($setCharacter['look_up_y_n'] && isset($setCharacter['lookup_data']))
                            {{ $setCharacter['lookup_data']->name ?? 'N/A' }}
                            {{ $setCharacter['lookup_data']->description ?? '' }}
                        @else
                            {{ $setCharacter['character_value'] ?? 'N/A' }}
                        @endif
                    </p>
                </td>
            </tr>
        @endforeach
    </table>
</div>
