<?php

use App\Http\Controllers\Admin\AdminDataSourceController;
use App\Http\Controllers\Admin\AdminExportDatabaseController;
use App\Http\Controllers\Admin\AdminLookUpController;
use App\Http\Controllers\Admin\AdminMBListController;
use App\Http\Controllers\Admin\AdminMrCharacterController;
use App\Http\Controllers\Admin\AdminSpecimenController;
use Illuminate\Support\Facades\Route;

// Admin-only routes
Route::middleware(['auth'])->prefix('admin')->group(function () {

    // Restrict access based on user type
    if (auth()->check() && auth()->user()->type >= 4) {
        abort(403, 'Unauthorized action.');
    }

    Route::view('/dashboard', 'admin.dashboard')->name('admin.dashboard');

    // Admin resource routes
    Route::resource('specimens', AdminSpecimenController::class)->names('admin.specimens');
    Route::resource('mr_characters', AdminMrCharacterController::class)->names('admin.mr_characters');
    Route::resource('data_sources', AdminDataSourceController::class)->names('admin.data_sources');
    Route::resource('lookups', AdminLookUpController::class)->names('admin.lookups');
    Route::resource('mblists', AdminMBListController::class)->names('admin.mblists');
    Route::post('export_databases/export', [AdminExportDatabaseController::class, 'admin_export_database'])->name('admin.export_databases.export');
});
