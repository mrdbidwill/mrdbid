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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Taste newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Taste newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Taste query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Taste whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Taste whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Taste whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Taste whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Taste whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Taste whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Taste whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Taste whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class Taste extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
