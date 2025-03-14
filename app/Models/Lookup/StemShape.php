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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemShape newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemShape newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemShape query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemShape whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemShape whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemShape whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemShape whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemShape whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemShape whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemShape whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemShape whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class StemShape extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
