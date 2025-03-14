<?php

namespace App\Livewire\MrCharacter;

use Livewire\Component;

class ManageExistingMrCharacters extends Component
{
    public $specimenId;

    public $setCharacters;

    // Add public properties to match what's passed from the parent view
    public function mount($specimenId, $setCharacters)
    {
        $this->specimenId = $specimenId;
        $this->setCharacters = $setCharacters;
    }

    public function render()
    {
        return view('livewire.mr_character.manage-existing-mr-characters');
    }
}
