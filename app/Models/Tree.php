<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

/**
 * @property-read \App\Models\Specimen|null $specimens
 *
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Tree newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Tree newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Tree query()
 *
 * @mixin \Eloquent
 */
class Tree extends Model
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
