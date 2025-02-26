<?php

namespace App\Livewire\MrCharacter;

use App\Repositories\MrCharacterRepository;
use App\Repositories\MrCharacterSpecimenRepository;
use Livewire\Component;

class DisplayMrCharacterByDisplayOptionSwitch extends Component
{
    public $specimenId;

    public $selectedCharacter;

    public $characterValue;

    protected $listeners = ['characterSelected' => 'loadCharacterForm'];

    public function loadCharacterForm($characterId)
    {
        $this->selectedCharacter = app(MrCharacterRepository::class)->find($characterId);
    }

    public function submitCharacterForm()
    {
        // Save the character value for the specimen
        app(MrCharacterSpecimenRepository::class)->syncCharacterSpecimens($this->specimenId, [
            [
                'character_id' => $this->selectedCharacter->id,
                'specimen_id' => $this->specimenId,
                'character_value' => $this->characterValue,
                'entered_by' => auth()->id(),
            ],
        ]);

        // Emit an event to refresh unset characters
        $this->emit('characterSaved');
        $this->characterValue = null;
        $this->selectedCharacter = null;
    }

    public function render()
    {
        return view('livewire.mr_character.display-mr_character-by-display-option-switch', [
            'character' => $this->selectedCharacter,
        ]);
    }
}
