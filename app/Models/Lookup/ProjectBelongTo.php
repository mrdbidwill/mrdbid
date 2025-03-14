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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ProjectBelongTo newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ProjectBelongTo newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ProjectBelongTo query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ProjectBelongTo whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ProjectBelongTo whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ProjectBelongTo whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ProjectBelongTo whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ProjectBelongTo whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ProjectBelongTo whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ProjectBelongTo whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ProjectBelongTo whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class ProjectBelongTo extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
