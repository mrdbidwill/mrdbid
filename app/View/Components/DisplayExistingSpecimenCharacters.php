<?php

namespace App\View\Components;

use Illuminate\View\Component;
use Illuminate\View\View;

class DisplayExistingSpecimenCharacters extends Component
{
    public int $specimenID;

    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct($specimenID)
    {
        $this->specimenID = $specimenID;
    }

    /**
     * Get the view / contents that represent the component.
     */
    public function render(): \Illuminate\Contracts\View\Factory|\Illuminate\Foundation\Application|\Illuminate\Contracts\View\View|View
    {
        return view('components.display_existing_specimen_characters');
    }
}
