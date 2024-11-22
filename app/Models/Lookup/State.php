<?php

namespace App\Models\Lookup;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class State extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'country_id',
        'entered_by',
    ];

    public function country(): BelongsTo
    {
        return $this->belongsTo(Country::class);
    }
}
