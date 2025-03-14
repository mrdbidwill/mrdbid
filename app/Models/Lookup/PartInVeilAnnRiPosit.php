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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartInVeilAnnRiPosit newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartInVeilAnnRiPosit newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartInVeilAnnRiPosit query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartInVeilAnnRiPosit whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartInVeilAnnRiPosit whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartInVeilAnnRiPosit whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartInVeilAnnRiPosit whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartInVeilAnnRiPosit whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartInVeilAnnRiPosit whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartInVeilAnnRiPosit whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PartInVeilAnnRiPosit whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class PartInVeilAnnRiPosit extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
