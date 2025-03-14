<?php

namespace App\Livewire;

use Livewire\Component;

class ResponsiveNavigation extends Component
{
    public $open = false;

    public function toggleMenu()
    {
        $this->open = ! $this->open;
    }

    public function render()
    {
        return view('livewire.responsive-navigation');
    }
}
