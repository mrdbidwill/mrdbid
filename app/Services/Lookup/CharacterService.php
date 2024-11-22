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

    /*
    public function formatString($input): string   // this function is now in StringUtils.php
    {
        $formattedString = StringUtils::formatString($inputString);  // but this is how you would use it here
        $formattedDate = DateUtils::formatDate($inputDate);
        return $this->characterRepository->formatString($input);
    }
    */

    // Other business logic methods
}
