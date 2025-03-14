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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PreservationMethod newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PreservationMethod newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PreservationMethod query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PreservationMethod whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PreservationMethod whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PreservationMethod whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PreservationMethod whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PreservationMethod whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PreservationMethod whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PreservationMethod whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PreservationMethod whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class PreservationMethod extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
