<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class SpecimenCluster extends Model
{
    use HasFactory;

    protected $fillable = [
        'member_id',
        'name',
        'description',
        'comments',
        'entered_by',
    ];

    public function specimens(): BelongsTo
    {
        return $this->belongsTo(Specimen::class);
    }
}
