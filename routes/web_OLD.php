<?php

use App\Http\Controllers\CharacterController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\SpecimenController;
use Illuminate\Support\Facades\Route;

Route::view('/', 'home')->name('home');
Route::view('/contact', 'contact');
Route::view('/about', 'about');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
    Route::resource('specimens', SpecimenController::class);
    Route::resource('characters', CharacterController::class);
});

Route::get('phpmyinfo', function () {
    phpinfo();
})->name('phpmyinfo');

require __DIR__.'/auth.php';
