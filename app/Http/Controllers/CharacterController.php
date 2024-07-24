<?php

namespace App\Http\Controllers;

use App\Models\Character;
use Illuminate\Support\Facades\DB;

class CharacterController extends Controller
{
    public function index()
    {
        $characters = DB::table('characters')->simplePaginate(8);

        return view('characters.index', [
            'characters' => $characters,
        ]);
    }

    public function show(Character $Character)
    {
        return view('characters.show', ['Character' => $Character]);
    }

    public function store()
    {
        request()->validate([
            'name' => ['required', 'min:3'],
            'display_options' => ['required'],
            'look_up_y_n' => ['required'],
            'part' => ['required'],
            'source' => ['required'],
            'entered_by' => ['required'],
        ]);

        Character::create([
            'name' => request('name'),
            'display_options' => request('display_options'),
            'look_up_y_n' => request('look_up_y_n'),
            'part' => request('part'),
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
            'part' => 'required',
            'source' => 'required',
            'entered_by' => 'required',
        ]);

        $character->update([
            'name' => request('name'),
            'display_options' => request('display_options'),
            'look_up_y_n' => request('look_up_y_n'),
            'part' => request('part'),
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
}
