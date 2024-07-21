<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;


class Character extends Model
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
    public function specimens(): BelongsTo
    {
        return $this->belongsTo(Specimen::class);
    }
}
