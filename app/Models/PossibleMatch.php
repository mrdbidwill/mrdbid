<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PossibleMatch extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
