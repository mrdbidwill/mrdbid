<?php

namespace App\Http\Controllers;

use App\Models\SpecimenCluster;

class SpecimenClusterController extends Controller
{
    public function index()
    {
        $clusters = SpecimenCluster::latest()->simplePaginate(3);

        return view('clusters.index', [
            'clusters' => $clusters,
        ]);
    }

    public function show(SpecimenCluster $Cluster)
    {
        return view('clusters.show', ['SpecimenCluster' => $Cluster]);
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

        SpecimenCluster::create([
            'name' => request('name'),
            'display_options' => request('display_options'),
            'look_up_y_n' => request('look_up_y_n'),
            'part' => request('part'),
            'source' => request('Cluster_location_now'),
            'entered_by' => request('entered_by'),

        ]);

        return redirect('/clusters');
    }

    public function create()
    {
        return view('clusters.create');
    }

    public function edit(SpecimenCluster $Cluster)
    {
        return view('clusters.edit', ['SpecimenCluster' => $Cluster]);

    }

    public function update(SpecimenCluster $cluster)
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

        $cluster->update([
            'name' => request('name'),
            'display_options' => request('display_options'),
            'look_up_y_n' => request('look_up_y_n'),
            'part' => request('part'),
            'source' => request('source'),
            'entered_by' => request('entered_by'),

        ]);

        return redirect('/clusters/'.$cluster->id);
    }

    public function destroy(SpecimenCluster $cluster)
    {
        // authorize (On hold...)

        $cluster->delete();

        return redirect('/clusters');
    }
}
