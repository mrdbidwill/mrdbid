<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Lookup\Character;
use Illuminate\Http\Request;

class AdminCharacterController extends Controller
{
    public function index()
    {

        $character_tables = Character::get();

        return view('admin.admin_character.index', [
            'character_tables' => $character_tables,
        ]);
    }

    public function store(Request $request)
    {
        //dd($request->all());

        request()->validate([
            'name' => 'required|unique:characters,name|min:2',
            'display_options' => 'required',
            'look_up_y_n' => 'required',
            'parts' => 'required',
            'source' => 'required',
            'entered_by' => 'required',
        ]);
        $character = Character::create([
            'name' => request('name'),
            'display_options' => request('display_options'),
            'look_up_y_n' => request('look_up_y_n'),
            'parts' => request('parts'),
            'source' => request('source'),
            'entered_by' => auth()->user()->id,
        ]);

        $character_tables = Character::get();
        //return 'Got her done!';

        //dd($character_tables);

        return view('admin.admin_character.index', [
            'character_tables' => $character_tables,
        ]);
    }

    public function create()
    {
        return view('admin.admin_character.create');
    }

    public function show($id) {}

    public function edit($id)
    {
        $character_id = $id;
        //dd($specimen_id);

        $character_table = Character::where('id', '=', $character_id)->get();
        //dd($character_table);

        return view('admin.admin_character.edit', ['character_table' => $character_table]);
    }

    public function update(Request $request)
    {
        //dd($request->all());
        //  dd($request->id);  // 1
        //  dd($request->route('id')); // null
        $request->validate([
            'name' => 'required|min:2|unique:characters,name,'.$request->id,
            'display_options' => 'required',
            'look_up_y_n' => 'required',
            'parts' => 'required',
            'source' => 'required',
            'entered_by' => 'required',
        ]);
        //dd($request->all());
        $one_character = Character::where('id', '=', $request->id)->first();
        $one_character->update([
            'name' => $request->input('name'),
            'display_options' => $request->input('display_options'),
            'look_up_y_n' => $request->input('look_up_y_n'),
            'parts' => $request->input('parts'),
            'source' => $request->input('source'),
            'entered_by' => auth()->user()->id,
        ]);

        $character_tables = Character::get();
        //return 'Got her done!';

        //dd($character_tables);

        return view('admin.admin_character.index', [
            'character_tables' => $character_tables,
        ]);
    }

    public function destroy($id) {}
}
