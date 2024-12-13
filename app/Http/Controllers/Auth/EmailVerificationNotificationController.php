<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;

class EmailVerificationNotificationController extends Controller
{
    /**
     * Send a new email verification notification.
     */
    public function store(Request $request): RedirectResponse
    {
        if ($request->user()->hasVerifiedEmail()) {
            return redirect()->intended(route('specimens.index', absolute: false));
        }

        $request->user()->sendEmailVerificationNotification();  // not part of duplicate verification emails

        return back()->with('status', 'verification-link-sent');
    }
}
