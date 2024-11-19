<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Specimen;
use Illuminate\Http\Request;

class AdminSpecimenController extends Controller
{
    public function index()
    {
        $specimen_lists = Specimen::simplePaginate(25);

        return view('admin.admin_specimen.index', compact('specimen_lists'));
    }

    public function create()
    {
        return view('admin.admin_specimen.create');
    }

    public function store(Request $request)
    {
        // Placeholder: Implement logic later
        return redirect()->route('admin_specimen.index');
    }

    public function show($id)
    {
        $specimen = Specimen::findOrFail($id);

        return view('admin.admin_specimen.show', compact('specimen'));
    }

    public function edit($id)
    {
        $specimen = Specimen::findOrFail($id);

        return view('admin.admin_specimen.edit', compact('specimen'));
    }

    public function update(Request $request, $id)
    {
        // Placeholder: Implement logic later
        return redirect()->route('admin_specimen.index');
    }

    public function destroy($id)
    {
        // Placeholder: Implement logic later
        return redirect()->route('admin_specimen.index');
    }
}
