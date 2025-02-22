<?php

namespace App\Http\Controllers;

use App\Models\Specimen;
use Illuminate\Http\Request;

class CompareController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    // Display comparison form
    public function index()
    {
        return view('compares.index');
    }

    // Perform the comparison and return results
    public function compare(Request $request)
    {
        // Get specimen IDs from the request
        $specimenIds = $request->input('specimen_ids');

        // Load specimens and their related mr_characters
        $specimens = Specimen::with('characterSpecimens')
            ->whereIn('id', $specimenIds)
            ->get();

        // Here, you can add your comparison logic

        $comparisonResult = [];

        return view('compares.result', compact('specimens', 'comparisonResult'));
    }
}
