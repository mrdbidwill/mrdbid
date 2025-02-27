<?php

namespace App\Http\Controllers;

class DashboardController extends Controller
{
    /**
     * Display the user's dashboard.
     *
     * @return \Illuminate\View\View
     */
    public function index()
    {
        // You can pass data to the dashboard view if needed
        return view('dashboardDELETE');
    }
}
