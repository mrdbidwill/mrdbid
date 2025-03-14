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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Epithet newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Epithet newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Epithet query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Epithet whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Epithet whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Epithet whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Epithet whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Epithet whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Epithet whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Epithet whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Epithet whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class Epithet extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
