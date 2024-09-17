<?php

namespace App\Http\Controllers;

use App\Models\SpecimenGroup;
use Illuminate\Http\Request;

class SpecimenGroupController extends Controller
{
    public function index()
    {
        $groups = SpecimenGroup::latest()->simplePaginate(12);

        return view('specimen_groups.index', [
            'specimen_groups' => $groups,
        ]);
    }

    public function show(SpecimenGroup $group)
    {
        return view('specimen_groups.show', ['group' => $group]);
    }

    public function store()
    {
        request()->validate([
            'name' => ['required', 'min:3'],
            'display_options' => ['required'],
            'look_up_y_n' => ['required'],
            'part' => ['required'],
            'source' => ['required'],
            'entered_by' => ['required'],
        ]);

        SpecimenGroup::create([
            'name' => request('name'),
            'display_options' => request('display_options'),
            'look_up_y_n' => request('look_up_y_n'),
            'part' => request('part'),
            'source' => request('group_location_now'),
            'entered_by' => request('entered_by'),

        ]);

        return redirect('/specimen_groups');
    }

    public function create()
    {
        return view('specimen_clusters.create');
    }

    public function edit(SpecimenGroup $specimenGroup)
    {
        return view('specimen_groups.edit', ['specimenGroup' => $specimenGroup]);

    }

    public function update(Request $request)
    {
        // authorize (On hold...)

        request()->validate([
            'name' => ['required', 'min:3'],
            'display_options' => ['required'],
            'look_up_y_n' => 'required',
            'part' => 'required',
            'source' => 'required',
            'entered_by' => 'required',
        ]);

        update([
            'name' => request('name'),
            'display_options' => request('display_options'),
            'look_up_y_n' => request('look_up_y_n'),
            'part' => request('part'),
            'source' => request('source'),
            'entered_by' => request('entered_by'),

        ]);

        return redirect('/specimen_groups/'.$group->id);
    }

    public function destroy(SpecimenGroup $group)
    {
        // authorize (On hold...)

        $group->delete();

        return redirect('/specimen_groups');
    }
}
