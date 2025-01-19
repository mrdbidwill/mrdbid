<?php

namespace App\Http\Controllers;

use App\Models\Specimen;
use App\Repositories\CharacterRepository;
use App\Repositories\CharacterSpecimenRepository;
use App\Repositories\Lookup\ColorRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;

// Add ColorRepository

class CharacterSpecimenController extends Controller
{
    private $characterSpecimenRepository;

    private $characterRepository;

    private $colorRepository; // Add property for ColorRepository

    public function __construct(
        CharacterSpecimenRepository $characterSpecimenRepository,
        CharacterRepository $characterRepository,
        ColorRepository $colorRepository // Inject ColorRepository
    ) {
        $this->middleware('auth');

        $this->characterSpecimenRepository = $characterSpecimenRepository;
        $this->characterRepository = $characterRepository;
        $this->colorRepository = $colorRepository; // Assign to property
    }

    public function index()
    {
        $characters = $this->characterRepository->getCharactersByDisplayOptions([]);

        return view('character_specimens.index', ['characters' => $characters]);
    }

    public function edit($id)
    {
        $specimenId = $id;

        // returns all 50 colors from colors table - all data
        $colors = $this->colorRepository->getAllColors(); // Use ColorRepository

        // returns unset from characters table in this case display_option 6 is colors - all data
        $unsetCharacters = $this->characterSpecimenRepository->getUnsetCharactersBySpecimen($specimenId, [1, 6]);

        // returns all color table names from characters table - currently 28
        $colorCharacterNames = $this->characterRepository->getCharactersByDisplayOptions([6])->toArray();

        // Retrieve unset color characters via repository - currently 26
        $unsetColorCharacters = $this->characterSpecimenRepository->getUnsetColorCharactersBySpecimen($specimenId, $colorCharacterNames);

        // Set characters already linked to the specimen
        $setCharacters = $this->characterSpecimenRepository->getSetCharactersWithLookupData($specimenId);

        //dd($colors, $unsetCharacters, $colorCharacterNames, $unsetColorCharacters, $setCharacters, $specimenId);

        return view('character_specimens.edit', compact(
            'setCharacters',
            'unsetCharacters',
            'colors',
            'colorCharacterNames',
            'unsetColorCharacters',
            'specimenId'
        ));
    }

    public function show($specimenId)
    {
        // Fetch specimens specific to this ID
        $specimen = Specimen::findOrFail($specimenId);

        return view('character_specimens.show', ['specimen' => $specimen]);
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'character_id' => 'required|integer|exists:characters,id',
            'specimen_id' => 'required|integer|exists:specimens,id',
            'character_value' => 'required|string',
        ]);

        // Add user reference before syncing
        $validatedData['entered_by'] = Auth::user()->id;

        // Save character-specimen association
        $this->characterSpecimenRepository->syncCharacterSpecimens(
            $validatedData['specimen_id'],
            [$validatedData] // Pass as array since sync expects multiple data rows
        );

        return Redirect::back()->with('message', 'Character Specimen created successfully.');
    }

    public function update(Request $request, $specimenId)
    {
        $validatedData = $request->validate([
            'characters' => 'required|array', // Ensure it's an array
            'characters.*.character_id' => 'required|integer|exists:characters,id',
        ]);

        $characters = $validatedData['characters'];

        $characterData = [];
        foreach ($characters as $character) {
            $characterData[] = [
                'character_id' => $character['character_id'],
                'specimen_id' => $specimenId,
                'character_value' => $character['character_id'], // Example: Value is tied to character_id
                'entered_by' => auth()->id(), // Add logged-in user
            ];
        }

        // Sync characters via repository
        $this->characterSpecimenRepository->syncCharacterSpecimens($specimenId, $characterData);

        return redirect()->route('character_specimens.edit', $specimenId)
            ->with('success', 'Characters updated successfully.');
    }

    public function autocompleteGenus(Request $request)
    {
        $query = $request->get('query');

        $results = DB::connection('MBList.php')
            ->table('list')
            ->where('Rank', 'gen.')
            ->where('Taxon_name', 'like', '%'.$query.'%')
            ->select(['id', 'Taxon_name'])
            ->distinct()
            ->get();

        return response()->json($results);
    }

    public function autocompleteSpecies(Request $request)
    {
        $query = $request->get('query');

        $results = DB::connection('MBList.php')
            ->table('list')
            ->where('Rank', 'sp.')
            ->where('Taxon_name', 'like', '%'.$query.'%')
            ->select(['id', 'Taxon_name'])
            ->distinct()
            ->get();

        return response()->json($results);
    }
}
