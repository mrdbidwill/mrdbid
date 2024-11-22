<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class FluxActivate extends Command
{
    // Define the name and signature of the console command
    protected $signature = 'flux:activate';

    // Define the console command description
    protected $description = 'Activate flux';

    // Execute the console command
    public function handle()
    {
        $this->info('Activating flux...');

        // Command logic goes here

        $this->info('Flux activated successfully!');
    }
}
