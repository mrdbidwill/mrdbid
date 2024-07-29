<?php

namespace App\Http\Controllers;

use App\Http\Requests\SoupRequest;
use App\Http\Resources\SoupResource;
use App\Models\Soup;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

class SoupController extends Controller
{
    use AuthorizesRequests;

    public function index()
    {
        $this->authorize('viewAny', Soup::class);

        return SoupResource::collection(Soup::all());
    }

    public function store(SoupRequest $request)
    {
        $this->authorize('create', Soup::class);

        return new SoupResource(Soup::create($request->validated()));
    }

    public function show(Soup $soup)
    {
        $this->authorize('view', $soup);

        return new SoupResource($soup);
    }

    public function update(SoupRequest $request, Soup $soup)
    {
        $this->authorize('update', $soup);

        $soup->update($request->validated());

        return new SoupResource($soup);
    }

    public function destroy(Soup $soup)
    {
        $this->authorize('delete', $soup);

        $soup->delete();

        return response()->json();
    }
}
