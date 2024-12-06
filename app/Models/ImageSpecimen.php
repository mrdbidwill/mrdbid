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
        'focal_length',
        'GPSLatitudeRef',
        'GPSLatitude_0',
        'GPSLatitude_1',
        'GPSLatitude_2',
        'GPSLongitudeRef',
        'GPSLongitude_0',
        'GPSLongitude_1',
        'GPSLongitude_2',
        'GPSAltitudeRef',
        'GPSAltitude',
        'entered_by',
    ];

    public function thumbnails()
    {
        return $this->hasOne(ImageSpecimenThumbnail::class, 'image_specimen_id');
    }
}
