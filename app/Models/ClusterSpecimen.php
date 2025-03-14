<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id
 * @property int $cluster_id
 * @property int $specimen_id
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \App\Models\Cluster $cluster
 *
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ClusterSpecimen newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ClusterSpecimen newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ClusterSpecimen query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ClusterSpecimen whereClusterId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ClusterSpecimen whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ClusterSpecimen whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ClusterSpecimen whereSpecimenId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ClusterSpecimen whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class ClusterSpecimen extends Model
{
    use HasFactory;

    protected $fillable = [
        'cluster_id',
        'specimen_id',
    ];

    public function cluster()
    {
        return $this->belongsTo(Cluster::class, 'cluster_id');
    }
}
