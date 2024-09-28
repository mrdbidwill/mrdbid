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

    public function store(Request $request)
    {
        request()->validate([
            'name' => ['required', 'min:3'],
        ]);

        $member_id = $entered_by = request('entered_by');  // member_id should be same as entered_by right here
        SpecimenGroup::create([
            'member_id' => $member_id,
            'name' => request('name'),
            'description' => request('description'),
            'comments' => request('comments'),
            'entered_by' => $entered_by,
        ]);

        return redirect('/specimen_group/')->with('message', 'Specimen Group created successfully');
    }

    public function create()
    {
        return view('specimen_clusters.create');
    }

    public function edit(SpecimenGroup $specimenGroup)
    {
        return view('specimen_groups.edit', ['specimenGroup' => $specimenGroup]);

    }

    public function update(SpecimenGroup $specimen_group)
    {

        request()->validate([
            'name' => ['required', 'min:3'],
        ]);

        $member_id = $entered_by = $specimen_group['entered_by'];  // member_id should be same as entered_by right here

        $specimen_group->update([
            'member_id' => $member_id,
            'name' => request('name'),
            'description' => request('description'),
            'comments' => request('comments'),
            'entered_by' => $entered_by,

        ]);

        return redirect('/specimen_group/')->with('message', 'Specimen Group updated successfully');
    }

    public function destroy(SpecimenGroup $group)
    {
        // authorize (On hold...)

        $group->delete();

        return redirect('/specimen_groups');
    }
}
