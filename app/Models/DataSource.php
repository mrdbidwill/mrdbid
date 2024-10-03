<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DataSource extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'author',
        'type',
        'comment',
        'my_rating',
        'my_comment',
        'entered_by',
    ];

    // Define a static method to get books by type
    public static function booksOfType($type)
    {
        return self::where('type', $type)->get();
    }
}
