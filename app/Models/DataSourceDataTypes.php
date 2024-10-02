<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DataSourceDataTypes extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
