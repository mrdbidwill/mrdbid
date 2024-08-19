<?php

namespace App\Http\Controllers;

use App\Models\Character;
use Illuminate\View\View;

class CharacterController extends Controller
{
    public function index(): View
    {

        // get all available characters
        // Not paginating here so will show all in a one-page grid
        $characters = Character::get();

        /*
                foreach ($characters as $character) {

                    $display = DB::table('display_options')
                        ->where('id', '=', $character['display_options'])
                        ->first();

                    $parts = DB::table('parts')
                        ->where('id', '=', $character['parts'])
                        ->first();

                    $source = DB::table('data_sources')
                        ->where('id', '=', $character['source'])
                        ->first();

                    $by = DB::table('users')
                        ->where('id', '=', $character['entered_by'])
                        ->first();
                }
        */
        return view('characters.index', ['characters' => $characters]);
    }

    public function show(Character $character)
    {
        return view('characters.show', ['Character' => $character]);
    }

    public function store()
    {
        request()->validate([
            'name' => ['required', 'min:3'],
            'display_options' => ['required'],
            'look_up_y_n' => ['required'],
            'parts' => ['required'],
            'source' => ['required'],
            'entered_by' => ['required'],
        ]);

        Character::create([
            'name' => request('name'),
            'display_options' => request('display_options'),
            'look_up_y_n' => request('look_up_y_n'),
            'parts' => request('parts'),
            'source' => request('Character_location_now'),
            'entered_by' => request('entered_by'),

        ]);

        return redirect('/characters');
    }

    public function create()
    {
        return view('characters.create');
    }

    public function edit(Character $Character)
    {
        return view('characters.edit', ['Character' => $Character]);

    }

    public function update(Character $character)
    {
        // authorize (On hold...)

        request()->validate([
            'name' => ['required', 'min:3'],
            'display_options' => ['required'],
            'look_up_y_n' => 'required',
            'parts' => 'required',
            'source' => 'required',
            'entered_by' => 'required',
        ]);

        $character->update([
            'name' => request('name'),
            'display_options' => request('display_options'),
            'look_up_y_n' => request('look_up_y_n'),
            'parts' => request('parts'),
            'source' => request('source'),
            'entered_by' => request('entered_by'),

        ]);

        return redirect('/characters/'.$character->id);
    }

    public function destroy(Character $character)
    {
        // authorize (On hold...)

        $character->delete();

        return redirect('/characters');
    }

    public function display_characters($specimen_id)
    {
        //dd($specimen_id);
        //dd($characters);

        return Character::get();

    }
}
