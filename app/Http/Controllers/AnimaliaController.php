<?php

namespace App\Http\Controllers;

use App\Http\Requests\AnimaliaRequest;
use App\Models\Animalia;

class AnimaliaController extends Controller
{
    public function index()
    {
        $this->authorize('viewAny', Animalia::class);

        return Animalia::all();
    }

    public function store(AnimaliaRequest $request)
    {
        $this->authorize('create', Animalia::class);

        return Animalia::create($request->validated());
    }

    public function show(Animalia $animalia)
    {
        $this->authorize('view', $animalia);

        return $animalia;
    }

    public function update(AnimaliaRequest $request, Animalia $animalia)
    {
        $this->authorize('update', $animalia);

        $animalia->update($request->validated());

        return $animalia;
    }

    public function destroy(Animalia $animalia)
    {
        $this->authorize('delete', $animalia);

        $animalia->delete();

        return response()->json();
    }
}
