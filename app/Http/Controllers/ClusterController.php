<?php

namespace App\Http\Controllers;

use App\Models\Cluster;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;

class ClusterController extends Controller
{
    public function index()
    {
        $clusters = Cluster::where('created_by', auth()->id())->orderBY('name', 'asc')->simplePaginate(6);

        return view('clusters.index', compact('clusters'));
    }

    public function show($id)
    {
        $clusters = Cluster::where('id', $id)->get();

        return view('clusters.show', compact('clusters'));
    }

    public function store(Request $request)
    {
        request()->validate([
            'name' => ['required', 'min:3'],
        ]);

        Cluster::create([
            'name' => request('name'),
            'description' => request('description'),
            'comments' => request('comments'),
            'created_by' => auth()->id(), // Use authenticated user's id
        ]);

        //return redirect('/specimen_cluster/');
        return redirect('/clusters/')->with('message', 'Specimen Cluster created successfully');
    }

    public function create()
    {
        return view('clusters.create');
    }

    public function edit($id)
    {
        $cluster = Cluster::findOrFail($id);
        //dd($specimen_cluster);
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
            'created_by' => $created_by,

        ]);

        //return redirect('/clusters/'.$cluster['id'].'/edit')->with('message', 'Cluster updated successfully');
        return redirect('/clusters/')->with('message', 'Cluster updated successfully');
    }

    public function destroy(Cluster $cluster)
    {
        Gate::authorize('edit-cluster', $cluster);   // same ownership check as needed here

        $cluster->delete();

        return redirect()->intended(route('clusters.index', absolute: false));
    }
}
