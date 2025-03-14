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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillBreadth newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillBreadth newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillBreadth query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillBreadth whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillBreadth whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillBreadth whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillBreadth whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillBreadth whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillBreadth whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillBreadth whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|GillBreadth whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class GillBreadth extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
