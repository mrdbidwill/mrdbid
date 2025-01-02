<?php

use App\Http\Controllers\DataSourceController;
use App\Http\Controllers\SpecimenController;
use Illuminate\Support\Facades\Route;

Route::view('/', 'home')->name('home');
Route::view('/contact', 'contact')->name('contact');
Route::view('/about', 'about')->name('about');
Route::get('/books', [DataSourceController::class, 'showFilteredBooks'])->name('books.showFilteredBooks');

Route::get('/specimens/guest', [SpecimenController::class, 'guestIndex'])->name('specimens.guest.index');
