<div>
    <!-- Top Section: Colors -->
    <div class="colors">
        <h3>Available Colors</h3>
        <table class="table-auto w-full border-collapse border border-gray-300">
            <thead>
            <tr>
                <th class="border border-gray-300">Color Name</th>
                <th class="border border-gray-300">Thumbnail</th>
            </tr>
            </thead>
            <tbody>
            @foreach ($colors as $color)
                <tr class="{{ $loop->odd ? 'bg-blue-100' : 'bg-green-100' }}">
                    <td class="border border-gray-300 p-2">{{ $color->name }}</td>
                    <td class="border border-gray-300 p-2">
                        <img src="{{ asset('storage/images/AMS_colors/banner_50x50/banner_' . $color->id . '.jpg') }}"
                             alt="{{ $color->name }}" width="50">
                    </td>
                </tr>
            @endforeach
            </tbody>
        </table>
    </div>

    <hr>

    <!-- Bottom Section: Characters Table and Form -->
    <div class="characters">
        <h3>Characters</h3>
        <table class="table-auto w-full border-collapse border border-gray-300">
            <thead>
            <tr>
                <th class="border border-gray-300">Character Name</th>
                <th class="border border-gray-300">Currently Set Value</th>
                <th class="border border-gray-300">Action</th>
            </tr>
            </thead>
            <tbody>
            @foreach ($setCharacters as $character)
                <tr class="{{ $loop->odd ? 'bg-yellow-100' : 'bg-gray-100' }}">
                    <td class="border border-gray-300 p-2">{{ $character['name'] }}</td>
                    <td class="border border-gray-300 p-2">
                        {{ $character['character_value'] ?? 'N/A' }}
                    </td>
                    <td class="border border-gray-300 p-2">
                        <button wire:click="selectCharacter({{ $character['id'] }})"
                                class="bg-blue-500 text-white px-2 py-1">
                            Edit
                        </button>
                    </td>
                </tr>
            @endforeach
            </tbody>
        </table>

        <!-- Form Section -->
        @if ($selectedCharacter)
            <div class="form mt-4">
                <h4>Editing: {{ $selectedCharacter->name }}</h4>
                <form wire:submit.prevent="saveCharacter">
                    <label for="character_value">Value:</label> <input type="text" id="character_value"
                                                                       wire:model="characterValue"
                                                                       class="border-gray-300 rounded">
                    <button type="submit" class="bg-green-500 text-white px-4 py-2 rounded">Save</button>
                </form>
            </div>
        @endif
    </div>
</div>
