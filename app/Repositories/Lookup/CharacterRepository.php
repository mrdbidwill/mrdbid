<?php

namespace App\Repositories\Lookup;

class CharacterRepository
{
    protected $character;

    public function getAll()
    {
        return $this->character->all();
    }

    public function formatString(string $input): string
    {
        $display_string = str_replace('_', ' ', $input);

        return ucwords($display_string);
    }
}
