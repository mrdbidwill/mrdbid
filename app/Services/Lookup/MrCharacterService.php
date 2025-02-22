<?php

namespace App\Services\Lookup;

use App\Repositories\MrCharacterRepository;

class MrCharacterService
{
    protected MrCharacterRepository $MrCharacterRepository;

    public function __construct(MrCharacterRepository $MrCharacterRepository)
    {
        $this->MrCharacterRepository = $MrCharacterRepository;
    }

    public function getAllcharacters()
    {
        return $this->MrCharacterRepository->getAll();
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
