<?php

use App\Http\Controllers\AbundanceController;
use App\Http\Controllers\CharacterController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\SpecimenClusterController;
use App\Http\Controllers\SpecimenController;
use App\Http\Controllers\SpecimenGroupController;
use App\Http\Controllers\TreeController;
use Illuminate\Support\Facades\Route;

Route::view('/', 'home')->name('home');
Route::view('/contact', 'contact')->name('contact');
Route::view('/about', 'about')->name('about');
Route::view('/books', 'books')->name('books');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
    Route::resource('specimens', SpecimenController::class);
    Route::resource('characters', CharacterController::class);

    Route::resource('look_up_tables.abundance', AbundanceController::class);
    Route::resource('cluster', SpecimenClusterController::class);
    Route::resource('group', SpecimenGroupController::class);
    Route::resource('tree', TreeController::class);
});

Route::get('phpmyinfo', function () {
    phpinfo();
})->name('phpmyinfo');

require __DIR__.'/auth.php';
