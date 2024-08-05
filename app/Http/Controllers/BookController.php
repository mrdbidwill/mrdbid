<?php

namespace App\Http\Controllers;

use App\Models\DataSource;

class BookController extends Controller
{
    public function index()
    {
        //$books = DataSource::where('type', 2)
        $books = DataSource::where('type', 2)->get()->sortBy('my_rating');

        return view('book', ['books' => $books]);
    }
}
