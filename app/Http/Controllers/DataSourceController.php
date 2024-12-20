<?php

namespace App\Http\Controllers;

use App\Models\DataSource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DataSourceController extends Controller
{
    public function index()
    {
        $data_sources = DataSource::all();
        // Get the current user's member type
        $memberType = Auth::user()->type;

        //dd($data_sources);
        return view('data_sources.index', compact('data_sources', 'memberType'));
    }

    public function store(Request $request)
    {
        DataSource::create($request->all());

        return redirect()->route('data_sources.index');
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

        return redirect()->route('data_sources.index');
    }

    public function destroy($id)
    {
        $data_sources = DataSource::findOrFail($id);
        $data_sources->delete();

        return redirect()->route('data_sources.index');
    }

    public function showFilteredBooks()
    {
        // Fetch all data sources of types 2, 4, and 5
        $dataSources = DataSource::whereIn('type', [2, 4, 5])->get();

        // Pass the filtered data sources to the view
        return view('book', ['dataSources' => $dataSources]);
    }
}
