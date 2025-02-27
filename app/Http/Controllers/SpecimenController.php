<?php

namespace App\Http\Controllers;

use App\Models\AllGroup;
use App\Models\AllGroupSpecimen;
use App\Models\Cluster;
use App\Models\ClusterSpecimen;
use App\Models\Lookup\Country;
use App\Models\Lookup\State;
use App\Models\Specimen;
use App\Utils\DateUtils;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
use Illuminate\Validation\ValidationException;
use Log;

class SpecimenController extends Controller
{
    public function __construct() {}

    public function index()
    {
        // Fetch specimens for the authenticated user and paginate to display 25 per page
        $userId = Auth::id();

        $specimens = Specimen::withCount(['images_specimens', 'all_groups as all_groups_count', 'clusters as clusters_count'])
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
        // dd($id);
        // Fetch the specimen by ID and load relationships for all_groups and clusters
        $specimen = Specimen::with(['all_groups', 'clusters'])->findOrFail($id);

        // $specimen = Specimen::findOrFail($id);  // Fetch the specimen by ID
        // Fetch the countries and states as collections of objects
        $countries = Country::all(); // instead of pluck
        $states = State::all(); // same adjustment for states if required

        // Fetch the all_groups (modify query based on your requirements)
        $all_groups = AllGroup::all(); // Use any filtering logic if needed

        // Fetch the clusters (modify query based on your requirements)
        $all_clusters = Cluster::all(); // Use any filtering logic if needed

        // $this_groups = AllGroupSpecimen::where('specimen_id', $id)->get();
        // dd($this_groups);    // ok group_id and specimen_id are set
        $this_groups = AllGroupSpecimen::with('all_group') // Load the related group
            ->where('specimen_id', $id)
            ->get();

        $this_clusters = ClusterSpecimen::with('cluster') // Load the related cluster
            ->where('specimen_id', $id)
            ->get();
        // $this_clusters = ClusterSpecimen::where('specimen_id', $id)->get();
        // dd($this_clusters);    // ok cluster_id and specimen_id are set
        // dd($all_groups, $all_clusters);

        return view('specimens.show', compact('specimen', 'countries', 'states', 'all_groups', 'all_clusters', 'this_groups', 'this_clusters'));
    }

    public function store(Request $request)
    {
        // dd($request);
        try {
            $validated_data = $request->validate([
                'specimen_name' => 'required|string|min:3|max:255|unique:specimens,specimen_name,NULL,id,user_id,'.auth()->user()->id,
                'common_name' => 'required|string|min:3|max:255',
                'specimen_location_now' => 'required|integer',
                'location_found_city' => 'required|string|min:3|max:255',
                'location_found_county' => 'required|string|min:3|max:255',
                'state_id' => 'required|integer',
                'country_id' => 'required|integer',
                'location_public_y_n' => 'required',
                'share_data_y_n' => 'required',
                'month_found' => 'required|integer|min:1|max:12',
                'day_found' => 'required|integer|min:1|max:31',
                'year_found' => 'required|integer|min:1954|max:2025',
                'fungus_type' => 'required|integer',
                'entered_by' => 'required|integer',
            ]);
            // Dump validated data to ensure it works
            // dd($validated_data);
        } catch (ValidationException $e) {
            // To debug failures, dump the errors
            // dd($e->errors());
        }

        // dd(request()->all());
        // dd(auth()->user()->id);

        try {
            $specimen = Specimen::create([
                'user_id' => auth()->user()->id,
                'specimen_name' => request('specimen_name'),
                'common_name' => request('common_name'),
                'description' => request('description'),
                'comment' => request('comment'),
                'specimen_location_now' => request('specimen_location_now'),
                'location_found_city' => request('location_found_city'),
                'location_found_county' => request('location_found_county'),
                'state_id' => request('state_id'),
                'country_id' => request('country_id'),
                'location_public_y_n' => request('location_public_y_n'),
                'share_data_y_n' => request('share_data_y_n'),
                'month_found' => request('month_found'),
                'day_found' => request('day_found'),
                'year_found' => request('year_found'),
                'fungus_type' => request('fungus_type'),
                'entered_by' => request('entered_by'),
            ]);
        } catch (QueryException $e) {
            // Log the error details for debugging
            Log::error('Database query error: '.$e->getMessage());

            // Return an error message
            return back()->withErrors(['message' => 'An error occurred while saving the specimen data. Please check your input and try again.']);
        }

        // Mail::to($specimen['user'])->queue(new SpecimenCreated($specimen));

        // add this specimen to group named for month found owned by this user

        return redirect('/specimens')->with('message', 'Specimen created successfully');
        // return view('specimens.show', ['specimen' => $specimen])->with('message', 'Specimen created successfully');
    }

    public function create()
    {
        $countries = Country::all(); // Fetch all countries

        return view('specimens.create', compact('countries'));
    }

    public function edit(Specimen $specimen)
    {
        $countries = Country::all();

        // dd($specimen);

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
        // dd($field);
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

        $is_valid_date = DateUtils::isValidDate((int) $month, (int) $day, (int) $year);

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
            'state_id' => 'sometimes|integer',
            'country_id' => 'sometimes|integer',
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
            'state_id' => request('state_id'),
            'country_id' => request('country_id'),
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
        // dd($request);
        // Validate the incoming request
        $validated = $request->validate([
            'group_id' => 'required|exists:all_groups,id',
            'description' => 'nullable|string|max:1024',
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

    public function filterMenu()
    {
        $states = State::all(); // Load list of states
        $countries = Country::all(); // Load list of countries

        return view('specimens.filter', compact('states', 'countries'));
    }

    public function filterSpecimens(Request $request)
    {
        $query = Specimen::query();

        // Filter by user
        $query->where('user_id', $request->user()->id);

        // Filter by month
        if ($request->filled('month')) {
            $query->where('month_found', $request->input('month'));
        }

        // Filter by year
        if ($request->filled('year')) {
            $query->where('year_found', $request->input('year'));
        }

        // Filter by state
        if ($request->filled('state')) {
            $query->whereHas('state', function ($q) use ($request) {
                $q->where('name', $request->input('state'));
            });
        }

        // Filter by country
        if ($request->filled('country')) {
            $query->whereHas('country', function ($q) use ($request) {
                $q->where('name', $request->input('country'));
            });
        }

        return $query->paginate(20); // Paginate results for large datasets
    }

    public function filter_search(Request $request)
    {
        $states = State::all(); // Load states
        $countries = Country::all(); // Load countries
        $specimens = Specimen::query();

        // Apply filters
        if ($request->filled('month')) {
            $specimens->where('month_found', $request->input('month'));
        }
        if ($request->filled('year')) {
            $specimens->where('year_found', $request->input('year'));
        }
        if ($request->filled('state')) {
            $specimens->whereHas('state', function ($q) use ($request) {
                $q->where('name', $request->state);
            });
        }
        if ($request->filled('country')) {
            $specimens->whereHas('country', function ($q) use ($request) {
                $q->where('name', $request->country);
            });
        }

        // Paginate
        $specimens = $specimens->paginate(20);

        return view('specimens.filter_search', compact('states', 'countries', 'specimens'));
    }

    public function guestIndex()
    {
        // Explicitly allow access to guests
        $this->authorize('guestView', Specimen::class);

        // The `with` method expects relationships defined in the model, not column names
        $specimens = Specimen::with(['country', 'state']) // Eager load relationships
            ->where('location_public_y_n', 1)
            ->where('share_data_y_n', 1)
            ->paginate(10);

        // foreach ($specimens as $specimen) {
        //    dump($specimen->toArray()); // Check if 'state' and 'country' relationships are loaded
        // }

        return view('specimens.guest', compact('specimens'));
    }
}
