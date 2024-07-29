<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;

class Soup extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'soup_name',
        'soup_description',
        'soup_relation',
    ];

    public function soupRelation(): BelongsTo
    {
        return $this->belongsTo(Specimen::class, 'soup_relation');
    }
}
