<?php

use App\Http\Controllers\DataSourceController;
use App\Http\Controllers\SpecimenController;
use Illuminate\Support\Facades\Route;


Route::get('/', function () {
    return view('welcome');    // remove
});

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
    Route::get('/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');    // remove
});



// Publicly accessible routes
Route::view('/', 'home')->name('home');
Route::view('/contact', 'contact')->name('contact');
Route::view('/about', 'about')->name('about');

// Public route for viewing books
Route::get('/books', [DataSourceController::class, 'showFilteredBooks'])->name('books.showFilteredBooks');
