<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\DataSource;
use Illuminate\Http\Request;

class AdminDataSourceController extends Controller
{
    public function index()
    {
        if (auth()->user()->type >= 4) {
            abort(403, 'Unauthorized action.');
        }

        $data_source_tables = DataSource::get();

        return view('admin.admin_data_source.index', [
            'data_source_tables' => $data_source_tables,
        ]);
    }

    public function store(Request $request)
    {

        if (auth()->user()->type >= 4) {
            abort(403, 'Unauthorized action.');
        }

        // dd($request->all());

        request()->validate([
            'name' => 'required|unique:data_sources,name|min:3',
            'display_options' => 'required',
            'look_up_y_n' => 'required',
            'parts' => 'required',
            'source' => 'required',
            'entered_by' => 'required',
        ]);
        $data_source = DataSource::create([
            'name' => request('name'),
            'display_options' => request('display_options'),
            'look_up_y_n' => request('look_up_y_n'),
            'parts' => request('parts'),
            'source' => request('source'),
            'entered_by' => auth()->user()->id,
        ]);

        $data_source_tables = DataSource::get();
        // return 'Got her done!';

        // dd($data_source_table);

        return view('admin.admin_data_source.index', [
            'data_source_tables' => $data_source_tables,
        ]);
    }

    public function create()
    {
        if (auth()->user()->type >= 4) {
            abort(403, 'Unauthorized action.');
        }

        return view('admin.admin_data_source.create');
    }

    public function show($id) {}

    public function edit($id)
    {
        if (auth()->user()->type >= 4) {
            abort(403, 'Unauthorized action.');
        }

        $data_source_id = $id;
        // dd($specimen_id);

        $data_source_table = DataSource::where('id', '=', $data_source_id)->get();
        // dd($data_source_table);

        return view('admin.admin_data_source.edit', ['data_source_table' => $data_source_table]);
    }

    public function update(Request $request)
    {
        if (auth()->user()->type >= 4) {
            abort(403, 'Unauthorized action.');
        }

        // Gate::authorize('edit-book', $data_source);
        // dd($request->all());
        $request->validate([
            'name' => 'required|min:3|unique:data_sources,name,'.$request->id,
            'display_options' => 'required',
            'look_up_y_n' => 'required',
            'parts' => 'required',
            'source' => 'required',
            'entered_by' => 'required',
        ]);

        $one_data_source = DataSource::where('id', '=', $request->id)->first();
        $one_data_source->update([
            'name' => $request->input('name'),
            'display_options' => $request->input('display_options'),
            'look_up_y_n' => $request->input('look_up_y_n'),
            'parts' => $request->input('parts'),
            'source' => $request->input('source'),
            'entered_by' => auth()->user()->id,
        ]);

        $data_source_tables = DataSource::get();
        // return 'Got her done!';

        // dd($data_source_table);

        return view('admin.admin_data_source.index', [
            'data_source_tables' => $data_source_tables,
        ]);
    }

    public function destroy($id)
    {
        if (auth()->user()->type >= 4) {
            abort(403, 'Unauthorized action.');
        }

    }
}
