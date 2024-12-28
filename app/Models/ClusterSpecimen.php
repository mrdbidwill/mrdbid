<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

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
