<?php

namespace App\Http\Controllers;

use App\Models\Lookup\Character;
use App\Services\CharacterService;
use Illuminate\Http\Request;

class CharacterController extends Controller
{
    protected CharacterService $characterService;

    public function __construct(CharacterService $characterService)
    {
        $this->middleware('auth');
        $this->characterService = $characterService;
    }

    public function index()
    {
        $characters = $this->characterService->getAllCharacters();

        return view('characters.index', compact('characters'));
    }

    public function show(Character $character)
    {
        return view('characters.show', compact('character'));
    }

    public function create()
    {
        return view('characters.create');
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|min:3',
            'display_options' => 'required',
            'look_up_y_n' => 'required',
            'parts' => 'required',
            'source' => 'required',
            'entered_by' => 'required|integer',
        ]);

        $this->characterService->createCharacter($validatedData);

        return redirect('/characters');
    }

    public function edit(Character $character)
    {
        return view('characters.edit', compact('character'));
    }

    public function update(Request $request, Character $character)
    {
        $validatedData = $request->validate([
            'name' => 'required|min:2',
            'display_options' => 'required',
            'look_up_y_n' => 'required',
            'parts' => 'required',
            'source' => 'required',
            'entered_by' => 'required|integer',
        ]);

        $this->characterService->updateCharacter($character, $validatedData);

        return redirect('/characters/'.$character->id);
    }

    public function destroy(Character $character)
    {
        $this->characterService->deleteCharacter($character);

        return redirect('/characters');
    }
}
