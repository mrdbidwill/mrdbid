<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Imports\MBListImport;
use App\Services\ZipExtractor;
use Exception;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;

class AdminMBListController extends Controller
{
    public function index()
    {
        return view('admin.mblist.index');
    }

    public function showUploadForm()
    {
        return view('admin.mblist.upload');
    }

    public function handleUpload(Request $request, ZipExtractor $zipExtractor)
    {
        $request->validate([
            'zip_file' => 'required|file|mimes:zip',
        ]);

        $zipFile = $request->file('zip_file');
        $zipFilePath = $zipFile->storeAs('mblist', $zipFile->getClientOriginalName());

        $extractToPath = storage_path('app/mblist/extracted');

        try {
            $zipExtractor->extract(storage_path('app/'.$zipFilePath), $extractToPath);

            // Assuming the extracted file is a CSV
            $csvFilePath = $extractToPath.'/your_csv_file.csv';
            Excel::import(new MBListImport, $csvFilePath);

            return back()->with('success', 'Data imported successfully');
        } catch (Exception $e) {
            return back()->withErrors('Error uploading or extracting file: '.$e->getMessage());
        }
    }
}
