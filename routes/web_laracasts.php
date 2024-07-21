<?php

use App\Http\Controllers\RegisteredUserController;
use App\Http\Controllers\SessionController;
use App\Http\Controllers\SpecimenController;
use Illuminate\Support\Facades\Route;

Route::view('/', 'home');
Route::view('/contact', 'contact');

Route::get('/specimens', [SpecimenController::class, 'index']);
Route::get('/specimens/create', [SpecimenController::class, 'create']);
Route::post('/specimens', [SpecimenController::class, 'store'])->middleware('auth');
Route::get('/specimens/{specimen}', [SpecimenController::class, 'show']);

Route::get('/specimens/{specimen}/edit', [SpecimenController::class, 'edit'])
    ->middleware('auth')
    ->can('edit', 'specimen');

Route::patch('/specimens/{specimen}', [SpecimenController::class, 'update']);
Route::delete('/specimens/{specimen}', [SpecimenController::class, 'destroy']);

// Auth
Route::get('/register', [RegisteredUserController::class, 'create']);
Route::post('/register', [RegisteredUserController::class, 'store']);

Route::get('/login', [SessionController::class, 'create'])->name('login');
Route::post('/login', [SessionController::class, 'store']);
Route::post('/logout', [SessionController::class, 'destroy']);

Route::get('phpmyinfo', function () {
    phpinfo();
})->name('phpmyinfo');

require __DIR__.'/auth.php';
