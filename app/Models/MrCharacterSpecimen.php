<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MrCharacterSpecimen extends Model
{
    use HasFactory;

    protected $table = 'mr_character_specimens';

    protected $fillable = [
        'id',
        'character_id',
        'specimen_id',
        'character_value',
        'entered_by',
    ];

    public function specimen()
    {
        return $this->belongsTo(Specimen::class);
    }
}
