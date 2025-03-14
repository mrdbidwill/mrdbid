<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @method static \Illuminate\Database\Eloquent\Builder<static>|MBList newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|MBList newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|MBList query()
 *
 * @mixin \Eloquent
 */
class MBList extends Model
{
    use HasFactory;

    // Define your table name if it's different from the default conventions
    protected $table = 'mblist';

    // Define fillable properties
    protected $fillable = [
        'column1',
        'column2',
        // etc.
    ];
}
