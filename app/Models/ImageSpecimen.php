<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id
 * @property int $specimen_id
 * @property int|null $parts
 * @property string|null $description
 * @property string $image_name
 * @property string $file_address
 * @property int|null $image_width
 * @property int|null $image_height
 * @property string|null $camera_make
 * @property string|null $camera_model
 * @property string|null $lens
 * @property string|null $exposure
 * @property string|null $aperture
 * @property string|null $iso
 * @property string|null $date_taken
 * @property string|null $focal_length
 * @property string|null $GPSLatitudeRef
 * @property string|null $GPSLatitude_0
 * @property string|null $GPSLatitude_1
 * @property string|null $GPSLatitude_2
 * @property string|null $GPSLongitudeRef
 * @property string|null $GPSLongitude_0
 * @property string|null $GPSLongitude_1
 * @property string|null $GPSLongitude_2
 * @property string|null $GPSAltitudeRef
 * @property string|null $GPSAltitude
 * @property int $entered_by
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \App\Models\Specimen $specimen
 * @property-read \App\Models\ImageSpecimenThumbnail|null $thumbnails
 *
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereAperture($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereCameraMake($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereCameraModel($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereDateTaken($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereExposure($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereFileAddress($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereFocalLength($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereGPSAltitude($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereGPSAltitudeRef($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereGPSLatitude0($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereGPSLatitude1($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereGPSLatitude2($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereGPSLatitudeRef($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereGPSLongitude0($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereGPSLongitude1($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereGPSLongitude2($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereGPSLongitudeRef($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereImageHeight($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereImageName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereImageWidth($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereIso($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereLens($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereParts($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereSpecimenId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimen whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
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

    public function specimen()
    {
        return $this->belongsTo(Specimen::class);
    }
}
