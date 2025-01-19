<?php

namespace App\Models\Lookup;

use Illuminate\Database\Eloquent\Model;

class Taste extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
