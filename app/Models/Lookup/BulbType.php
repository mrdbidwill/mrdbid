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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|BulbType newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|BulbType newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|BulbType query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|BulbType whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|BulbType whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|BulbType whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|BulbType whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|BulbType whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|BulbType whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|BulbType whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|BulbType whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class BulbType extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
