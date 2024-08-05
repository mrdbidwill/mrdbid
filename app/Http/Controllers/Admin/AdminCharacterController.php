<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Character;
use Illuminate\Http\Request;

class AdminCharacterController extends Controller
{
    public function update(Request $request, Character $character)
    {

        //Gate::authorize('edit-character', $character);

        //dd($request->all());

        // request()->validate([
        //     'name' => ['required', 'min:3'],
        //     'display_options' => 'required',
        //      'look_up_y_n' => 'required',
        //      'parts' => 'required',
        //      'source' => 'required',
        //      'entered_by' => 'required',
        //  ]);

        $character = Character::update([
            'name' => request('name'),
            'display_options' => request('display_options'),
            'look_up_y_n' => request('look_up_y_n'),
            'parts' => request('parts'),
            'source' => request('source'),
            'entered_by' => request('entered_by'),
        ]);

        //return 'Got her done!';
        return view('admin.admin_character_table.edit', ['character_table' => $character]);
    }

    public function index()
    {
        $character_tables = Character::get();

        return view('admin.admin_character_table.index', [
            'character_tables' => $character_tables,
        ]);
    }

    public function store(Request $request) {}

    public function show($id) {}

    public function edit($id)
    {
        $character_id = $id;
        //dd($specimen_id);

        // $character_tables = DB::table('characters')->simplePaginate(12)
        //     ->where('id', '=', $character_id)
        //     ->get();

        $character_table = Character::where('id', '=', $character_id)->get();
        //dd($character_table);

        return view('admin.admin_character_table.edit', ['character_table' => $character_table]);
    }

    public function create() {}

    public function destroy($id) {}
}
