<?php

namespace App\Models\Lookup;

use Illuminate\Database\Eloquent\Model;

/**
 * @method static \Illuminate\Database\Eloquent\Builder<static>|UnivOutVeilFate newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|UnivOutVeilFate newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|UnivOutVeilFate query()
 *
 * @mixin \Eloquent
 */
class UnivOutVeilFate extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
