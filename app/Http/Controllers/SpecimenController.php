<?php

namespace App\Http\Controllers;

use App\Http\Requests\SpecimenRequest;
use App\Models\Specimen;

class SpecimenController extends Controller
{
    public function index()
    {
        $this->authorize('viewAny', Specimen::class);

        return Specimen::all();
    }

    public function store(SpecimenRequest $request)
    {
        $this->authorize('create', Specimen::class);

        return Specimen::create($request->validated());
    }

    public function show(Specimen $specimen)
    {
        $this->authorize('view', $specimen);

        return $specimen;
    }

    public function update(SpecimenRequest $request, Specimen $specimen)
    {
        $this->authorize('update', $specimen);

        $specimen->update($request->validated());

        return $specimen;
    }

    public function destroy(Specimen $specimen)
    {
        $this->authorize('delete', $specimen);

        $specimen->delete();

        return response()->json();
    }
}
