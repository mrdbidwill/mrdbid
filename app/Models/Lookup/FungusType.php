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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|FungusType newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|FungusType newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|FungusType query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|FungusType whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|FungusType whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|FungusType whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|FungusType whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|FungusType whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|FungusType whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|FungusType whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|FungusType whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class FungusType extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
