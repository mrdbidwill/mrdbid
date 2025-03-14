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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemLocation newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemLocation newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemLocation query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemLocation whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemLocation whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemLocation whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemLocation whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemLocation whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemLocation whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemLocation whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemLocation whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class StemLocation extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
