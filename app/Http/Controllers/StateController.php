<?php

namespace App\Http\Controllers;

use App\Http\Requests\StateRequest;
use App\Models\State;

class StateController extends Controller
{
    public function index()
    {
        $this->authorize('viewAny', State::class);

        return State::all();
    }

    public function store(StateRequest $request)
    {
        $this->authorize('create', State::class);

        return State::create($request->validated());
    }

    public function show(State $state)
    {
        $this->authorize('view', $state);

        return $state;
    }

    public function update(StateRequest $request, State $state)
    {
        $this->authorize('update', $state);

        $state->update($request->validated());

        return $state;
    }

    public function destroy(State $state)
    {
        $this->authorize('delete', $state);

        $state->delete();

        return response()->json();
    }
}
