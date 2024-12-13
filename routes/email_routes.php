<?php

use App\Http\Controllers\Auth\EmailVerificationNotificationController;
use App\Http\Controllers\Auth\EmailVerificationPromptController;
use App\Http\Controllers\Auth\VerifyEmailController;
use App\Http\Controllers\ContactController;
use Illuminate\Foundation\Auth\EmailVerificationRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::middleware('auth')->group(function () {
    Route::get('/email/verify', function () {
        return view('auth.verify-email');
    })->name('verification.notice.alt');
    /*
        Route::get('/email/verify/{id}/{hash}', function (EmailVerificationRequest $request) {
            $request->fulfill();
            return redirect('specimens')->with('message', 'Your email has been verified!');
        })->middleware(['signed'])->name('verification.verify');
    */

    /*
    Route::post('/email/verification-notification', function (Request $request) {
        $request->user()->sendEmailVerificationNotification();   // explicitly sends email verification

        return back()->with('message', 'Verification link sent!');
    })->middleware('throttle:6,1')->name('verification.send');
*/
    Route::post('/contact/sendContactEmail', [ContactController::class, 'send'])
        ->name('contact.send')
        ->middleware('throttle:10,1');

    // Prompt the user to verify their email if not yet verified
    Route::get('verify-email', EmailVerificationPromptController::class)
        ->name('verification.notice');       // - Reminds the user to verify their email

    // Handle verification link clicks
    Route::get('verify-email/{id}/{hash}', VerifyEmailController::class)
        ->middleware(['signed', 'throttle:6,1'])  // 6 requests per minute
        ->name('verification.verify');  // - Completes the verification process.

    // Resend email verification notification
    Route::post('email/verification-notification', [EmailVerificationNotificationController::class, 'store'])
        ->middleware('throttle:1,10')   // 1 request every 10 minutes
        ->name('verification.send');

});
