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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapMarginType newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapMarginType newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapMarginType query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapMarginType whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapMarginType whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapMarginType whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapMarginType whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapMarginType whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapMarginType whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapMarginType whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapMarginType whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class CapMarginType extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
