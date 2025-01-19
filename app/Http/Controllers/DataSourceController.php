<?php

namespace App\Http\Controllers;

use App\Models\DataSource;
use App\Models\DataSourceDataTypes;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DataSourceController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth')->except('showFilteredBooks'); // Exclude showFilteredBooks from auth
    }

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
        $dataTypes = DataSourceDataTypes::all();

        if ($dataTypes->isEmpty()) {
            // Pass an error message to the view instead of redirecting.
            return view('data_sources.create', [
                'dataTypes' => $dataTypes,
                'error' => 'No types found. Please create data types before proceeding.',
            ]);
        }

        return view('data_sources.create', ['dataTypes' => $dataTypes]);
    }

    public function show($id)
    {
        $data_source = DataSource::findOrFail($id);

        $selected_data_type = DataSourceDataTypes::where('id', $data_source->type)->first();

        return view('data_sources.show', compact('data_source', 'selected_data_type'));
    }

    public function edit($id)
    {
        $data_source = DataSource::findOrFail($id);
        $memberType = Auth::user()->type;

        $dataTypes = DataSourceDataTypes::all();

        if ($dataTypes->isEmpty()) {
            // Pass an error message to the view instead of redirecting.
            return view('data_sources.create', [
                'dataTypes' => $dataTypes,
                'error' => 'No types found. Please create data types before proceeding.',
            ]);
        }

        $selected_data_type = $data_source->type;

        return view('data_sources.edit', compact('data_source', 'dataTypes', 'memberType', 'selected_data_type'));
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
