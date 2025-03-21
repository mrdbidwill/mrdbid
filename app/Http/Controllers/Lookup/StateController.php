<?php

namespace App\Http\Controllers\Lookup;

use App\Http\Controllers\Controller;
use App\Models\Lookup\State;
use Illuminate\Http\Request;
use Illuminate\View\View;

class StateController extends Controller
{
    public function index(): View
    {
        return view('specimens.look_up_tables.state');
    }

    public function create() {}

    public function store(Request $request) {}

    public function show($id) {}

    public function edit($id) {}

    public function update(Request $request, $id) {}

    public function destroy($id) {}

    public function getStates($countryId)
    {
        $states = State::where('country_id', $countryId)->pluck('name', 'id');

        return response()->json($states);
    }
}
