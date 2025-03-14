<?php

namespace App\Models\Lookup;

use Illuminate\Database\Eloquent\Model;

/**
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Species newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Species newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Species query()
 *
 * @mixin \Eloquent
 */
class Species extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
