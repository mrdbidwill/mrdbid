<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\View\View;

class PartialInnerVeilFateController extends Controller
{
    public function index(): View
    {
        return view('specimens.look_up_tables.partial_inner_veil_fate');
    }

    public function create() {}

    public function store(Request $request) {}

    public function show($id) {}

    public function edit($id) {}

    public function update(Request $request, $id) {}

    public function destroy($id) {}
}
