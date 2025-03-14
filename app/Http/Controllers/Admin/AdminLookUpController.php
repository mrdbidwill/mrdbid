<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\DataSource;
use App\Models\MrCharacter;
use App\Utils\StringUtils;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\View\View;

class AdminLookUpController extends Controller
{
    public function index(): View
    {
        if (auth()->user()->type >= 4) {
            abort(403, 'Unauthorized action.');
        }

        // DB::enableQueryLog();
        $lookup_lists = MrCharacter::where('look_up_y_n', '1')
            ->where('display_options', '9')
            ->orderBy('name', 'asc')
            ->get();

        // Debug the log
        // dd(DB::getQueryLog());
        // dd($lookup_lists);
        // index will display list of all radio lookup tables
        // user will click on one and send to edit for that one id selected
        return view('admin.admin_lookup.index', compact('lookup_lists'));
    }

    public function show($id)
    {
        if (auth()->user()->type >= 4) {
            abort(403, 'Unauthorized action.');
        }

        // return view('specimens.show', ['specimen' => $specimen->user_id = auth()->id()]);
        // get specimens for this user
        $lookup_table = MrCharacter::find($id); // This returns a single model instance

        $lookup_source = DataSource::find($lookup_table->source);
        // dd($specimen);

        return view('admin.admin_lookup.show', compact('lookup_table', 'lookup_source'));
    }

    public function store(Request $request)
    {
        if (auth()->user()->type >= 4) {
            abort(403, 'Unauthorized action.');
        }

        request()->validate([
            'name' => ['required', 'min:3'],
            'description' => ['min:3', 'max:2048'],
            'comments' => ['min:3', 'max:2048'],
            'source' => ['required'],
            'entered_by' => ['required'],
        ]);

        MrCharacter::create([
            'name' => request('name'),
            'description' => request('description'),
            'comments' => request('comments'),
            'source' => request('Character_location_now'),
            'entered_by' => request('entered_by'),

        ]);

        return redirect('/admin_lookup.index')->with('message', 'Specimen updated successfully');
    }

    public function create()
    {
        if (auth()->user()->type >= 4) {
            abort(403, 'Unauthorized action.');
        }

        $characters = MrCharacter::all(); // Fetch all mr_characters

        return view('admin.admin_lookup.create', compact('characters'));
    }

    public function edit($id)
    {
        if (auth()->user()->type >= 4) {
            abort(403, 'Unauthorized action.');
        }

        // dd($id);
        // DB::enableQueryLog();
        $characters = DB::table('mr_characters')->where('id', '=', $id)->first();
        // Debug the log
        // dd(DB::getQueryLog());
        // $character = MrCharacter::findOrFail($id);
        // dd($mr_characters);

        $table_name = $characters->name;
        // dd($table_name);

        $table_name_plural = StringUtils::get_table_name_special_cases($table_name);
        // dd($table_name_plural);

        if ($characters->look_up_y_n === 1 && $characters->display_options === 9) {
            // DB::enableQueryLog();
            $lookup_table_edits = DB::table($table_name_plural)->get();
            // dd(DB::getQueryLog());

            // dd($lookup_table_edits);

            // get data for this one lookup table and return to edit for editing
            return view('admin.admin_lookup.edit', compact('lookup_table_edits', 'characters', 'id'));
        }

        return view('admin.admin_lookup.edit')->with('message', 'Did not receive id!');
    }

    public function update(Request $request, $id)
    {
        if (auth()->user()->type >= 4) {
            abort(403, 'Unauthorized action.');
        }

        // dd($request);
        // dd($id);  // this id is the character table id
        // dd($request->table_name);
        // dd($request->new_value);

        request()->validate([
            // Exclude the current specimen's ID from the unique check
            // Allow same specimen_name if it is NOT being changed
            'name' => 'string|min:3|max:255'.auth()->id(),
            'description' => 'string|max:255'.auth()->id(),
            'comments' => 'string|max:255'.auth()->id(),
            'source' => 'integer',
            'entered_by' => 'integer',
        ]);

        $table_name = $request->table_name;
        $table_name_plural = StringUtils::get_table_name_special_cases($table_name);
        $column_name = $request->column;
        $row = $request->row;
        // dd($row);

        // Update the relevant table in the database
        // DB::enableQueryLog();
        DB::table($table_name_plural)->where('id', $row)->update([$column_name => $request->new_value]);
        // Debug the log
        // dd(DB::getQueryLog());

        return redirect('admin_lookup/'.$id.'/edit')->with('message', 'Table updated successfully');
    }

    public function destroy($id)
    {
        if (auth()->user()->type >= 4) {
            abort(403, 'Unauthorized action.');
        }

        echo '<p>In Destroy!</p>';
    }
}
