<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Utils\DatabaseUtils;
use Illuminate\Http\Request;

class AdminExportDatabaseController extends Controller
{
    // Method to load the view
    public function index()
    {
        return view('admin.admin_export_database.index');
    }

    // Method to handle the AJAX request for exporting the database
    public function exportDatabase(Request $request)
    {
        $dbName = $request->input('database_name');
        $dbUtils = new DatabaseUtils;

        try {
            $message = $dbUtils->exportDatabase($dbName);

            return back()->with('success', $message);
        } catch (\Exception $e) {
            return back()->with('error', 'An error occurred: '.$e->getMessage());
        }
    }

    public function saveDatabaseToLocalFile(Request $request)
    {
        $dbName = $request->input('database_name');
        $dbUtils = new DatabaseUtils;

        try {
            $message = $dbUtils->saveDatabaseToLocalFile($dbName);

            return back()->with('success', $message);
        } catch (\Exception $e) {
            return back()->with('error', 'An error occurred: '.$e->getMessage());
        }
    }
}
