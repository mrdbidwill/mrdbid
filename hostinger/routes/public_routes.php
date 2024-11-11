<?php

use App\Http\Controllers\BookController;
use Illuminate\Support\Facades\Route;

Route::view('/', 'home')->name('home');
Route::view('/contact', 'contact')->name('contact');
Route::view('/about', 'about')->name('about');
Route::get('/books', [BookController::class, 'index'])->name('books.index');
