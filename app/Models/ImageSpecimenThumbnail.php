<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ImageSpecimenThumbnail extends Model
{
    use HasFactory;

    protected $fillable = [
        'specimen_id',
        'thumbnail_file_address',
        'image_width',
        'image_height',
        'entered_by',
    ];
}
