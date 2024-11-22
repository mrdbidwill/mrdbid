<?php

namespace App\Http\Controllers\Lookup;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\View\View;

class PartInVeilAnnRiPositController extends Controller
{
    public function index(): View
    {
        return view('specimens.look_up_tables.part_in_veil_ann_ri_posit.index');
    }

    public function create() {}

    public function store(Request $request) {}

    public function show($id) {}

    public function edit($id) {}

    public function update(Request $request, $id) {}

    public function destroy($id) {}
}
