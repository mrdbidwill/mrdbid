<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class SpecimenGroup extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'display_options',
        'look_up_y_n',
        'part',
        'source',
        'entered_by',
    ];

    public function specimen_groups(): BelongsTo
    {
        return $this->belongsTo(Specimen::class);
    }
}
