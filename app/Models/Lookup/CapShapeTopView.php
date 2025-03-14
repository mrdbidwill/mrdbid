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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapShapeTopView newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapShapeTopView newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapShapeTopView query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapShapeTopView whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapShapeTopView whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapShapeTopView whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapShapeTopView whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapShapeTopView whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapShapeTopView whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapShapeTopView whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapShapeTopView whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class CapShapeTopView extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
