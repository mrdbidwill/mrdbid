<?php

namespace App\Repositories;

use App\Models\MrCharacter;

// Import the MrCharacter model

class MrCharacterRepository
{
    protected MrCharacter $character; // Change the type from 'string' to 'MrCharacter'

    // Inject the MrCharacter model using the constructor
    public function __construct(MrCharacter $character)
    {
        $this->character = $character;
    }

    public function getCharactersByDisplayOptions(array $array)
    {
        // dd($array);
        $characters_display = MrCharacter::whereIn('display_options', $array) // Use `whereIn` to filter
            ->orderBy('display_options', 'asc')  // Order by `display_options`
            ->get();                              // Fetch the results
        // dd($characters_display);

        return $characters_display;
    }

    public function getAll()
    {
        return $this->character->all();

    }
}
