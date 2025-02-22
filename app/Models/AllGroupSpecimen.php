<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AllGroupSpecimen extends Model
{
    use HasFactory;

    protected $fillable = [
        'group_id',
        'specimen_id',
    ];

    public function all_group()
    {
        return $this->belongsTo(AllGroup::class, 'group_id');
    }
}
