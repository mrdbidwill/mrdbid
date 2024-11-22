<?php

namespace App\Repositories;

class ImageRepository
{
    protected string $image_specimen;

    public function getAll()
    {
        return $this->image_specimen->all();
    }
}
