<?php

namespace App\Http\Controllers;

use App\Models\Specimen;
use Illuminate\Support\Facades\Auth;
use PDF; // Import the facade

class PdfController extends Controller
{
    // Generate PDF for user-specific specimens
    public function userSpecimens()
    {
        $user = Auth::user();
        $specimens = $user->specimens()->with('characterSpecimens')->get();

        // Generate PDF
        $pdf = PDF::loadView('pdf.user_specimens', compact('specimens'));

        // Return the generated PDF and download
        return $pdf->download('user_specimens.pdf');
    }

    // Generate PDF for all specimens
    public function allSpecimens()
    {
        $specimens = Specimen::with('characterSpecimens')->get();

        // Generate PDF
        $pdf = PDF::loadView('pdf.all_specimens', compact('specimens'));

        // Return the generated PDF and download
        return $pdf->download('all_specimens.pdf');
    }
}
