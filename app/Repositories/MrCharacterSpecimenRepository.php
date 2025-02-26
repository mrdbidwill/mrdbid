<?php

namespace App\Repositories;

use App\Models\MrCharacter;
use App\Models\MrCharacterSpecimen;
use DB;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Schema;

class MrCharacterSpecimenRepository
{
    protected string $character;

    // Constructor to inject the MrCharacter model
    public function __construct(MrCharacter $character)
    {
        $this->character = $character;
    }

    public function getAll()
    {
        return $this->character->all(); // Call the `all()` method
    }

    /**
     * Get characters along with lookup data if necessary.
     */
    public function getSetCharactersWithLookupData(int $specimenId): Collection
    {
        // Step 1: Fetch set characters for the given specimen
        $setCharacters = $this->getSetCharactersBySpecimen($specimenId);

        // Step 2: Identify characters with 'look_up_y_n' = 1
        $lookupCharacterNames = MrCharacter::whereIn('id', $setCharacters->pluck('id'))
            ->where('look_up_y_n', 1)
            ->pluck('name')
            ->unique();

        // Step 3: Preload lookup data for each relevant lookup table and store in a lookup array
        $lookups = [];

        foreach ($lookupCharacterNames as $tableName) {
            $tableName = strtolower($tableName); // Ensure table names are in lowercase
            if (Schema::hasTable($tableName)) { // Check if the table exists
                $lookups[$tableName] = DB::table($tableName)->get()->keyBy('id'); // Fetch lookup data
            }
        }

        // Step 4: Attach lookup data to each character if applicable
        $setCharacters->transform(function ($characterSpecimen) use ($lookups) {
            $character = MrCharacter::find($characterSpecimen['id']); // Fetch character details

            if ($character && $character->look_up_y_n) {
                $tableName = strtolower($character->name); // Use the character name as table name
                $characterSpecimen->lookup_data =
                    $lookups[$tableName][$characterSpecimen->character_value] ?? null; // Attach lookup data if found
            }

            $characterSpecimen->name = $character->name; // Add the character name
            $characterSpecimen->look_up_y_n = $character->look_up_y_n; // Add lookup indicator

            return $characterSpecimen;
        });

        return $setCharacters;
    }

    /**
     * Get all characters currently set for a given specimen.
     */
    public function getSetCharactersBySpecimen(int $specimenId): Collection
    {
        /*
        return CharacterSpecimen::where('specimen_id', $specimenId)
            ->join('characters', 'character_specimens.character_id', '=', 'characters.id') // Join characters table
            ->select('characters.*', 'character_specimens.character_value') // Select fields from both tables
            ->orderBy('name') // Sort alphabetically by character name
            ->get();
        */

        $setCharacters = MrCharacterSpecimen::where('specimen_id', $specimenId)
            ->join('mr_characters', 'mr_character_specimens.mr_character_id', '=', 'mr_characters.id')
            ->select('mr_characters.id', 'mr_character_specimens.character_value')
            ->orderBy('name')
            ->get();

        // dd($setCharacters->toArray());
        // for each row -0 => array:2 id => 79 character_value => 120

        return $setCharacters;
    }

    /**
     * Get characters that are NOT associated with a given specimen.
     *
     * @return Collection
     */
    public function getUnsetCharactersBySpecimen(int $specimenId, array $excludedDisplayOptions = [])
    {
        // dd($specimenId, $excludedDisplayOptions);  // OK
        // Get characters NOT in the character_specimens table for this specimen
        $setCharacterIds = $this->getSetCharactersBySpecimen($specimenId)->pluck('id')->toArray();
        // dd($setCharacterIds);  // OK

        $characters = MrCharacter::whereNotIn('id', $setCharacterIds)->get();
        // dd($characters->toArray(), $excludedDisplayOptions);

        $filteredCharacters = $characters->whereNotIn('display_options', $excludedDisplayOptions);
        // dd($filteredCharacters->toArray());

        return MrCharacter::whereNotIn('id', $setCharacterIds)
            ->when($excludedDisplayOptions, function ($query) use ($excludedDisplayOptions) {
                return $query->whereNotIn('display_options', $excludedDisplayOptions);
            })
            ->orderBy('name', 'asc')
            ->get();
    }

    public function getUnsetColorCharactersBySpecimen(int $specimenId, $colorCharacterNames): Collection
    {
        if (! ($colorCharacterNames instanceof Collection)) {
            $colorCharacterNames = collect($colorCharacterNames); // Convert to collection if it's an array
        }

        $setCharacterIds = MrCharacterSpecimen::where('specimen_id', $specimenId)
            ->pluck('mr_character_id')
            ->toArray();

        // Use Collection filtering and return as Collection
        return $colorCharacterNames->reject(function ($character) use ($setCharacterIds) {
            return in_array($character['id'], $setCharacterIds);
        })->values();
    }

    /**
     * Insert or update character-specimen relationships.
     *
     * @return void
     */
    public function syncCharacterSpecimens(int $specimenId, array $characterData)
    {
        // Remove all characters for the given specimen
        MrCharacterSpecimen::where('specimen_id', $specimenId)->delete();

        // Reinsert new character-specimen relationships
        foreach ($characterData as $data) {
            MrCharacterSpecimen::create([
                'character_id' => $data['character_id'],
                'specimen_id' => $data['specimen_id'],
                'character_value' => $data['character_value'],
                'entered_by' => $data['entered_by'],
            ]);
        }
    }
}
