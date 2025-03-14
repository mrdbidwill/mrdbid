<?php

namespace App\Livewire\MrCharacter;

use App\Repositories\MrCharacterSpecimenRepository;
use Livewire\Component;

class DisplayUnsetMrCharacters extends Component
{
    public $specimenId;

    public $unsetCharacters = [];

    protected $characterSpecimenRepository;

    public function mount($specimenId)
    {
        $this->specimenId = $specimenId;
        $this->characterSpecimenRepository = app(MrCharacterSpecimenRepository::class);

        $this->fetchUnsetCharacters();
    }

    public function fetchUnsetCharacters()
    {
        // Fetch all unset characters for the given specimen
        $this->unsetCharacters = $this->characterSpecimenRepository->getUnsetCharactersBySpecimen($this->specimenId);
    }

    public function selectCharacter($characterId)
    {
        // Emit an event to notify other components of the selected character
        $this->emit('characterSelected', $characterId);
    }

    public function render()
    {
        return view('livewire.mr_character.edit-unset-mr-characters', [
            'unsetCharacters' => $this->unsetCharacters,
        ]);
    }
}
