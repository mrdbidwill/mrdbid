<?php

namespace App\Http\Controllers;

use App\Models\CharacterSpecimen;
use App\Models\Lookup\Character;
use App\Models\Lookup\Color;
use App\Models\Specimen;
use App\Services\Lookup\CharacterService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Redirect;

class CharacterSpecimenController extends Controller
{
    protected CharacterService $characterService;

    public function __construct(CharacterService $characterService)
    {
        $this->characterService = $characterService;
    }

    public function index()
    {
        //dd($specimen_id);
        $characters = Character::get();

        return view('character_specimens.index', ['characters' => $characters]);
    }

    public function edit($id)
    {
        //dd($id);
        $specimen_id = $id;
        $colors = Color::get();
        $color_character_names = Character::where('display_options', '6')->orderBy('name')->get();
        $list_of_set_characters = CharacterSpecimen::getSetCharactersBySpecimenId($id);
        // Fetch characters that are NOT set in the character_specimen table for the given specimen_id
        $unset_characters = CharacterSpecimen::getUnSetCharactersBySpecimenId($id);

        return view('character_specimens.edit', compact('colors', 'color_character_names', 'list_of_set_characters', 'unset_characters', 'specimen_id'));
    }

    public function show(Specimen $specimen_id)
    {
        // get specimens for this user
        $specimens = Specimen::where('id', $specimen_id)->get();
        //dd($specimens);

        return view('character_specimens.show', ['specimens' => $specimens]);
    }

    public function store(Request $request)
    {
        //dd($request);
        $character_id = $request->input('character_id');
        $specimen_id = $request->input('specimen_id');
        $character_value = $request->input('character_value'); // This should now be the ID
        $entered_by = Auth::user();

        request()->validate([
            'character_id' => 'required|integer',
            'specimen_id' => 'required|integer',
            'character_value' => 'required',
        ]);

        //  'character_value' => 'required|unique:character_specimens,character_value,NULL,id,specimen_id,'.$specimen_id,
        CharacterSpecimen::create([
            'character_id' => $character_id,
            'specimen_id' => $specimen_id,
            'character_value' => $character_value,
            'entered_by' => $entered_by->id,
        ]);

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

    public function autocompleteGenus(Request $request)
    {
        //dd($request);
        $query = $request->get('query');
        Log::info('Query for Genus: '.$query); // Log the query

        $results = DB::connection('MBList.php')->table('list')
            ->where('Rank_', 'gen.')
            ->where('Taxon_name', 'like', '%'.$query.'%')
            ->select('id', 'Taxon_name')  // Select the id and Taxon_name
            ->distinct()
            ->get();

        Log::info('Results for Genus: '.json_encode($results)); // Log the results

        return response()->json($results);
    }

    public function autocompleteSpecies(Request $request)
    {
        $query = $request->get('query');
        Log::info('Query for Species: '.$query); // Log the query

        $results = DB::connection('MBList.php')->table('list')
            ->where('Rank_', 'sp.')
            ->where('Taxon_name', 'like', '%'.$query.'%')
            ->select('id', 'Taxon_name')  // Select the id and Taxon_name
            ->distinct()
            ->get();

        Log::info('Results for Species: '.json_encode($results)); // Log the results

        return response()->json($results);
    }
}
