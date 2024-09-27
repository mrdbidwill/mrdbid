<?php

namespace App\Http\Controllers;

use App\Models\SpecimenCluster;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;

class SpecimenClusterController extends Controller
{
    public function index()
    {
        $specimen_clusters = SpecimenCluster::where('member_id', auth()->id())->orderBY('name', 'asc')->latest()->simplePaginate(6);

        return view('specimen_clusters.index', compact('specimen_clusters'));
    }

    public function show($id)
    {
        $specimen_clusters = SpecimenCluster::where('id', $id)->get();

        return view('specimen_clusters.show', compact('specimen_clusters'));
    }

    public function store(Request $request)
    {
        request()->validate([
            'name' => ['required', 'min:3'],
        ]);

        $member_id = $entered_by = request('entered_by');  // member_id should be same as entered_by right here
        SpecimenCluster::create([
            'member_id' => $member_id,
            'name' => request('name'),
            'description' => request('description'),
            'comments' => request('comments'),
            'entered_by' => $entered_by,
        ]);

        return redirect('/specimen_clusters/');
    }

    public function create()
    {
        return view('specimen_clusters.create');
    }

    public function edit($id)
    {
        $specimen_cluster = SpecimenCluster::findOrFail($id);

        return view('specimen_clusters.edit', compact('specimen_cluster'));

    }

    public function update(SpecimenCluster $specimen_cluster)
    {

        request()->validate([
            'name' => ['required', 'min:3'],
        ]);

        $member_id = $entered_by = $specimen_cluster['entered_by'];  // member_id should be same as entered_by right here

        $specimen_cluster->update([
            'member_id' => $member_id,
            'name' => request('name'),
            'description' => request('description'),
            'comments' => request('comments'),
            'entered_by' => $entered_by,

        ]);

         return redirect('/specimen_clusters/'.$specimen_cluster['id'].'/edit')->with('message', 'Specimen Cluster updated successfully');
        //return redirect('/specimen_cluster.index');
    }

    public function destroy(SpecimenCluster $specimen_cluster)
    {
        Gate::authorize('edit-specimen', $specimen_cluster);

        $specimen_cluster->delete();

        return redirect()->intended(route('specimen_clusters', absolute: false));
    }
}
