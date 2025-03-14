<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id
 * @property int $image_specimen_id
 * @property string $thumbnail_file_address
 * @property int $image_width
 * @property int $image_height
 * @property int $entered_by
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \App\Models\ImageSpecimen $imageSpecimen
 *
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimenThumbnail newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimenThumbnail newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimenThumbnail query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimenThumbnail whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimenThumbnail whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimenThumbnail whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimenThumbnail whereImageHeight($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimenThumbnail whereImageSpecimenId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimenThumbnail whereImageWidth($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimenThumbnail whereThumbnailFileAddress($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ImageSpecimenThumbnail whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
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
