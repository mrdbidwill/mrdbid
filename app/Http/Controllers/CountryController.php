<?php

namespace App\Http\Controllers;

use App\Http\Requests\CountryRequest;
use App\Models\Country;

class CountryController extends Controller
{
    public function index()
    {
        $this->authorize('viewAny', Country::class);

        return Country::all();
    }

    public function store(CountryRequest $request)
    {
        $this->authorize('create', Country::class);

        return Country::create($request->validated());
    }

    public function show(Country $country)
    {
        $this->authorize('view', $country);

        return $country;
    }

    public function update(CountryRequest $request, Country $country)
    {
        $this->authorize('update', $country);

        $country->update($request->validated());

        return $country;
    }

    public function destroy(Country $country)
    {
        $this->authorize('delete', $country);

        $country->delete();

        return response()->json();
    }
}
