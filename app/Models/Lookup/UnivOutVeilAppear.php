<?php

namespace App\Models\Lookup;

use Illuminate\Database\Eloquent\Model;

/**
 * @method static \Illuminate\Database\Eloquent\Builder<static>|UnivOutVeilAppear newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|UnivOutVeilAppear newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|UnivOutVeilAppear query()
 *
 * @mixin \Eloquent
 */
class UnivOutVeilAppear extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
