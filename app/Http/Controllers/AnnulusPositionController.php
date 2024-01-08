<?php

namespace App\Http\Controllers;

use App\Http\Requests\AnnulusPositionRequest;
use App\Models\AnnulusPosition;

class AnnulusPositionController extends Controller
{
    public function index()
    {
        $this->authorize('viewAny', AnnulusPosition::class);

        return AnnulusPosition::all();
    }

    public function store(AnnulusPositionRequest $request)
    {
        $this->authorize('create', AnnulusPosition::class);

        return AnnulusPosition::create($request->validated());
    }

    public function show(AnnulusPosition $annulusPosition)
    {
        $this->authorize('view', $annulusPosition);

        return $annulusPosition;
    }

    public function update(AnnulusPositionRequest $request, AnnulusPosition $annulusPosition)
    {
        $this->authorize('update', $annulusPosition);

        $annulusPosition->update($request->validated());

        return $annulusPosition;
    }

    public function destroy(AnnulusPosition $annulusPosition)
    {
        $this->authorize('delete', $annulusPosition);

        $annulusPosition->delete();

        return response()->json();
    }
}
