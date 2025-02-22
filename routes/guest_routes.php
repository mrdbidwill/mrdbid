<?php

use App\Http\Controllers\SpecimenController;
use Illuminate\Support\Facades\Route;

// Guest-only routes (e.g., demo pages for unregistered users)
Route::get('/specimens/guest', [SpecimenController::class, 'guestIndex'])->name('specimens.guest.index');
