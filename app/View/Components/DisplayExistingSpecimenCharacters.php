<?php

namespace App\View\Components;

use App\Models\CharacterSpecimen;
use Illuminate\View\Component;

class DisplayExistingSpecimenCharacters extends Component
{
    public $specimenId;

    public $characterSpecimens;

    public function __construct($specimenId)
    {
        $this->specimenId = $specimenId;
        $this->characterSpecimens = CharacterSpecimen::where('specimen_id', $specimenId)->get();
    }

    public function render()
    {
        return view('components.display-existing-specimen-characters');
    }
}
