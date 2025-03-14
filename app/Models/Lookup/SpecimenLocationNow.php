<?php

namespace App\Models\Lookup;

use Illuminate\Database\Eloquent\Model;

/**
 * @method static \Illuminate\Database\Eloquent\Builder<static>|SpecimenLocationNow newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|SpecimenLocationNow newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|SpecimenLocationNow query()
 *
 * @mixin \Eloquent
 */
class SpecimenLocationNow extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
