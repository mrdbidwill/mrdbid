<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class ContactMail extends Mailable
{
    use Queueable, SerializesModels;

    public $data;

    public function __construct($data)
    {
        $this->data = $data;
    }

    public function build()
    {
        return $this->view('emails.contact')
            ->with([
                'name' => $this->data['name'],
                'email' => $this->data['email'],
                'messageContent' => $this->data['message'],
            ])
            ->to($this->data['recipient'])
            ->subject('New Contact Message');
    }
}
