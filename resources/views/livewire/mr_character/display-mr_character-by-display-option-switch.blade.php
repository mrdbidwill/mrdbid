<div>
    @if ($selectedCharacter)
        <h3>{{ $selectedCharacter->name }}</h3>
        <form wire:submit.prevent="submitCharacterForm">
            <label for="character_value">Value:</label> <input type="text" id="character_value"
                                                               wire:model="characterValue">
            <button type="submit">Save</button>
        </form>
    @else
        <p>Select a character from above to edit it.</p>
    @endif
</div>
