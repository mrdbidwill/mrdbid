<?php
use App\Http\Controllers\DataSourceController;
use Illuminate\Support\Facades\Route;

// Public routes (for guests)
Route::get('/', function () {
    return view('home'); // Serve home.blade.php as the main landing page
})->name('home');

Route::view('/about', 'about')->name('about');
Route::view('/contact', 'contact')->name('contact');

// Public route for viewing books
Route::get('/books', [DataSourceController::class, 'showFilteredBooks'])->name('books.showFilteredBooks');

// Authenticated routes (for logged-in users with email verification)
Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/specimens', function () {
        return view('specimens.index'); // Load specimens.index blade file
    })->name('specimens.index');

    // Redirect home route to `/specimens` for authenticated users
    Route::get('/', function () {
        return redirect(route('specimens.index'));
    });
});


