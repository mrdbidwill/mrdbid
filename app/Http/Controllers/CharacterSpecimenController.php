<?php

namespace App\Http\Controllers;

use App\Models\CharacterSpecimen;
use App\Models\Lookup\Character;
use App\Models\Specimen;
use App\Services\Lookup\CharacterService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;

class CharacterSpecimenController extends Controller
{
    protected CharacterService $characterService;

    public function __construct(CharacterService $characterService)
    {
        $this->characterService = $characterService;
    }

    public function index(Specimen $specimen_id)
    {
        $characters = Character::get();

        return view('specimens.index', ['characters' => $characters]);
    }

    public function edit($specimen_id)
    {
        //dd($specimen_id);
        $specimenId = $specimen_id;

        return view('character_specimens.edit')->with('specimenId', $specimenId);

    }

    public function show(Specimen $specimen_id)
    {
        //dd($specimen_id);
        //return view('specimens.show', ['specimen' => $specimen->user_id = auth()->id()]);
        // get specimens for this user
        $specimens = Specimen::where('id', $specimen_id)->get();
        //dd($specimens);

        return view('character_specimens.show', ['specimens' => $specimens]);
    }

    public function store(Request $request)
    {
        //dd(request()->all());
        //dd($request['color']);

        //$character_id = request('character');
        $specimen_id = request('specimen_id');
        $entered_by = Auth::user();

        //dd($request->all());

        if (isset($request['color'])) {
            $character_value = request('color');
        } else {
            $character_value = request('character_value');
        }

        // below won't work because it will allow the same character_value for the same specimen_id and character_id WITH A DIFFERENT character_value
        // 'character_value' => 'required|unique:character_specimens,character_value,NULL,id,specimen_id,'.$s_id.',character_id,'.$c_id,
        /*
                request()->validate([
                    'character_id' => 'required|integer',
                    'specimen_id' => 'required|integer',
                    'character_value' => 'required|unique:character_specimens,character_value,NULL,id,specimen_id,'.request('specimen_id'),
                ]);
        */
        CharacterSpecimen::create([
            'character_id' => request('character_id'),
            'specimen_id' => request('specimen_id'),
            'character_value' => $character_value,
            'entered_by' => $entered_by['id'],
        ]);

        // return redirect('character_specimens/edit')->with('message', 'Character Specimen created successfully');
        //return redirect()->route('/character_specimens/'.$specimen_id.'/edit')->with('message', 'Character Specimen created successfully.');
        return Redirect::back()->with('message', 'Character Specimen created successfully.');
    }

    public function create(Request $request)
    {
        $characters = Character::get();

        return view('character_specimens.create', ['characters' => $characters, 'request' => $request]);
    }

    public function update(Request $request, $s_id)
    {
        //Gate::authorize('edit-character_specimen', $character_specimen);

        $s_id = request('specimen_id');

        request()->validate([
            'character_id' => 'required|integer',
            'specimen_id' => 'required|integer',
            'character_value' => 'required|unique:character_specimens,character_value,NULL,id,specimen_id,'.$s_id,
        ]);

        $characterSpecimen = CharacterSpecimen::findOrFail($s_id);
        $characterSpecimen->update([
            'character_id' => request('character_id'),
            'specimen_id' => request('specimen_id'),
            'character_value' => request('character_value'),
            'entered_by' => request('entered_by')->where('id', $s_id),
        ]);

        return redirect('/character_specimens/'.$s_id.'/edit');
    }
}
