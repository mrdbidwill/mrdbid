<?php

namespace App\Http\Controllers;

use App\Models\SpecimenCluster;

class SpecimenClusterController extends Controller
{
    public function index()
    {
        $specimen_clusters = SpecimenCluster::latest()->simplePaginate(6);

        return view('specimen_clusters.index', [
            'specimen_clusters' => $specimen_clusters,
        ]);
    }

    public function show(SpecimenCluster $specimen_cluster)
    {
        return view('specimen_clusters.show', ['specimen_cluster' => $specimen_cluster]);
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

        return redirect('/specimen_clusters');
    }

    public function create()
    {
        return view('specimen_clusters.create');
    }

    public function edit(SpecimenCluster $specimen_cluster)
    {
        return view('specimen_clusters.edit', ['SpecimenCluster' => $specimen_cluster]);

    }

    public function update(SpecimenCluster $specimen_cluster)
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

        $specimen_cluster->update([
            'name' => request('name'),
            'display_options' => request('display_options'),
            'look_up_y_n' => request('look_up_y_n'),
            'part' => request('part'),
            'source' => request('source'),
            'entered_by' => request('entered_by'),

        ]);

        return redirect('/specimen_clusters/'.$specimen_cluster->id);
    }

    public function destroy(SpecimenCluster $specimen_cluster)
    {
        // authorize (On hold...)

        $specimen_cluster->delete();

        return redirect('/specimen_clusters');
    }
}
