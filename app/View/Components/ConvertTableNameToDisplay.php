<?php

namespace App\View\Components;

use Illuminate\View\Component;
use Illuminate\View\View;

class ConvertTableNameToDisplay extends Component
{
    public string $characterName;

    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct($characterName)
    {
        $this->characterName = $characterName;
    }

    /**
     * Get the view / contents that represent the component.
     */
    public function render(): \Illuminate\Contracts\View\Factory|\Illuminate\Foundation\Application|\Illuminate\Contracts\View\View|View
    {
        return view('components.convert-table-name-to-display');
    }
}
