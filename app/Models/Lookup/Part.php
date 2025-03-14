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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Part newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Part newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Part query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Part whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Part whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Part whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Part whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Part whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Part whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Part whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Part whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class Part extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
