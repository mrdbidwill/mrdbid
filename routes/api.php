<?php

use App\Http\Controllers\Lookup\StateController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Example API endpoint for fetching states by country code
Route::get('/states/{countryCode}', [StateController::class, 'getStatesByCountry']);
