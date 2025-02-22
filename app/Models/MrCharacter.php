<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MrCharacter extends Model
{
    protected $table = 'mr_characters';

    protected $fillable = [
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
