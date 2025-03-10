<?php

namespace App\Http\Controllers;

use App\Models\AllGroup;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;

class AllGroupController extends Controller
{
    use AuthorizesRequests;

    public function __construct() {}

    public function index()
    {
        $all_groups = AllGroup::where('created_by', auth()->id())->orderBy('name', 'asc')->simplePaginate(36);

        \Log::info('Groups fetched for user ID '.auth()->id().': '.$all_groups);

        return view('all_groups.index', [
            'all_groups' => $all_groups,
        ]);
    }

    public function show(int $group_id)
    {
        $group = AllGroup::findOrFail($group_id);

        return view('all_groups.show', ['group' => $group]);
    }

    public function store(Request $request)
    {
        // dd($request);
        request()->validate([
            'name' => ['required', 'min:3'],
        ]);

        AllGroup::create([
            'name' => request('name'),
            'description' => request('description'),
            'created_by' => auth()->id(), // Use authenticated user's id
        ]);

        return redirect('/all_groups/')->with('message', 'Group created successfully');
    }

    public function create()
    {
        return view('all_groups.create');
    }

    public function edit($id)
    {
        $all_group = AllGroup::findOrFail($id);
        // dd($group);
        Gate::authorize('edit-group', $all_group);

        return view('all_groups.edit', compact('all_group'));

    }

    public function update(AllGroup $group)
    {

        request()->validate([
            'name' => ['required', 'min:3'],
        ]);

        $created_by = $group['created_by'];
        $group->update([
            'name' => request('name'),
            'description' => request('description'),

        ]);

        return redirect('/all_groups')->with('message', 'Group updated successfully');
    }

    public function destroy(int $id)
    {
        $group = AllGroup::findOrFail($id);
        $this->authorize('delete', $group);
        $group->delete();

        return redirect()->route('all_groups.index')->with('success', 'Group deleted successfully.');
    }
}
