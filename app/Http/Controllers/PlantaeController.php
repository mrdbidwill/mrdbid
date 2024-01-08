<?php

namespace App\Http\Controllers;

use App\Http\Requests\PlantaeRequest;
use App\Models\Plantae;

class PlantaeController extends Controller
{
    public function index()
    {
        $this->authorize('viewAny', Plantae::class);

        return Plantae::all();
    }

    public function store(PlantaeRequest $request)
    {
        $this->authorize('create', Plantae::class);

        return Plantae::create($request->validated());
    }

    public function show(Plantae $plantae)
    {
        $this->authorize('view', $plantae);

        return $plantae;
    }

    public function update(PlantaeRequest $request, Plantae $plantae)
    {
        $this->authorize('update', $plantae);

        $plantae->update($request->validated());

        return $plantae;
    }

    public function destroy(Plantae $plantae)
    {
        $this->authorize('delete', $plantae);

        $plantae->delete();

        return response()->json();
    }
}
