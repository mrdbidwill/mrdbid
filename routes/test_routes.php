<?php

use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Route;

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
        'MAIL_USERNAME' => config('mail.mailers.smtp.username'),
        'MAIL_PASSWORD' => config('mail.mailers.smtp.password'),
        'MAIL_ENCRYPTION' => config('mail.mailers.smtp.encryption'),
        'MAIL_FROM_ADDRESS' => config('mail.from.address'),
        'MAIL_FROM_NAME' => config('mail.from.name'),
    ];
});
