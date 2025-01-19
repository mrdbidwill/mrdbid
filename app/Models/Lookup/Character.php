<?php

namespace App\Models\Lookup;

use App\Models\Specimen;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Character extends Model
{
    use HasFactory;

    protected $fillable = [
        'id',
        'name',
        'display_options',
        'look_up_y_n',
        'parts',
        'source',
        'entered_by',
    ];

    public function specimens(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(Specimen::class);
    }
}
