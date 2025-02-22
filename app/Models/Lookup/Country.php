<?php

namespace App\Models\Lookup;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Country extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];

    // Ensure name can be nullable
    protected $attributes = [
        'name' => null,
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);
    }

    public function states(): HasMany
    {
        return $this->hasMany(State::class);
    }
}
