<?php

use App\Http\Controllers\LookupController;
use Illuminate\Support\Facades\Route;

// Protect lookup routes to ensure only authenticated users can use them
Route::middleware('auth')->prefix('lookups')->group(function () {
    // Generic route to fetch all lookup records
    Route::get('{table}', [LookupController::class, 'fetch'])->name('lookups.fetch');

    // More specific routes for specialized lookups (if needed)
    Route::get('countries', [LookupController::class, 'fetchCountries'])->name('lookups.countries');
    Route::get('states/{country_id}', [LookupController::class, 'fetchStatesByCountry'])->name('lookups.states');
});
