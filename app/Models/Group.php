<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Group extends Model
{
    protected $fillable = ['name', 'description', 'created_by'];

    // Relationship with specimens through the pivot table
    public function specimens()
    {
        return $this->belongsToMany(Specimen::class, 'groups')
            ->withPivot('user_id', 'created_at', 'updated_at');
    }

    /**
     * @property int $created_by
     */
    // Relationship with the user who created the group
    public function creator()
    {
        return $this->belongsTo(User::class, 'created_by');
    }
}
