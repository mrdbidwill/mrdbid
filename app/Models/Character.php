<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Character extends Model
{
    protected $table = 'characters';

    protected $fillable = [
        'id',
        'name',
        'display_options',
        'look_up_y_n',
        'parts',
        'source',
        'entered_by',
    ];

    public function specimen()
    {
        return $this->belongsTo(Specimen::class);
    }
}
