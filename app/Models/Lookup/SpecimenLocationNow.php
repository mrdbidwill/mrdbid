<?php

namespace App\Models\Lookup;

use Illuminate\Database\Eloquent\Model;

class SpecimenLocationNow extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}