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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Veil newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Veil newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Veil query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Veil whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Veil whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Veil whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Veil whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Veil whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Veil whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Veil whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Veil whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class Veil extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
