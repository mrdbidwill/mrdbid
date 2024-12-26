<?php

namespace App\Http\Controllers;

use App\Models\Group;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;

class GroupController extends Controller
{
    use AuthorizesRequests;

    public function index()
    {
        // $groups = Group::latest()->simplePaginate(36);
        $groups = Group::where('created_by', auth()->id())->orderBY('name', 'asc')->simplePaginate(36);

        return view('groups.index', [
            'groups' => $groups,
        ]);
    }

    public function show(int $group_id)
    {
        $group = Group::findOrFail($group_id);

        return view('groups.show', ['group' => $group]);
    }

    public function store(Request $request)
    {
        // dd($request);
        request()->validate([
            'name' => ['required', 'min:3'],
        ]);

        Group::create([
            'name' => request('name'),
            'description' => request('description'),
            'created_by' => auth()->id(), // Use authenticated user's id
        ]);

        return redirect('/groups/')->with('message', 'Group created successfully');
    }

    public function create()
    {
        return view('groups.create');
    }

    public function edit($id)
    {
        $group = Group::findOrFail($id);
        //dd($group);
        Gate::authorize('edit-group', $group);

        return view('groups.edit', compact('group'));

    }

    public function update(Group $group)
    {

        request()->validate([
            'name' => ['required', 'min:3'],
        ]);

        $created_by = $group['created_by'];
        $group->update([
            'name' => request('name'),
            'description' => request('description'),
            'created_by' => $created_by,

        ]);

        return redirect('/groups')->with('message', 'Group updated successfully');
    }

    public function destroy(int $id)
    {
        $group = Group::findOrFail($id);
        $this->authorize('delete', $group);
        $group_id = $group->id;
        $group->delete();

        return redirect()->route('groups.index')->with('success', 'Group deleted successfully.');
    }
}
