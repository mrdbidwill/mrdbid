<?php

namespace App\View\Components;

use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class EditCharactersSwitch extends Component
{
    public string $characters;

    public string $characterSpecimens;

    /**
     * Create a new component instance.
     */
    public function __construct($characters, $characterSpecimens)
    {
        $this->characters = $characters;
        $this->characterSpecimens = $characterSpecimens;
    }

    /**
     * Get the view / contents that represent the component.
     */
    public function render(): View|Closure|string
    {
        return view('components.edit_characters_switch');
    }
}
