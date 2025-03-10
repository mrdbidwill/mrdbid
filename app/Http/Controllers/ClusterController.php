<?php

namespace App\Http\Controllers;

use App\Models\Cluster;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;

class ClusterController extends Controller
{
    public function __construct() {}

    public function index()
    {
        // return cluster created by - owned by - this authorized user
        $clusters = Cluster::where('created_by', auth()->id())->orderBy('name', 'asc')->simplePaginate(6);

        return view('clusters.index', compact('clusters'));
    }

    public function show($id)
    {
        // Enforce ownership check
        $cluster = Cluster::where('id', $id)
            ->where('created_by', auth()->id())
            ->firstOrFail();

        // Return the proper view with the cluster
        return view('clusters.show', ['cluster' => $cluster]);
    }

    public function store(Request $request)
    {
        request()->validate([
            'name' => ['required', 'min:3'],
        ]);

        Cluster::create([
            'name' => request('name'),
            'description' => request('description'),
            'created_by' => auth()->id(), // Use authenticated user's id
        ]);

        // return redirect('/specimen_cluster/');
        return redirect('/clusters/')->with('message', 'Specimen Cluster created successfully');
    }

    public function create()
    {
        return view('clusters.create');
    }

    public function edit($id)
    {
        $cluster = Cluster::findOrFail($id);
        // dd($specimen_cluster);
        Gate::authorize('edit-cluster', $cluster);

        return view('clusters.edit', compact('cluster'));

    }

    public function update(Cluster $cluster)
    {

        request()->validate([
            'name' => ['required', 'min:3'],
        ]);

        $created_by = $cluster['created_by'];

        $cluster->update([
            'name' => request('name'),
            'description' => request('description'),
        ]);

        // return redirect('/clusters/'.$cluster['id'].'/edit')->with('message', 'Cluster updated successfully');
        return redirect('/clusters/')->with('message', 'Cluster updated successfully');
    }

    public function destroy(Cluster $cluster)
    {
        Gate::authorize('delete-cluster', $cluster);   // same ownership check as needed here

        $cluster->delete();

        return redirect()->intended(route('clusters.index', absolute: false));
    }
}
