<?php

namespace App\Http\Controllers;

use App\Models\Cluster;
use App\Models\ClusterSpecimen;
use App\Models\Group;
use App\Models\GroupSpecimen;
use App\Models\Lookup\Country;
use App\Models\Lookup\State;
use App\Models\Specimen;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;

class SpecimenController extends Controller
{
    public function index()
    {
        // Fetch specimens for the authenticated user and paginate to display 25 per page
        $userId = Auth::id();

        $specimens = Specimen::withCount(['images_specimens', 'groups as groups_count', 'clusters as clusters_count'])
            ->where('user_id', $userId)
            ->orderBy('year_found')
            ->orderBy('month_found')
            ->orderBy('day_found')
            ->paginate(25);

        // Return the view with the paginated specimens
        return view('specimens.index', compact('specimens'));
    }

    public function show($id)
    {
        //dd($id);
        // Fetch the specimen by ID and load relationships for groups and clusters
        $specimen = Specimen::with(['groups', 'clusters'])->findOrFail($id);

        //$specimen = Specimen::findOrFail($id);  // Fetch the specimen by ID
        // Fetch the countries and states as collections of objects
        $countries = Country::all(); // instead of pluck
        $states = State::all(); // same adjustment for states if required

        // Fetch the groups (modify query based on your requirements)
        $all_groups = Group::all(); // Use any filtering logic if needed

        // Fetch the clusters (modify query based on your requirements)
        $all_clusters = Cluster::all(); // Use any filtering logic if needed

        $this_groups = GroupSpecimen::where('specimen_id', $id)->get();
        //dd($this_groups);    // ok group_id and specimen_id are set
        $this_clusters = ClusterSpecimen::where('specimen_id', $id)->get();
        //dd($this_clusters);    // ok cluster_id and specimen_id are set
        //dd($all_groups, $all_clusters);

        return view('specimens.show', compact('specimen', 'countries', 'states', 'all_groups', 'all_clusters', 'this_groups', 'this_clusters'));
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
        $countries = Country::all(); // Fetch all countries

        return view('specimens.create', compact('countries'));
    }

    public function edit(Specimen $specimen)
    {
        $countries = Country::all();

        //dd($specimen);

        return view('specimens.edit', [compact('countries'), 'specimen' => $specimen]);

    }

    public function destroy(Specimen $specimen)
    {
        Gate::authorize('edit-specimen', $specimen);  // edit-specimen does same as if create delete-specimen

        $specimen->delete();

        // specimens.dashboard is the intended route after delete a specimen
        return redirect()->intended(route('specimens.index', absolute: false));
    }

    public function getStates(Request $request)
    {
        $countryId = $request->input('country');
        $states = State::where('country_id', $countryId)->pluck('name', 'id');

        return response()->json($states);
    }

    public function updateField(Request $request, $id, $field)
    {
        //dd($field);
        $specimen = Specimen::findOrFail($id);
        // dd($specimen);
        $specimen->$field = $request->input($field);
        $specimen->save();

        return redirect()->back()->with('success', 'Field updated successfully!');
    }

    public function dateFoundHandler(Request $request, $id)
    {
        $month = $request->input('month_found');
        $day = $request->input('day_found');
        $year = $request->input('year_found');

        // Update the existing record
        DB::table('specimens')
            ->where('id', $id)
            ->update([
                'month_found' => $month,
                'day_found' => $day,
                'year_found' => $year,
            ]);

        // Redirect or return response
        return redirect()->back()->with('success', 'Field updated successfully!');
    }

    public function update(Specimen $specimen)
    {
        Gate::authorize('edit-specimen', $specimen);  // does same as if created update-specimen

        $month = request('month_found');
        $day = request('day_found');
        $year = request('year_found');

        $is_valid_date = \App\Utils\DateUtils::isValidDate((int) $month, (int) $day, (int) $year);

        if (! $is_valid_date) {
            return redirect()->back()->withErrors(['date' => 'Invalid date.']);
        }

        request()->validate([
            // Exclude the current specimen's ID from the unique check
            // Allow same specimen_name if it is NOT being changed
            'specimen_name' => 'sometimes|string|min:3|max:255|unique:specimens,specimen_name,'.$specimen->id.',id,user_id,'.auth()->id(),
            'common_name' => 'sometimes|string|min:3|max:255',
            'specimen_location_now' => 'sometimes|integer',
            'location_found_city' => 'sometimes|string|min:3|max:255',
            'location_found_county' => 'sometimes|string|min:3|max:255',
            'state' => 'sometimes|integer',
            'country' => 'sometimes|integer',
            'location_public_y_n' => 'sometimes',
            'share_data_y_n' => 'sometimes',
            'month_found' => 'sometimes|integer|min:1|max:12',
            'day_found' => 'sometimes|integer|min:1|max:31',
            'year_found' => 'sometimes|integer|min:1954|max:2025',
            'fungus_type' => 'sometimes|integer',
            'entered_by' => 'sometimes|integer',
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

    public function addToGroup(Request $request, Specimen $specimen)
    {
        //dd($request);
        // Validate the incoming request
        $validated = $request->validate([
            'group_id' => 'required|exists:groups,id',
        ]);

        // Add the specimen to the specified group (prevent duplicate entries)
        $specimen->groups()->syncWithoutDetaching([$validated['group_id']]);

        // Return success response
        return redirect()->route('specimens.show', $specimen->id)
            ->with('success', 'Specimen successfully added to the group!');
    }

    public function addToCluster(Request $request, Specimen $specimen)
    {
        // Validate the incoming request
        $validated = $request->validate([
            'cluster_id' => 'required|exists:clusters,id',
        ]);

        // Add the specimen to the specified cluster (prevent duplicate entries)
        $specimen->clusters()->syncWithoutDetaching([$validated['cluster_id']]);

        // Return success response
        return redirect()->route('specimens.show', $specimen->id)
            ->with('success', 'Specimen successfully added to the cluster!');
    }
}
