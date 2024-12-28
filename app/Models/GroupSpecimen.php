<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GroupSpecimen extends Model
{
    use HasFactory;

    protected $fillable = [
        'group_id',
        'specimen_id',
    ];

    public function group()
    {
        return $this->belongsTo(Group::class, 'group_id');
    }
}
