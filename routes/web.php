<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('home');
});

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
    Route::get('/dashboard/{id}', function () {
        return view('dashboard{id}');
    })->name('dashboard');

    Route::get('/trees', function () {
        return view('trees.trees');
    })->name('trees');
});
