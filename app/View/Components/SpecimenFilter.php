<?php

namespace App\View\Components;

use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class SpecimenFilter extends Component
{
    public $states;

    public $countries;

    /**
     * Create a new component instance.
     */
    public function __construct($states, $countries)
    {
        $this->states = $states;
        $this->countries = $countries;
    }

    /**
     * Get the view / contents that represent the component.
     */
    public function render(): View|Closure|string
    {
        return view('components.specimen-filter');
    }
}
