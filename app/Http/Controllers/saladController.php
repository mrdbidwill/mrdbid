<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class saladController extends Controller
{
    public function index(): View
    {
        return view('specimens.look_up_tables.state');
    }

    public function create() {}

    public function store(Request $request) {}

    public function show($id) {}

    public function edit($id) {}

    public function update(Request $request, $id) {}

    public function destroy($id) {}
}
