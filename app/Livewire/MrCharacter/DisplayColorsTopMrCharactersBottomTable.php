<?php

namespace App\Livewire\MrCharacter;

use App\Repositories\MrCharacterRepository;
use App\Repositories\MrCharacterSpecimenRepository;
use Livewire\Component;

class DisplayColorsTopMrCharactersBottomTable extends Component
{
    public $specimenId;

    // Colors-related properties
    public $colors = [];

    public $colorCharacterNames = [];

    // Characters-related properties
    public $setCharacters = [];

    public $unsetColorCharacters = [];

    public $unsetCharacters = [];

    public $setCharactersArray = [];

    public $selectedCharacter;

    public $characterValue;

    protected $characterRepository;

    protected $characterSpecimenRepository;

    public function mount($specimenId, $colors, $colorCharacterNames, $setCharacters, $unsetColorCharacters, $setCharactersArray, $unsetCharacters)
    {
        // Assign necessary properties
        $this->specimenId = $specimenId;
        $this->colors = $colors;
        $this->colorCharacterNames = $colorCharacterNames;
        $this->setCharacters = $setCharacters;
        $this->unsetColorCharacters = $unsetColorCharacters;
        $this->unsetCharacters = $unsetCharacters;
        $this->setCharactersArray = $setCharactersArray;

        // Inject repositories
        $this->characterRepository = app(MrCharacterRepository::class);
        $this->characterSpecimenRepository = app(MrCharacterSpecimenRepository::class);
    }

    public function selectCharacter($characterId)
    {
        // When a character is selected, fetch its details and set it for editing
        $this->selectedCharacter = $this->characterRepository->find($characterId);
        $this->characterValue = $this->selectedCharacter ? $this->selectedCharacter->value : null;
    }

    public function saveCharacter()
    {
        if ($this->selectedCharacter) {
            // Save or update the character's value in the character_specimens table
            $this->characterSpecimenRepository->syncCharacterSpecimens($this->specimenId, [
                [
                    'character_id' => $this->selectedCharacter->id,
                    'specimen_id' => $this->specimenId,
                    'character_value' => $this->characterValue,
                    'entered_by' => auth()->id(),
                ],
            ]);
        }

        // Refresh the character lists
        $this->refreshCharacters();

        // Reset the selected character
        $this->selectedCharacter = null;
        $this->characterValue = null;
    }

    public function refreshCharacters()
    {
        // Reload set and unset characters
        $this->setCharacters = $this->characterSpecimenRepository->getSetCharactersBySpecimen($this->specimenId)->toArray();
        $this->unsetCharacters = $this->characterSpecimenRepository->getUnsetCharactersBySpecimen($this->specimenId)->toArray();
    }

    public function render()
    {
        return view('livewire.mr_character.display-colors-top-mr_characters-bottom-table', [
            'colors' => $this->colors,
            'colorCharacterNames' => $this->colorCharacterNames,
            'setCharacters' => $this->setCharacters,
            'unsetColorCharacters' => $this->unsetColorCharacters,
            'unsetCharacters' => $this->unsetCharacters,
        ]);
    }
}
