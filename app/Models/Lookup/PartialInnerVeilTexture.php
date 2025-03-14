<?php

namespace App\Models\Lookup;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id
 * @property string $name
 * @property string|null $description
 * @property string|null $comments
 * @property int $source
 * @property int $entered_by
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 *
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilTexture newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilTexture newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilTexture query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilTexture whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilTexture whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilTexture whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilTexture whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilTexture whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilTexture whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilTexture whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilTexture whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class PartialInnerVeilTexture extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
