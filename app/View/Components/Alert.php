<?php

namespace App\View\Components;

use Illuminate\View\Component;

class Alert extends Component
{
    public $type;

    public $message;

    public $bgColor;

    public $dismissable;

    // Initialize the component with dismissable option
    public function __construct($type, $message, $dismissable = false)
    {
        $this->type = $type;
        $this->message = $message;
        $this->dismissable = $dismissable;
        $this->bgColor = $this->getBgColor($type);
    }

    public function getBgColor($type)
    {
        switch ($type) {
            case 'success':
                return 'green';
            case 'error':
                return 'red';
            case 'warning':
                return 'yellow';
            case 'info':
                return 'blue';
            default:
                return 'gray';
        }
    }

    public function render()
    {
        return view('components.alert');
    }
}
