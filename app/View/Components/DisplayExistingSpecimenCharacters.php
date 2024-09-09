<?php

namespace App\View\Components;

use App\Models\CharacterSpecimen;
use Illuminate\Contracts\Support\Htmlable;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Foundation\Application;
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

    public function render(): Application|Factory|View|Htmlable|\Closure|string|\Illuminate\View\View
    {
        return view('components.display-existing-specimen-characters');
    }
}
