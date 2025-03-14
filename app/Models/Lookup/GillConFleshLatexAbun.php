<?php

namespace App\Models\Lookup;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id
 * @property string $name
 * @property string|null $description
 * @property string|null $comments
 * @property int $source
 * @property int $entered_by
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 *
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillConFleshLatexAbun newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillConFleshLatexAbun newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillConFleshLatexAbun query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillConFleshLatexAbun whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillConFleshLatexAbun whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillConFleshLatexAbun whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillConFleshLatexAbun whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillConFleshLatexAbun whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillConFleshLatexAbun whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillConFleshLatexAbun whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillConFleshLatexAbun whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class GillConFleshLatexAbun extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
