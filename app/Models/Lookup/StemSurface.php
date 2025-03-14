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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemSurface newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemSurface newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemSurface query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemSurface whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemSurface whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemSurface whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemSurface whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemSurface whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemSurface whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemSurface whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemSurface whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class StemSurface extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
