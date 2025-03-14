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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillSpacing newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillSpacing newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillSpacing query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillSpacing whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillSpacing whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillSpacing whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillSpacing whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillSpacing whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillSpacing whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillSpacing whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillSpacing whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class GillSpacing extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
