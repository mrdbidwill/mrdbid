<?php

use App\Http\Controllers\DataSourceController;
use App\Http\Controllers\SpecimenController;
use Illuminate\Support\Facades\Route;

// Publicly accessible routes
Route::view('/', 'home')->name('home');
Route::view('/contact', 'contact')->name('contact');
Route::view('/about', 'about')->name('about');

// Public route for viewing books
Route::get('/books', [DataSourceController::class, 'showFilteredBooks'])->name('books.showFilteredBooks');

// Give guests an immutable list of what is available
Route::get('/specimens/guest', [SpecimenController::class, 'guestIndex'])->name('specimens.guest.index');
