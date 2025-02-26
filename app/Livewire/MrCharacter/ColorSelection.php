<?php

namespace App\Livewire\MrCharacter;

use App\Models\MrCharacterSpecimen;
use Livewire\Component;

class ColorSelection extends Component
{
    public $colors;

    public $colorCharacterNames;

    public $listOfSetCharacters;

    public $specimenId;

    public $selectedColor;

    public $selectedColorCharacter;

    public function saveSelection()
    {
        // Ensure both color and color character are selected
        if ($this->selectedColorCharacter && $this->selectedColor) {
            MrCharacterSpecimen::updateOrCreate(
                ['character_id' => $this->selectedColorCharacter, 'specimen_id' => $this->specimenId],
                ['character_value' => $this->selectedColor, 'entered_by' => auth()->id()]
            );

            session()->flash('message', 'Color selection updated successfully.');
        }
    }

    public function render()
    {
        return view('livewire.mr_character.color-selection', [
            'colors' => $this->colors,
            'colorCharacterNames' => $this->colorCharacterNames,
        ]);
    }
}
