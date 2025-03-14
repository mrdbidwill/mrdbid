<?php

namespace App\Models\Lookup;

use Illuminate\Database\Eloquent\Model;

/**
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapSurfaceDryness newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapSurfaceDryness newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapSurfaceDryness query()
 *
 * @mixin \Eloquent
 */
class CapSurfaceDryness extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
