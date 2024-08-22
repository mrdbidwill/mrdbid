<?php

namespace App\View\Components;

use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class GetCharacterSpecimenValueFromLookup extends Component
{
    public string $characterID;

    public string $specimenID;

    public string $characterValue;

    /**
     * Create a new component instance.
     */
    public function __construct($characterID, $specimenID, $characterValue)
    {
        $this->characterID = $characterID;
        $this->specimenID = $specimenID;
        $this->characterValue = $characterValue;
    }

    /**
     * Get the view / contents that represent the component.
     */
    public function render(): View|Closure|string
    {
        return view('components.get_character_specimen_value_from_lookup');
    }
}
