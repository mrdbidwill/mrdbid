<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DataSource extends Model
{
    protected $fillable = [
        'title',
        'author',
        'type',
        'comment',
        'my_rating',
        'my_comment',
        'entered_by',
    ];
}
