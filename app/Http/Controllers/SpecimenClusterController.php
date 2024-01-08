<?php

namespace App\Http\Controllers;

use App\Http\Requests\SpecimenClusterRequest;
use App\Models\SpecimenCluster;

class SpecimenClusterController extends Controller
{
    public function index()
    {
        $this->authorize('viewAny', SpecimenCluster::class);

        return SpecimenCluster::all();
    }

    public function store(SpecimenClusterRequest $request)
    {
        $this->authorize('create', SpecimenCluster::class);

        return SpecimenCluster::create($request->validated());
    }

    public function show(SpecimenCluster $specimenCluster)
    {
        $this->authorize('view', $specimenCluster);

        return $specimenCluster;
    }

    public function update(SpecimenClusterRequest $request, SpecimenCluster $specimenCluster)
    {
        $this->authorize('update', $specimenCluster);

        $specimenCluster->update($request->validated());

        return $specimenCluster;
    }

    public function destroy(SpecimenCluster $specimenCluster)
    {
        $this->authorize('delete', $specimenCluster);

        $specimenCluster->delete();

        return response()->json();
    }
}
