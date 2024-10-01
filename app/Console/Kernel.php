<?php

namespace App\Console;

use App\Console\Commands\FluxActivate;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    protected $commands = [
        FluxActivate::class,
    ];

    protected $commands = [
        FluxActivate::class,
    ];

    protected function schedule(Schedule $schedule)
    {
        // Schedule defined commands, if any
    }

    protected function commands()
    {
        $this->load(__DIR__.'/Commands');
        require base_path('routes/console.php');
    }
}
