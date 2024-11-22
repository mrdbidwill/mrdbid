<?php

// app/Http/Controllers/BookController.php

namespace App\Http\Controllers;

use App\Models\DataSource;

class BookController extends Controller
{
    public function index()
    {
        // Fetch data from the data_source table where type is 2
        $books = DataSource::booksOfType(2);

        return view('book', compact('books'));
    }
}
