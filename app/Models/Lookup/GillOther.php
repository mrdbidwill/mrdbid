<?php

namespace App\Models\Lookup;

use Illuminate\Database\Eloquent\Model;

/**
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillOther newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillOther newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillOther query()
 *
 * @mixin \Eloquent
 */
class GillOther extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
