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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillEdge newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillEdge newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillEdge query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillEdge whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillEdge whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillEdge whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillEdge whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillEdge whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillEdge whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillEdge whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillEdge whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class GillEdge extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
