<?php

// app/Http/Controllers/BookController.php

namespace App\Http\Controllers;

use App\Models\DataSource;
use Illuminate\Support\Facades\Auth;

class BookController extends Controller
{
    public function index()
    {
        // Fetch data from the data_source table where type is 2
        $books = DataSource::booksOfType(2);

        // Get the current user's member type
        $memberType = Auth::user()->type;

        // Pass the data to the view
        return view('book', ['books' => $books, 'memberType' => $memberType]);
    }
}
