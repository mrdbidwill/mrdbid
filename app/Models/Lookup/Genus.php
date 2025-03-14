<?php

namespace App\Models\Lookup;

use Illuminate\Database\Eloquent\Model;

/**
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Genus newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Genus newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Genus query()
 *
 * @mixin \Eloquent
 */
class Genus extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
