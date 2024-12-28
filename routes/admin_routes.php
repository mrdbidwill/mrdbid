<?php

use App\Http\Controllers\Admin\AdminExportDatabaseController;
use App\Http\Controllers\Admin\AdminMBListController;
use Illuminate\Support\Facades\Route;

// Grouping admin routes with proper namespace
Route::middleware(['auth'])->prefix('admin')->namespace('App\Http\Controllers\Admin')->group(function () {
    Route::get('/dashboard', function () {
        return view('admin.dashboard');
    })->name('admin.dashboard');

    Route::prefix('admin')->name('admin.')->group(function () {
        Route::get('mblist/upload', [AdminMBListController::class, 'showUploadForm'])->name('mblist.upload.form');
        Route::post('mblist/upload', [AdminMBListController::class, 'handleUpload'])->name('mblist.upload');
    });

    Route::resource('specimens', 'AdminSpecimenController')->names([
        'index' => 'admin.specimens.index',
        'create' => 'admin.specimens.create',
        'store' => 'admin.specimens.store',
        'show' => 'admin.specimens.show',
        'edit' => 'admin.specimens.edit',
        'update' => 'admin.specimens.update',
        'destroy' => 'admin.specimens.destroy',
    ]);

    Route::resource('characters', 'AdminCharacterController')->names([
        'index' => 'admin.characters.index',
        'create' => 'admin.characters.create',
        'store' => 'admin.characters.store',
        'show' => 'admin.characters.show',
        'edit' => 'admin.characters.edit',
        'update' => 'admin.characters.update',
        'destroy' => 'admin.characters.destroy',
    ]);

    Route::resource('data_sources', 'AdminDataSourceController')->names([
        'index' => 'admin.data_sources.index',
        'create' => 'admin.data_sources.create',
        'store' => 'admin.data_sources.store',
        'show' => 'admin.data_sources.show',
        'edit' => 'admin.data_sources.edit',
        'update' => 'admin.data_sources.update',
        'destroy' => 'admin.data_sources.destroy',
    ]);

    Route::post('export_databases/export', [AdminExportDatabaseController::class, 'admin_export_database'])->name('admin.export_databases.export');

    Route::post('export_databases/save', [AdminExportDatabaseController::class, 'saveDatabaseToLocalFile'])->name('admin.export_databases.save');

    Route::resource('export_databases', 'AdminExportDatabaseController')->names([
        'index' => 'admin.export_databases.index',
        'create' => 'admin.export_databases.create',
        'store' => 'admin.export_databases.store',
        'show' => 'admin.export_databases.show',
        'edit' => 'admin.export_databases.edit',
        'update' => 'admin.export_databases.update',
        'destroy' => 'admin.export_databases.destroy',
    ]);

    Route::resource('lookups', 'AdminLookUpController')->names([
        'index' => 'admin.lookups.index',
        'create' => 'admin.lookups.create',
        'store' => 'admin.lookups.store',
        'show' => 'admin.lookups.show',
        'edit' => 'admin.lookups.edit',
        'update' => 'admin.lookups.update',
        'destroy' => 'admin.lookups.destroy',
    ]);

    Route::resource('mblists', 'AdminMBListController')->names([
        'index' => 'admin.mblists.index',
        'create' => 'admin.mblists.create',
        'store' => 'admin.mblists.store',
        'show' => 'admin.mblists.show',
        'edit' => 'admin.mblists.edit',
        'update' => 'admin.mblists.update',
        'destroy' => 'admin.mblists.destroy',
    ]);
});
