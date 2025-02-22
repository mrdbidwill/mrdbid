<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LookupController extends Controller
{
    /**
     * Fetch records from a generic lookup table.
     *
     * @param  string $table
     * @return \Illuminate\Http\JsonResponse
     */
    public function fetch($table)
    {
        // Check if the table exists in the database
        if (!in_array($table, ['countries', 'states', 'categories', 'types', 'colors'])) {
            return response()->json(['error' => 'Invalid lookup table'], 404);
        }

        // Fetch all records from the lookup table
        $records = DB::table($table)->get();

        return response()->json($records);
    }

    /**
     * Fetch records from the countries lookup table (custom example).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function fetchCountries()
    {
        $countries = DB::table('countries')->orderBy('name')->get();

        return response()->json($countries);
    }

    /**
     * Fetch states by country ID (dependent lookup).
     *
     * @param  int $country_id
     * @return \Illuminate\Http\JsonResponse
     */
    public function fetchStatesByCountry($country_id)
    {
        $states = DB::table('states')->where('country_id', $country_id)->orderBy('name')->get();

        return response()->json($states);
    }
}
