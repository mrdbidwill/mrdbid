<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ImageSpecimen extends Model
{
    use HasFactory;

    public int $specimen_id;

    public int $parts;

    public string $description;

    public string $file_address;

    public int $image_width;

    public int $image_height;

    public string $camera_make;

    public string $camera_model;

    public string $lens;

    public string $aperture;

    public string $exposure;

    public string $iso;

    public string $date_taken;

    public int $entered_by;

    protected $fillable = [
        'specimen_id',
        'parts',
        'description',
        'file_address',
        'image_width',
        'image_height',
        'camera_make',
        'camera_model',
        'lens',
        'exposure',
        'aperture',
        'iso',
        'date_taken',
        'entered_by',
    ];

    public function getSpecimenId(): string
    {
        return $this->specimen_id;
    }

    public function setSpecimenId(string $specimen_id): void
    {
        $this->specimen_id = $specimen_id;
    }

    public function getParts(): int
    {
        return $this->parts;
    }

    public function setParts(int $parts): void
    {
        $this->parts = $parts;
    }

    public function getDescription(): string
    {
        return $this->description;
    }

    public function setDescription(string $description): void
    {
        $this->description = $description;
    }

    public function getFileAddress(): string
    {
        return $this->file_address;
    }

    public function setFileAddress(string $file_address): void
    {
        $this->file_address = $file_address;
    }

    public function getImageWidth(): int
    {
        return $this->image_width;
    }

    public function setImageWidth(int $image_width): void
    {
        $this->image_width = $image_width;
    }

    public function getImageHeight(): int
    {
        return $this->image_height;
    }

    public function setImageHeight(int $image_height): void
    {
        $this->image_height = $image_height;
    }

    public function getCameraMake(): string
    {
        return $this->camera_make;
    }

    public function setCameraMake(string $camera_make): void
    {
        $this->camera_make = $camera_make;
    }

    public function getCameraModel(): string
    {
        return $this->camera_model;
    }

    public function setCameraModel(string $camera_model): void
    {
        $this->camera_model = $camera_model;
    }

    public function getLens(): string
    {
        return $this->lens;
    }

    public function setLens(string $lens): void
    {
        $this->lens = $lens;
    }

    public function getExposure(): string
    {
        return $this->exposure;
    }

    public function setExposure(string $exposure): void
    {
        $this->exposure = $exposure;
    }

    public function getAperture(): string
    {
        return $this->aperture;
    }

    public function setAperture(string $aperture): void
    {
        $this->aperture = $aperture;
    }

    public function getIso(): string
    {
        return $this->iso;
    }

    public function setIso(string $iso): void
    {
        $this->iso = $iso;
    }

    public function getDateTaken(): string
    {
        return $this->date_taken;
    }

    public function setDateTaken(string $date_taken): void
    {
        $this->date_taken = $date_taken;
    }

    public function getEnteredBy(): int
    {
        return $this->entered_by;
    }

    public function setEnteredBy(int $entered_by): void
    {
        $this->entered_by = $entered_by;
    }
}
