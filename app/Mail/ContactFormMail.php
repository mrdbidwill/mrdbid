<?php

// app/Mail/ContactFormMail.php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;

class ContactFormMail extends Mailable
{
    use Queueable, SerializesModels;

    public $details;

    public function __construct($details)
    {
        $this->details = $details;
    }

    public function build()
    {
        return $this
            ->from('contact@mrdbid.com')
            ->to('webmaster@mrdbid.com')
            ->subject('New Contact Form Submission')
            ->view('emails.contact')
            ->with('details', $this->details);
    }

    public function testEmail()
    {
        Mail::raw('This is a test email.', function ($message) {
            $message->to('test@example.com')->subject('Test Email');
        });
    }
}
