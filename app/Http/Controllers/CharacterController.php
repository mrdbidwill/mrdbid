<?php

namespace App\Http\Controllers;

use App\Models\Lookup\Character;
use App\Services\Lookup\CharacterService;
use Illuminate\View\View;

class CharacterController extends Controller
{
    protected CharacterService $characterService;

    public function __construct(CharacterService $characterService)
    {
        $this->characterService = $characterService;
    }

    public function index(): View
    {
        $characters = $this->characterService->getAllcharacters();

        return view('characters.index', compact('characters'));

        //return view('characters.index', ['characters' => $characters]);
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

        request()->validate([
            'name' => ['required', 'min:2'],
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
