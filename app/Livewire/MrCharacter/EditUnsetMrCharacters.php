<?php

namespace App\Livewire\MrCharacter;

use App\Models\MrCharacterSpecimen;
use App\Utils\StringUtils;
use Livewire\Component;

class EditUnsetMrCharacters extends Component
{
    public $specimenId;

    public $unsetCharacters;

    public $displayNames = []; // Add $displayNames as a Livewire property

    public function mount($specimenId, $unsetCharacters)
    {
        $this->specimenId = $specimenId;
        $this->unsetCharacters = $unsetCharacters;

        // Compute display names for each unset character
        $this->displayNames = $this->unsetCharacters->map(function ($character) {
            return StringUtils::convert_table_name_for_display($character->name);
        })->toArray();
    }

    public function saveCharacter($characterId, $value)
    {
        MrCharacterSpecimen::updateOrCreate(
            ['character_id' => $characterId, 'specimen_id' => $this->specimenId],
            ['character_value' => $value, 'entered_by' => auth()->id()]
        );

        session()->flash('message', 'Character updated successfully.');
    }

    public function render()
    {
        return view('livewire.mr_character.edit-unset-mr-characters');
    }
}
