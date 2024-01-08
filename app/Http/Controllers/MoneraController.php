<?php

namespace App\Http\Controllers;

use App\Http\Requests\MoneraRequest;
use App\Models\Monera;

class MoneraController extends Controller
{
    public function index()
    {
        $this->authorize('viewAny', Monera::class);

        return Monera::all();
    }

    public function store(MoneraRequest $request)
    {
        $this->authorize('create', Monera::class);

        return Monera::create($request->validated());
    }

    public function show(Monera $monera)
    {
        $this->authorize('view', $monera);

        return $monera;
    }

    public function update(MoneraRequest $request, Monera $monera)
    {
        $this->authorize('update', $monera);

        $monera->update($request->validated());

        return $monera;
    }

    public function destroy(Monera $monera)
    {
        $this->authorize('delete', $monera);

        $monera->delete();

        return response()->json();
    }
}
