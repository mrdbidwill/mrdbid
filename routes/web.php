<?php

use App\Http\Controllers\AnimaliaController;
use App\Http\Controllers\MoneraController;
use App\Http\Controllers\PlantaeController;
use App\Http\Controllers\ProtistaController;
use App\Http\Controllers\SpecimenController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
    Route::get('/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');
});

Route::middleware('auth')->group(function () {
    Route::get('/fungi.fungi-specimen', [SpecimenController::class, 'index'])->name('fungi.fungi-specimen');
    Route::get('/animalia.animalia-specimen', [AnimaliaController::class, 'index'])->name('animalia.animalia-specimen');
    Route::get('/monera.monera-specimen', [MoneraController::class, 'index'])->name('monera.monera-specimen');
    Route::get('/plantae.plantae-specimen', [PlantaeController::class, 'index'])->name('plantae.plantae-specimen');
    Route::get('/protista.protista-specimen', [ProtistaController::class, 'index'])->name('protista.protista-specimen');
});
