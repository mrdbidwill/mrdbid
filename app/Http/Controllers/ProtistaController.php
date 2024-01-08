<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProtistaRequest;
use App\Models\Protista;

class ProtistaController extends Controller
{
    public function index()
    {
        $this->authorize('viewAny', Protista::class);

        return Protista::all();
    }

    public function store(ProtistaRequest $request)
    {
        $this->authorize('create', Protista::class);

        return Protista::create($request->validated());
    }

    public function show(Protista $protista)
    {
        $this->authorize('view', $protista);

        return $protista;
    }

    public function update(ProtistaRequest $request, Protista $protista)
    {
        $this->authorize('update', $protista);

        $protista->update($request->validated());

        return $protista;
    }

    public function destroy(Protista $protista)
    {
        $this->authorize('delete', $protista);

        $protista->delete();

        return response()->json();
    }
}
