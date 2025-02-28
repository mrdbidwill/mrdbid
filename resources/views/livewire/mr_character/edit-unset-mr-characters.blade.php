<div>
    <h2 class="text-lg font-bold">Unset Characters</h2>
    <div class="mt-4">
        <table class="table-auto w-full border-collapse">
            <tbody>
            @foreach ($unsetCharacters as $index => $character)
                <tr>
                    <td class="border p-2">
                        <!-- Access $displayNames using $index -->
                        <label
                            for="character_{{ $character->id }}">{{ $displayNames[$index] ?? 'Name Not Available' }}</label>
                    </td>
                    <td class="border p-2">
                        <input type="text" id="character_{{ $character->id }}"
                               wire:model.defer="characters.{{ $index }}.value" placeholder="Enter value"
                               class="border p-1">
                    </td>
                    <td class="border p-2">
                        <button class="bg-blue-500 text-white px-2 py-1 rounded"
                                wire:click="saveCharacter({{ $character->id }}, characters[{{ $index }}].value)">
                            Save
                        </button>
                    </td>
                </tr>

                @if ($loop->iteration % 5 === 0)
                    <tr>
                        <td colspan="3" class="text-right">
                            <a href="#top" class="text-orange-600 font-bold">Top</a>
                        </td>
                    </tr>
                @endif
            @endforeach
            </tbody>
        </table>
    </div>
</div>
