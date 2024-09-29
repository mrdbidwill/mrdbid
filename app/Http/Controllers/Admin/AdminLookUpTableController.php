<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Lookup\Character;
use App\Utils\StringUtils;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\View\View;

class AdminLookUpTableController extends Controller
{
    public function index(): View
    {
        //DB::enableQueryLog();
        $lookup_lists = Character::where('look_up_y_n', '1')
            ->where('display_options', '9')
            ->orderBy('name', 'asc')
            ->get();

        // Debug the log
        //dd(DB::getQueryLog());
        //dd($lookup_lists);
        // index will display list of all radio lookup tables
        // user will click on one and send to edit for that one id selected
        return view('admin.admin_lookup_table.index', compact('lookup_lists'));
    }

    public function create() {}

    public function store(Request $request) {}

    public function show($id) {}

    public function edit($id)
    {
        //dd($id);
        //DB::enableQueryLog();
        $characters = DB::table('characters')->where('id', '=', $id)->first();
        // Debug the log
        //dd(DB::getQueryLog());
        //$character = Character::findOrFail($id);
        //dd($characters);

        $table_name = $characters->name;
        //dd($table_name);

        $table_name_plural = StringUtils::get_table_name_special_cases($table_name);
        //dd($table_name_plural);

        if ($characters->look_up_y_n === 1 && $characters->display_options === 9) {
            //DB::enableQueryLog();
            $lookup_table_edits = DB::table($table_name_plural)->get();
            //dd(DB::getQueryLog());

            //dd($lookup_table_edits);

            // get data for this one lookup table and return to edit for editing
            return view('admin.admin_lookup_table.edit', compact('lookup_table_edits', 'id'));
        }

        return view('admin.admin_lookup_table.edit')->with('message', 'Did not receive id!');
    }

    public function update(Request $request, $id) {}

    public function destroy($id) {}
}
