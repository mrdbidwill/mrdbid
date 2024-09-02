<?php

namespace App\View\Components;

use App\Models\Character;
use App\Models\CharacterSpecimen;
use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class DisplaySwitch extends Component
{
    public $specimenId;

    public $characterSpecimens;

    /**
     * Create a new component instance.
     */
    public function __construct($specimenId)
    {
        $characters = Character::get();
        $this->specimenId = $specimenId;
        $this->characterSpecimens = CharacterSpecimen::where('specimen_id', $specimenId)->get();
    }

    /**
     * Get the view / contents that represent the component.
     */
    public function render(): View|Closure|string
    {
        return view('components.display-switch');
    }
}
