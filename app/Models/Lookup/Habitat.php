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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Habitat newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Habitat newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Habitat query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Habitat whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Habitat whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Habitat whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Habitat whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Habitat whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Habitat whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Habitat whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Habitat whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class Habitat extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
