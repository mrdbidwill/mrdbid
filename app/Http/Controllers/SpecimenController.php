<?php

namespace App\Http\Controllers;

use App\Models\Specimen;
use Illuminate\Support\Facades\Gate;

class SpecimenController extends Controller
{
    public function index()
    {
        $specimens = Specimen::where('user_id', auth()->id())->latest()->simplePaginate(6);

        return view('specimens.index', [
            'specimens' => $specimens,
        ]);
    }

    public function show(Specimen $specimen)
    {
        //return view('specimens.show', ['specimen' => $specimen->user_id = auth()->id()]);
        // get specimens for this user
        $specimen = Specimen::where('user_id', auth()->id())->get();
        //dd($specimen);

        return view('specimens.show', ['specimen' => $specimen]);
    }

    public function store()
    {
        request()->validate([
            'specimen_name' => ['required', 'min:3'],
            'common_name' => ['required'],
            'specimen_location_now' => ['required'],
            'location_found_city' => ['required', 'min:3'],
            'location_found_county' => ['required', 'min:3'],
            'state' => ['required'],
            'country' => ['required'],
            'location_public_y_n' => ['required'],
            'share_data_y_n' => ['required'],
            'month_found' => ['required'],
            'day_found' => ['required'],
            'year_found' => ['required'],
            'fungus_type' => ['required'],
            'entered_by' => ['required'],
        ]);

        $specimen = Specimen::create([
            'user_id' => auth()->id(),
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

        return redirect('/specimens');
        //return view('specimens.show', ['specimen' => $specimen]);
    }

    public function create()
    {
        return view('specimens.create');
    }

    public function edit(Specimen $specimen)
    {
        return view('specimens.edit', ['specimen' => $specimen]);

    }

    public function update(Specimen $specimen)
    {
        Gate::authorize('edit-specimen', $specimen);

        request()->validate([
            'specimen_name' => ['required', 'min:3'],
            'specimen_location_now' => 'required',
            'location_found_city' => 'required',
            'location_found_county' => 'required',
            'state' => 'required',
            'month_found' => 'required',
            'day_found' => 'required',
            'year_found' => 'required',
            'fungus_type' => 'required',
            'entered_by' => 'required',
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

        return redirect('/specimens/'.$specimen['id'].'/edit');
    }

    public function destroy(Specimen $specimen)
    {
        Gate::authorize('edit-specimen', $specimen);

        $specimen->delete();

        return redirect('/specimens');
    }
}
