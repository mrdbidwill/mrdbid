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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|SpecimenAge newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|SpecimenAge newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|SpecimenAge query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|SpecimenAge whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|SpecimenAge whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|SpecimenAge whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|SpecimenAge whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|SpecimenAge whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|SpecimenAge whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|SpecimenAge whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|SpecimenAge whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class SpecimenAge extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
