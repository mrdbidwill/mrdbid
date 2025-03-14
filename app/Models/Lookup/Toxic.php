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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Toxic newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Toxic newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Toxic query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Toxic whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Toxic whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Toxic whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Toxic whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Toxic whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Toxic whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Toxic whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Toxic whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class Toxic extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
