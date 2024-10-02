<?php

namespace App\Http\Controllers;

use App\Models\DataSource;
use Illuminate\Http\Request;

class DataSourceController extends Controller
{
    public function index()
    {
        $data_sources = DataSource::all();

        //dd($data_sources);
        return view('data_sources.index', compact('data_sources'));
    }

    public function store(Request $request)
    {
        DataSource::create($request->all());

        return redirect()->route('data_source.index');
    }

    public function create()
    {
        return view('data_sources.create');
    }

    public function show($id)
    {
        $data_source = DataSource::findOrFail($id);

        return view('data_sources.show', compact('data_source'));
    }

    public function edit($id)
    {
        $data_source = DataSource::findOrFail($id);

        return view('data_sources.edit', compact('data_source'));
    }

    public function update(Request $request, $id)
    {
        $data_sources = DataSource::findOrFail($id);
        $data_sources->update($request->all());

        return redirect()->route('data_source.index');
    }

    public function destroy($id)
    {
        $data_sources = DataSource::findOrFail($id);
        $data_sources->delete();

        return redirect()->route('data_source.index');
    }
}
