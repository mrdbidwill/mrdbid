<?php

use App\Http\Controllers\Admin\AdminCharacterController;
use App\Http\Controllers\Admin\AdminDataSourceController;
use App\Http\Controllers\Admin\AdminExportDatabaseController;
use App\Http\Controllers\Admin\AdminLookUpController;
use App\Http\Controllers\Admin\AdminSpecimenController;
use Illuminate\Support\Facades\Route;

Route::prefix('admin')->name('admin_')->namespace('App\Http\Controllers\Admin')->middleware(['auth', 'verified', 'admin'])->group(function () {
    Route::view('/dashboard', 'admin.dashboard')->name('dashboard');
    Route::get('/export-database', [AdminExportDatabaseController::class, 'index'])->name('export_database.index');
    Route::post('/export-database', [AdminExportDatabaseController::class, 'export'])->name('export_database.export');
    Route::post('/export-database/save', [AdminExportDatabaseController::class, 'saveDatabaseToLocalFile'])->name('export_database.save');
    Route::resource('characters', AdminCharacterController::class);
    Route::resource('data_sources', AdminDataSourceController::class);
    Route::resource('lookups', AdminLookUpController::class);
    Route::resource('specimens', AdminSpecimenController::class);
});
