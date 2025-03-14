<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;

class AdminDashboardController extends Controller
{
    public function index()
    {
        if (auth()->user()->type >= 4) {
            abort(403, 'Unauthorized action.');
        }

        return view('admin.dashboard');
    }
}
