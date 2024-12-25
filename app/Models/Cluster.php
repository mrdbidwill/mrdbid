<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Cluster extends Model
{
    protected $fillable = ['name', 'description', 'created_by'];

    // Relationship with specimens through the pivot table
    public function specimens()
    {
        return $this->belongsToMany(Specimen::class, 'clusters')
            ->withPivot('user_id', 'created_at', 'updated_at');
    }

    // Relationship with the user who created the cluster
    public function creator()
    {
        return $this->belongsTo(User::class, 'created_by');
    }
}
