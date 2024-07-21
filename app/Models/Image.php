<?php

namespace App\Models;

use App\Events\ImageCreated;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Image extends Model
{
    use HasFactory;

    public int $specimen_id;

    public int $parts;

    public string $description;

    public string $source_remote;

    public string $source_local;

    public int $image_width;

    public int $image_height;

    public int $camera_make;

    public string $camera_model;

    public string $lens;

    public string $exposure;

    public string $aperture;

    public string $iso;

    public string $date_taken;

    public int $entered_by;

    protected $fillable = [
        'specimen_id',
        'parts',
        'description',
        'source_remote',
        'source_local',
        'image_width',
        'image_height',
        'camera_make',
        'camera_model',
        'lens',
        'exposure',
        'iso',
        'date_taken',
        'entered_by',
    ];

    protected $dispatchesEvents = [
        'created' => ImageCreated::class,

    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(Specimen::class);
    }
}
