<?php

namespace App\Http\Controllers;

use App\Models\group;

class groupController extends Controller
{
    public function index()
    {
        $groups = group::latest()->simplePaginate(3);

        return view('groups.index', [
            'groups' => $groups,
        ]);
    }

    public function show(group $group)
    {
        return view('groups.show', ['group' => $group]);
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

        group::create([
            'name' => request('name'),
            'display_options' => request('display_options'),
            'look_up_y_n' => request('look_up_y_n'),
            'part' => request('part'),
            'source' => request('group_location_now'),
            'entered_by' => request('entered_by'),

        ]);

        return redirect('/groups');
    }

    public function create()
    {
        return view('groups.create');
    }

    public function edit(group $group)
    {
        return view('groups.edit', ['group' => $group]);

    }

    public function update(group $group)
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

        $group->update([
            'name' => request('name'),
            'display_options' => request('display_options'),
            'look_up_y_n' => request('look_up_y_n'),
            'part' => request('part'),
            'source' => request('source'),
            'entered_by' => request('entered_by'),

        ]);

        return redirect('/groups/'.$group->id);
    }

    public function destroy(group $group)
    {
        // authorize (On hold...)

        $group->delete();

        return redirect('/groups');
    }
}
