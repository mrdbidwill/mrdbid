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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Odor newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Odor newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Odor query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Odor whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Odor whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Odor whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Odor whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Odor whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Odor whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Odor whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Odor whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class Odor extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
