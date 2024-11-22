<?php

// test_mail.php
require 'vendor/autoload.php';

use Illuminate\Support\Facades\Mail;

Mail::raw('This is a test email.', function ($message) {
    $message->to('your_email@example.com')->subject('Test Email');
});

echo 'Email Sent!';
