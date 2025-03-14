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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Cluster newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Cluster newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Cluster query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Cluster whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Cluster whereCreatedBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Cluster whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Cluster whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Cluster whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Cluster whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class Cluster extends Model
{
    protected $fillable = ['name', 'description', 'created_by'];

    // Relationship with specimens through the pivot table
    public function specimens()
    {
        return $this->belongsToMany(Specimen::class, 'clusters')
            ->withPivot('user_id', 'created_by', 'created_at', 'updated_at');
    }
}
