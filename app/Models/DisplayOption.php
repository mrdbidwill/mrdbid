<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DisplayOption extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
