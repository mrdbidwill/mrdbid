<?php

namespace App\Models\Lookup;

use Illuminate\Database\Eloquent\Model;

/**
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapContextFlesh newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapContextFlesh newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapContextFlesh query()
 *
 * @mixin \Eloquent
 */
class CapContextFlesh extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
