<?php

namespace App\Repositories;

class CharacterSpecimenRepository
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
