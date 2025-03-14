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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillAttachment newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillAttachment newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillAttachment query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillAttachment whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillAttachment whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillAttachment whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillAttachment whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillAttachment whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillAttachment whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillAttachment whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillAttachment whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class GillAttachment extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
