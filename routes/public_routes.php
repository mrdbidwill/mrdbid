<?php

use App\Http\Controllers\DataSourceController;
use Illuminate\Support\Facades\Route;

Route::view('/', 'home')->name('home');
Route::view('/contact', 'contact')->name('contact');
Route::view('/about', 'about')->name('about');
Route::get('/books', [DataSourceController::class, 'showFilteredBooks'])->name('books.showFilteredBooks');
