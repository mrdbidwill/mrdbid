<?php

use App\Http\Controllers\AdminCharacterController;
use App\Http\Controllers\AdminDataSourceController;
use App\Http\Controllers\AdminExportDatabaseController;
use App\Http\Controllers\AdminLookUpController;
use App\Http\Controllers\AdminSpecimenController;
use App\Http\Controllers\BookController;
use Illuminate\Foundation\Auth\EmailVerificationRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// Public routes
Route::view('/', 'home')->name('home');
Route::view('/contact', 'contact')->name('contact');
Route::view('/about', 'about')->name('about');
Route::get('/books', [BookController::class, 'index'])->name('books.index');

// Admin routes - Needs auth, verified, admin
Route::middleware(['auth', 'verified', 'admin'])->prefix('admin')->name('admin_')->group(function () {
    Route::view('/dashboard', 'admin.dashboard')->name('dashboard');
    Route::get('/export-database', [AdminExportDatabaseController::class, 'index'])->name('export_database.index');
    Route::post('/export-database', [AdminExportDatabaseController::class, 'export'])->name('export_database.export');
    Route::post('/export-database/save', [AdminExportDatabaseController::class, 'saveDatabaseToLocalFile'])->name('export_database.save');
    Route::resource('characters', AdminCharacterController::class);
    Route::resource('data_sources', AdminDataSourceController::class);
    Route::resource('lookups', AdminLookUpController::class);
    Route::resource('specimens', AdminSpecimenController::class);
});

// User routes - Needs auth, verified
Route::middleware(['auth', 'verified'])->group(function () {
    extracted(); // Veil resource routes

    // Lookup routes that should be authenticated and verified
    lookupRoutesThatShouldBeAuthenticatedAndVerified();
});

// Unverified email handling routes - Needs auth only
Route::middleware('auth')->group(function () {
    Route::get('/email/verify', function () {
        return view('auth.verify-email');
    })->name('verification.notice');

    Route::get('/email/verify/{id}/{hash}', function (EmailVerificationRequest $request) {
        $request->fulfill();

        return redirect('/home')->with('message', 'Your email has been verified!');
    })->middleware(['signed'])->name('verification.verify');

    Route::post('/email/verification-notification', function (Request $request) {
        $request->user()->sendEmailVerificationNotification();

        return back()->with('message', 'Verification link sent!');
    })->middleware('throttle:6,1')->name('verification.send');
});

// Test routes - Can be safely deleted or kept as needed
extracted();

// Include default auth routes provided by Laravel
require __DIR__.'/auth.php';
