<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ImageSpecimen extends Model
{
    use HasFactory;

    protected $fillable = [
        'specimen_id',
        'parts',
        'description',
        'image_name',
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
}
