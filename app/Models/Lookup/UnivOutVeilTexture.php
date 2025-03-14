<?php

namespace App\Models\Lookup;

use Illuminate\Database\Eloquent\Model;

/**
 * @method static \Illuminate\Database\Eloquent\Builder<static>|UnivOutVeilTexture newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|UnivOutVeilTexture newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|UnivOutVeilTexture query()
 *
 * @mixin \Eloquent
 */
class UnivOutVeilTexture extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
