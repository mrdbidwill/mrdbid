<?php

namespace App\Services\Lookup;

use App\Repositories\Lookup\CharacterRepository;

class CharacterService
{
    protected CharacterRepository $characterRepository;

    public function __construct(CharacterRepository $characterRepository)
    {
        $this->characterRepository = $characterRepository;
    }

    public function getAllcharacters()
    {
        return $this->characterRepository->getAll();
    }

    public function formatString($input): string
    {
        return $this->characterRepository->formatString($input);
    }

    // Other business logic methods
}
