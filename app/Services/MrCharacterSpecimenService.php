<?php

namespace App\Services;

use App\Repositories\MrCharacterRepository;

class MrCharacterSpecimenService
{
    protected MrCharacterRepository $characterRepository;

    public function __construct(MrCharacterRepository $characterRepository)
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
