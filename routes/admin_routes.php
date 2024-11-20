<?php

use App\Http\Controllers\Admin\MBListController;
use Illuminate\Support\Facades\Route;

// Grouping admin routes with proper namespace
Route::middleware(['auth'])->prefix('admin')->namespace('App\Http\Controllers\Admin')->group(function () {
    Route::get('/dashboard', function () {
        return view('admin.dashboard');
    })->name('admin.dashboard');

    Route::prefix('admin')->name('admin.')->group(function () {
        Route::get('mblist/upload', [MBListController::class, 'showUploadForm'])->name('mblist.upload.form');
        Route::post('mblist/upload', [MBListController::class, 'handleUpload'])->name('mblist.upload');
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
});
