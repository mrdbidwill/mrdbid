<?php

use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Route;

if (app()->isLocal() || app()->runningUnitTests()) {
    Route::get('/send-test-email', function () {
        try {
            Mail::raw('This is a test email.', function ($message) {
                $message->to('your-email@example.com')->subject('Test Email');
            });

            return 'Test email sent successfully';
        } catch (\Exception $e) {
            Log::error('Failed to send email: '.$e->getMessage());

            return 'Failed to send email: '.$e->getMessage();
        }
    });

    Route::get('/check-config', function () {
        return [
            'MAIL_MAILER' => config('mail.default'),
            'MAIL_HOST' => config('mail.mailers.smtp.host'),
            'MAIL_PORT' => config('mail.mailers.smtp.port'),
        ];
    });
}
