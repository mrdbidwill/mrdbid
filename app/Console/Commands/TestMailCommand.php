<?php

// app/Console/Commands/TestMailCommand.php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Mail;

class TestMailCommand extends Command
{
    protected $signature = 'test:mail';

    protected $description = 'Send a test email';

    public function __construct()
    {
        parent::__construct();
    }

    public function handle()
    {
        Mail::raw('This is a test email.', function ($message) {
            $message->to('your_email@example.com')->subject('Test Email');
        });

        $this->info('Email Sent!');
    }
}
