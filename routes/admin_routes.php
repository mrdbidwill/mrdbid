<?php

use App\Http\Controllers\Admin\AdminExportDatabaseController;
use App\Http\Controllers\Admin\AdminSpecimenController;
use Illuminate\Support\Facades\Route;

// Admin-only routes
Route::middleware(['auth', 'isAdmin'])->prefix('admin')->group(function () {
    Route::view('/dashboard', 'admin.dashboard')->name('admin.dashboard');

    // Admin resource routes
    Route::resource('specimens', AdminSpecimenController::class)->names('admin.specimens');

    Route::post('export_databases/export', [AdminExportDatabaseController::class, 'admin_export_database'])->name('admin.export_databases.export');
});
