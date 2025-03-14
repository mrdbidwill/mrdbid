<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id
 * @property string $title
 * @property string $author
 * @property string|null $ref
 * @property string|null $item_code
 * @property int|null $type
 * @property string|null $comment
 * @property int|null $my_rating
 * @property string|null $my_comment
 * @property int $entered_by
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 *
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DataSource newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DataSource newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DataSource query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DataSource whereAuthor($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DataSource whereComment($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DataSource whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DataSource whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DataSource whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DataSource whereItemCode($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DataSource whereMyComment($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DataSource whereMyRating($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DataSource whereRef($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DataSource whereTitle($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DataSource whereType($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DataSource whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class DataSource extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'author',
        'ref',
        'item_code',
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
