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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Abundance newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Abundance newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Abundance query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Abundance whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Abundance whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Abundance whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Abundance whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Abundance whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Abundance whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Abundance whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Abundance whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class Abundance extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
