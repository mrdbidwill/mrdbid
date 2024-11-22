<?php

namespace App\Repositories\Lookup;

class CharacterRepository
{
    protected string $character;

    public function getAll()
    {
        return $this->character->all();
    }

    /*
    public function formatString(string $input): string
    {

    }
    */
}
