<?php

namespace App\Models;

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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PossibleMatch newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PossibleMatch newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PossibleMatch query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PossibleMatch whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PossibleMatch whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PossibleMatch whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PossibleMatch whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PossibleMatch whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PossibleMatch whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PossibleMatch whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PossibleMatch whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class PossibleMatch extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
