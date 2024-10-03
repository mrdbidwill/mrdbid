<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Specimen;
use Illuminate\Http\Request;

class AdminSpecimenController extends Controller
{
    public function index()
    {
        //DB::enableQueryLog();
        $specimen_lists = Specimen::query()->simplePaginate(25);
        // Debug the log
        //dd(DB::getQueryLog());
        //dd($specimen_lists);

        return view('admin.admin_specimen.index', compact('specimen_lists'));
    }

    public function create() {}

    public function store(Request $request) {}

    public function show($id) {}

    public function edit($id) {}

    public function update(Request $request, $id) {}

    public function destroy($id) {}
}
