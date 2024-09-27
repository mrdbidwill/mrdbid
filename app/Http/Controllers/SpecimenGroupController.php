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
            'description' => ['required'],
            'comments' => ['required'],
            'entered_by' => ['required'],
        ]);

        SpecimenGroup::create([
            'name' => request('name'),
            'description' => request('description'),
            'comments' => request('comments'),
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
            'description' => ['required'],
            'comments' => ['required'],
            'entered_by' => ['required'],
        ]);

        update([
            'name' => request('name'),
            'description' => request('description'),
            'comments' => request('comments'),
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
