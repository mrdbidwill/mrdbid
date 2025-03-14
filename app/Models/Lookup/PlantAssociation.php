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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PlantAssociation newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PlantAssociation newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PlantAssociation query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PlantAssociation whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PlantAssociation whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PlantAssociation whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PlantAssociation whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PlantAssociation whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PlantAssociation whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PlantAssociation whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|PlantAssociation whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class PlantAssociation extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
