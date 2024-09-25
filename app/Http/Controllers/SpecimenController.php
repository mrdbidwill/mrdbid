<?php

namespace App\Http\Controllers;

use App\Models\Lookup\Country;
use App\Models\Lookup\State;
use App\Models\Specimen;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;

class SpecimenController extends Controller
{
    public function dashboard(Request $request)
    {
        $user = $request->user();
        $specimens = Specimen::where('user_id', $user->id)->get();
        //dd($specimens);

        return view('specimens.dashboard', compact('specimens'));
        //return view('specimens.dashboard');
    }

    public function index()
    {
        $specimens = Specimen::where('user_id', auth()->id())->orderBy('id', 'asc')->get();
        //dd($specimens);

        return view('specimens.index', ['specimens' => $specimens]);
    }

    public function show($id)
    {
        //return view('specimens.show', ['specimen' => $specimen->user_id = auth()->id()]);
        // get specimens for this user
        $specimens = Specimen::where('id', $id)->get();
        //dd($specimen);

        return view('specimens.show', compact('specimens'));
    }

    public function store(Request $request)
    {
        request()->validate([
            'specimen_name' => 'required|string|min:3|max:255|unique:specimens,specimen_name,NULL,id,user_id,'.auth()->user()->id,
            'common_name' => 'required|string|min:3|max:255',
            'specimen_location_now' => 'required|integer',
            'location_found_city' => 'required|string|min:3|max:255',
            'location_found_county' => 'required|string|min:3|max:255',
            'state' => 'required|integer',
            'country' => 'required|integer',
            'location_public_y_n' => 'required',
            'share_data_y_n' => 'required',
            'month_found' => 'required|integer|min:1|max:12',
            'day_found' => 'required|integer|min:1|max:31',
            'year_found' => 'required|integer|min:1954|max:2025',
            'fungus_type' => 'required|integer',
            'entered_by' => 'required|integer',
        ]);

        // dd(request()->all());
        // dd(auth()->user()->id);
        Specimen::create([
            'user_id' => auth()->user()->id,
            'specimen_name' => request('specimen_name'),
            'common_name' => request('common_name'),
            'description' => request('description'),
            'comment' => request('comment'),
            'specimen_location_now' => request('specimen_location_now'),
            'location_found_city' => request('location_found_city'),
            'location_found_county' => request('location_found_county'),
            'state' => request('state'),
            'country' => request('country'),
            'location_public_y_n' => request('location_public_y_n'),
            'share_data_y_n' => request('share_data_y_n'),
            'month_found' => request('month_found'),
            'day_found' => request('day_found'),
            'year_found' => request('year_found'),
            'fungus_type' => request('fungus_type'),
            'entered_by' => request('entered_by')]);

        // Mail::to($specimen['user'])->queue(new SpecimenCreated($specimen));

        return redirect('/specimens/');
        //return view('specimens.show', ['specimen' => $specimen]);
    }

    public function create()
    {
        $countries = Country::all();

        return view('specimens.create', compact('countries'));
    }

    public function edit(Specimen $specimen)
    {
        $countries = Country::all();

        //dd($specimen);

        return view('specimens.edit', [compact('countries'), 'specimen' => $specimen]);

    }

    public function update(Specimen $specimen)
    {
        Gate::authorize('edit-specimen', $specimen);

        request()->validate([
            // Exclude the current specimen's ID from the unique check
            // Allow same specimen_name if it is NOT being changed
            'specimen_name' => 'required|string|min:3|max:255|unique:specimens,specimen_name,'.$specimen->id.',id,user_id,'.auth()->id(),
            'common_name' => 'required|string|min:3|max:255',
            'specimen_location_now' => 'required|integer',
            'location_found_city' => 'required|string|min:3|max:255',
            'location_found_county' => 'required|string|min:3|max:255',
            'state' => 'required|integer',
            'country' => 'required|integer',
            'location_public_y_n' => 'required',
            'share_data_y_n' => 'required',
            'month_found' => 'required|integer|min:1|max:12',
            'day_found' => 'required|integer|min:1|max:31',
            'year_found' => 'required|integer|min:1954|max:2025',
            'fungus_type' => 'required|integer',
            'entered_by' => 'required|integer',
        ]);

        $specimen->update([
            'specimen_name' => request('specimen_name'),
            'common_name' => request('common_name'),
            'description' => request('description'),
            'comment' => request('comment'),
            'specimen_location_now' => request('specimen_location_now'),
            'location_found_city' => request('location_found_city'),
            'location_found_county' => request('location_found_county'),
            'state' => request('state'),
            'country' => request('country'),
            'location_public_y_n' => request('location_public_y_n'),
            'share_data_y_n' => request('share_data_y_n'),
            'month_found' => request('month_found'),
            'day_found' => request('day_found'),
            'year_found' => request('year_found'),
            'fungus_type' => request('fungus_type'),
            'entered_by' => request('entered_by'),

        ]);

        return redirect('/specimens/'.$specimen['id'].'/edit')->with('message', 'Specimen updated successfully');
    }

    public function destroy(Specimen $specimen)
    {
        Gate::authorize('edit-specimen', $specimen);

        $specimen->delete();

        // specimens.dashboard is the intended route after delete a specimen
        return redirect()->intended(route('specimens.dashboard', absolute: false));
    }

    public function getStates(Request $request)
    {
        $countryId = $request->get('country_id');

        $states = State::where('country_id', $countryId)->get();

        return response()->json($states);
    }
}
