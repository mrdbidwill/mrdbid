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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilAppearance newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilAppearance newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilAppearance query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilAppearance whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilAppearance whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilAppearance whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilAppearance whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilAppearance whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilAppearance whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilAppearance whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartialInnerVeilAppearance whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class PartialInnerVeilAppearance extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
