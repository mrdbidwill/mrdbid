<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;

class ContactController extends Controller
{
    public function showForm()
    {
        return view('contact');
    }

    public function submitForm(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email',
            'recipient' => 'required|in:contact,webmaster,will',
            'message' => 'required|string',
        ]);

        $data = [
            'name' => (string) $validated['name'],
            'email' => (string) $validated['email'],
            'message' => (string) $validated['message'],
        ];

        $recipient = $validated['recipient'];
        $recipientEmail = '';

        switch ($recipient) {
            case 'contact':
                Config::set('mail.mailers.smtp.username', env('MAIL_USERNAME_CONTACT'));
                Config::set('mail.mailers.smtp.password', env('MAIL_PASSWORD_CONTACT'));
                $recipientEmail = 'contact@localhost';
                break;

            case 'webmaster':
                Config::set('mail.mailers.smtp.username', env('MAIL_USERNAME_WEBMASTER'));
                Config::set('mail.mailers.smtp.password', env('MAIL_PASSWORD_WEBMASTER'));
                $recipientEmail = 'webmaster@localhost';
                break;

            case 'will':
                Config::set('mail.mailers.smtp.username', env('MAIL_USERNAME_WILL'));
                Config::set('mail.mailers.smtp.password', env('MAIL_PASSWORD_WILL'));
                $recipientEmail = 'will@localhost';
                break;
        }

        try {
            Mail::raw('This is a test email from '.$recipient, function ($message) use ($recipientEmail) {
                $message->to($recipientEmail)
                    ->subject('Contact Form Submission');
            });
            Log::info('Email sent successfully to '.$recipientEmail);
        } catch (\Exception $e) {
            Log::error('Failed to send email: '.$e->getMessage());
        }

        return back()->with('success', 'Thank you for your message. We will get back to you soon.');
    }
}
