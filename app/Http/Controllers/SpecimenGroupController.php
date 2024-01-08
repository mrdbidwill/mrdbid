<?php

namespace App\Http\Controllers;

use App\Http\Requests\SpecimenGroupRequest;
use App\Models\SpecimenGroup;

class SpecimenGroupController extends Controller
{
    public function index()
    {
        $this->authorize('viewAny', SpecimenGroup::class);

        return SpecimenGroup::all();
    }

    public function store(SpecimenGroupRequest $request)
    {
        $this->authorize('create', SpecimenGroup::class);

        return SpecimenGroup::create($request->validated());
    }

    public function show(SpecimenGroup $specimenGroup)
    {
        $this->authorize('view', $specimenGroup);

        return $specimenGroup;
    }

    public function update(SpecimenGroupRequest $request, SpecimenGroup $specimenGroup)
    {
        $this->authorize('update', $specimenGroup);

        $specimenGroup->update($request->validated());

        return $specimenGroup;
    }

    public function destroy(SpecimenGroup $specimenGroup)
    {
        $this->authorize('delete', $specimenGroup);

        $specimenGroup->delete();

        return response()->json();
    }
}
