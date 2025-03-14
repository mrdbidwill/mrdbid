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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|SoilType newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|SoilType newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|SoilType query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|SoilType whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|SoilType whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|SoilType whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|SoilType whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|SoilType whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|SoilType whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|SoilType whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|SoilType whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class SoilType extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
