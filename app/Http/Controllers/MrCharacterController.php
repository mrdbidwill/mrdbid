<?php

namespace App\Http\Controllers;

use App\Models\Lookup\Character;
use App\Models\MrCharacter;
use App\Services\Lookup\MrCharacterService;
use Illuminate\Http\Request;

class MrCharacterController extends Controller
{
    protected MrCharacterService $MrCharacterService;

    public function __construct(MrCharacterService $MrCharacterService)
    {

        $this->MrCharacterService = $MrCharacterService;
    }

    public function index()
    {
        $mr_characters = $this->MrCharacterService->getAllCharacters();

        return view('mr_characters.index', compact('mr_characters'));
    }

    public function show(MrCharacterService $MrCharacter)
    {
        $mr_characters = MrCharacter::all();

        return view('mr_characters.show', compact('mr_characters'));
    }

    public function create()
    {
        return view('mr_characters.create');
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

        $this->MrCharacterService->MrCreateCharacter($validatedData);

        return redirect('/mr_characters');
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

        $this->MrCharacterService->updateCharacter($mr_character, $validatedData);

        return redirect('/mr_characters/'.$character->id);
    }

    public function destroy(Character $character)
    {
        $this->MrCharacterService->deleteCharacter($character);

        return redirect('/mr_characters');
    }
}
