<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class SpecimenGroup extends Model
{
    protected $fillable = [
        'member_id',
        'name',
        'description',
        'comments',
        'entered_by',
    ];

    public function specimen_groups(): BelongsTo
    {
        return $this->belongsTo(Specimen::class);
    }
}
