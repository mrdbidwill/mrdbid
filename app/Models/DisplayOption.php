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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DisplayOption newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DisplayOption newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DisplayOption query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DisplayOption whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DisplayOption whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DisplayOption whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DisplayOption whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DisplayOption whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DisplayOption whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DisplayOption whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DisplayOption whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class DisplayOption extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
