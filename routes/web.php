<?php

use App\Http\Controllers\CharacterController;
use App\Http\Controllers\ImageController;
use App\Http\Controllers\ImagesSpecimenController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\SpecimenController;
use Illuminate\Support\Facades\Route;

Route::view('/', 'home')->name('home');
Route::view('/contact', 'contact')->name('contact');
Route::view('/about', 'about')->name('about');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
    Route::resource('specimens', SpecimenController::class);
    Route::resource('characters', CharacterController::class);
    Route::resource('images_specimen', ImagesSpecimenController::class);

    Route::get('upload/image-upload', [ImageController::class, 'index'])->name('image.index');
    Route::post('upload/image-upload', [ImageController::class, 'store'])->name('image.store');
});

Route::get('phpmyinfo', function () {
    phpinfo();
})->name('phpmyinfo');

require __DIR__.'/auth.php';
