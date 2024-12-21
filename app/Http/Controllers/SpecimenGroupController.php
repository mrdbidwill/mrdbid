<?php

namespace App\Http\Controllers;

use App\Models\SpecimenGroup;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Http\Request;

class SpecimenGroupController extends Controller
{
    use AuthorizesRequests;

    public function index()
    {
        $groups = SpecimenGroup::latest()->simplePaginate(36);

        return view('specimen_groups.index', [
            'specimen_groups' => $groups,
        ]);
    }

    public function show(int $group_id)
    {
        $specimen_group = SpecimenGroup::findOrFail($group_id);

        return view('specimen_groups.show', ['specimen_group' => $specimen_group]);
    }

    public function store(Request $request)
    {
        // dd($request);
        request()->validate([
            'name' => ['required', 'min:3'],
        ]);

        $member_id = $entered_by = auth()->user()->id;
        // dd($member_id);   // ok here - 2

        SpecimenGroup::create([
            'member_id' => $member_id,
            'name' => request('name'),
            'description' => request('description'),
            'comments' => request('comments'),
            'entered_by' => $entered_by,
        ]);

        return redirect('/specimen_groups/')->with('message', 'Specimen Group created successfully');
    }

    public function create()
    {
        return view('specimen_groups.create');
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

        return redirect('/specimen_groups')->with('message', 'Specimen Group updated successfully');
    }

    public function destroy(int $id)
    {
        $group = SpecimenGroup::findOrFail($id);
        $this->authorize('delete', $group);
        $group_id = $group->id;
        $group->delete();

        return redirect()->route('specimen_groups.index')->with('success', 'Group deleted successfully.');
    }
}
