<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Utils\DatabaseUtils;
use Exception;
use Illuminate\Http\Request;
use Log;

class AdminExportDatabaseController extends Controller
{
    // Method to load the view
    public function index()
    {
        if (auth()->user()->type >= 4) {
            abort(403, 'Unauthorized action.');
        }

        return view('admin.admin_export_database.index');
    }

    // Method to handle the AJAX request for exporting the database
    public function admin_export_database(Request $request)
    {
        if (auth()->user()->type >= 4) {
            abort(403, 'Unauthorized action.');
        }

        // echo 'Hello';  // OK
        // dd($request);  // OK

        $dbName = $request->input('database_name');
        $dbUtils = new DatabaseUtils;

        try {
            $message = $dbUtils->admin_export_database($dbName);

            return back()->with('success', $message);
        } catch (Exception $e) {
            Log::error('Database export failed: '.$e->getMessage());

            return back()->with('error', 'An error occurred: '.$e->getMessage());
        }
    }

    public function saveDatabaseToLocalFile(Request $request)
    {
        if (auth()->user()->type >= 4) {
            abort(403, 'Unauthorized action.');
        }

        $dbName = $request->input('database_name');
        $dbUtils = new DatabaseUtils;

        try {
            $message = $dbUtils->saveDatabaseToLocalFile($dbName);

            return back()->with('success', $message);
        } catch (Exception $e) {
            return back()->with('error', 'An error occurred: '.$e->getMessage());
        }
    }

    public function remove_create_table_code_leave_only_insert_into(string $file_name)
    {
        $dbUtils = new DatabaseUtils;
        $insert_only_code = $dbUtils->processExportFileDataOnly($file_name);
    }

    public function create() {}

    public function store(Request $request) {}

    public function show($id) {}

    public function edit($id) {}

    public function update(Request $request, $id) {}

    public function destroy($id) {}
}
