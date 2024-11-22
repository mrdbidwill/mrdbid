<?php

namespace App\Http\Controllers;

use App\Mail\ContactMail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class ContactController extends Controller
{
    public function showContactForm()
    {
        return view('contact');
    }

    public function sendContactEmail(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'message' => 'required|string',
            'recipient' => 'required|in:contact@mrdbid.com,webmaster@mrdbid.com,will@mrdbid.com',
        ]);

        // Send the email
        Mail::to($validated['recipient'])->send(new ContactMail($validated));

        return back()->with('status', 'Your message has been sent successfully!');
    }
}
