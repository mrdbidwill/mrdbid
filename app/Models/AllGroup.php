<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

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
