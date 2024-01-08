<?php

namespace App\Http\Controllers;

use App\Http\Requests\CapContextFleshTextureRequest;
use App\Models\CapContextFleshTexture;

class CapContextFleshTextureController extends Controller
{
    public function index()
    {
        $this->authorize('viewAny', CapContextFleshTexture::class);

        return CapContextFleshTexture::all();
    }

    public function store(CapContextFleshTextureRequest $request)
    {
        $this->authorize('create', CapContextFleshTexture::class);

        return CapContextFleshTexture::create($request->validated());
    }

    public function show(CapContextFleshTexture $capContextFleshTexture)
    {
        $this->authorize('view', $capContextFleshTexture);

        return $capContextFleshTexture;
    }

    public function update(CapContextFleshTextureRequest $request, CapContextFleshTexture $capContextFleshTexture)
    {
        $this->authorize('update', $capContextFleshTexture);

        $capContextFleshTexture->update($request->validated());

        return $capContextFleshTexture;
    }

    public function destroy(CapContextFleshTexture $capContextFleshTexture)
    {
        $this->authorize('delete', $capContextFleshTexture);

        $capContextFleshTexture->delete();

        return response()->json();
    }
}
