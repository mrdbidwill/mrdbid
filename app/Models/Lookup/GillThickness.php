<?php

namespace App\Models\Lookup;

use Illuminate\Database\Eloquent\Model;

/**
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillThickness newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillThickness newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillThickness query()
 *
 * @mixin \Eloquent
 */
class GillThickness extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
