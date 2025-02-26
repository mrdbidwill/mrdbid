<div id="color-section">
    <h2 class="text-lg font-bold">Color Selection</h2>

    <!-- Grid of Color Thumbnails -->
    <div class="grid grid-cols-5 gap-4 mt-4">
        @foreach ($colors as $color)
            <div>
                <img src="{{ asset('storage/images/AMS_colors/banner_50x50/banner_' . $color['id'] . '.jpg') }}"
                     alt="{{ $color['latin_name'] }}" class="w-12 h-12 mx-auto">
                <div class="text-center mt-2">
                    <input type="radio" name="color" value="{{ $color['id'] }}" wire:model="selectedColor">
                    <label>{{ $color['latin_name'] }}</label>
                </div>
            </div>
        @endforeach
    </div>

    <!-- Unset Color Characters -->
    <h3 class="text-lg font-semibold mt-8">Unset Color Characters</h3>
    <div class="grid grid-cols-3 gap-4 mt-4">
        @foreach ($colorCharacterNames as $colorCharacter)
            <div>
                <input type="radio" name="color_character" value="{{ $colorCharacter['id'] }}"
                       wire:model="selectedColorCharacter"> <label>{{ $colorCharacter['name'] }}</label>
            </div>
        @endforeach
    </div>

    <!-- Save Button -->
    <div class="mt-4">
        <button class="bg-blue-500 text-white px-4 py-2 rounded" wire:click="saveSelection">
            Save Selection
        </button>
    </div>
</div>
