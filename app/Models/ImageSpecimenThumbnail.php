<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ImageSpecimenThumbnail extends Model
{
    use HasFactory;

    protected $fillable = [
        'image_specimen_id',
        'thumbnail_file_address',
        'image_width',
        'image_height',
        'entered_by',
    ];

    public function imageSpecimen()
    {
        return $this->belongsTo(ImageSpecimen::class, 'image_specimen_id');
    }
}
