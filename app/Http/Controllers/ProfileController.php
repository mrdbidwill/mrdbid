<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProfileController extends Controller
{

public function edit()
{
    // Return the view for editing the profile
    return view('profile.update-profile-information-form', ['user' => auth()->user(), // Passing the authenticated user to the view
    ]);
}

public function update(Request $request)
{
$request->validate([
'name' => 'required|string|max:255',
'email' => 'required|email|max:255|unique:users,email,' . Auth::id(),
'photo' => 'nullable|image|max:2048',
]);

$user = Auth::user();

// Update user information
$user->update([
'name' => $request->name,
'email' => $request->email,
]);

// Handle photo upload
if ($request->hasFile('photo')) {
$path = $request->file('photo')->store('profile-photos', 'public');
$user->forceFill(['profile_photo_path' => $path])->save();
}

return redirect()->route('profile.edit')->with('status', 'Profile updated successfully.');
}

public function resendVerification()
{
if (Auth::user()->hasVerifiedEmail()) {
return redirect()->route('profile.edit');
}

Auth::user()->sendEmailVerificationNotification();

return back()->with('verificationLinkSent', true);
}
}
