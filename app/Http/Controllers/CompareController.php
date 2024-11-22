<?php

namespace App\Http\Controllers;

use App\Models\Specimen;
use Illuminate\Http\Request;

class CompareController extends Controller
{
    // Display comparison form/dashboard
    public function index()
    {
        return view('compare.index');
    }

    // Perform the comparison and return results
    public function compare(Request $request)
    {
        // Get specimen IDs from the request
        $specimenIds = $request->input('specimen_ids');

        // Load specimens and their related characters
        $specimens = Specimen::with('characterSpecimens')
            ->whereIn('id', $specimenIds)
            ->get();

        // Here, you can add your comparison logic

        return view('compare.result', compact('specimens', 'comparisonResult'));
    }
}
