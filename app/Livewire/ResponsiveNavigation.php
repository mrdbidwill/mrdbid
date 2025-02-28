<?php

namespace App\Livewire;

use Livewire\Component;
use Illuminate\Support\Facades\Auth;

class ResponsiveNavigation extends Component
{
    public $open = false;

    public function toggleMenu()
    {
        $this->open = !$this->open;
    }

    public function render()
    {
        return view('livewire.responsive-navigation');
    }
}
