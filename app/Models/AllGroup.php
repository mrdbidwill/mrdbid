<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id
 * @property string $name
 * @property string|null $description
 * @property int $created_by
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \App\Models\Specimen> $specimens
 * @property-read int|null $specimens_count
 *
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AllGroup newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AllGroup newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AllGroup query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AllGroup whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AllGroup whereCreatedBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AllGroup whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AllGroup whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AllGroup whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AllGroup whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class AllGroup extends Model
{
    protected $fillable = ['name', 'description', 'created_by'];

    // Relationship with specimens through the pivot table
    public function specimens()
    {
        return $this->belongsToMany(Specimen::class, 'group_specimens')
            ->withPivot('user_id', 'created_at', 'updated_at');
    }
}
