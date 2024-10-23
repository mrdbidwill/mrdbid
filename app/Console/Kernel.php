<?php

namespace App\Console;

use App\Console\Commands\ClearLog;
use App\Console\Commands\FluxActivate;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    protected $commands = [
        FluxActivate::class,
        ClearLog::class,
    ];

    protected function schedule(Schedule $schedule): void
    {
        //$schedule->command('log:clear')->daily();
    }

    protected function commands(): void
    {
        $this->load(__DIR__.'/Commands');
        require base_path('routes/console.php');
    }
}
