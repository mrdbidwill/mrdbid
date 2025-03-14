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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilFate newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilFate newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilFate query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilFate whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilFate whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilFate whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilFate whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilFate whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilFate whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilFate whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilFate whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class PartialInnerVeilFate extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
