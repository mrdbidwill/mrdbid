<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\View\View;

class ImageSpecimenThumbnailController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(): void
    {
        // return view('specimens.look_up_tables.state');  // correct this
    }

    public function create() {}

    public function store(Request $request) {}

    public function show($id) {}

    public function edit($id) {}

    public function update(Request $request, $id) {}

    public function destroy($id) {}
}
