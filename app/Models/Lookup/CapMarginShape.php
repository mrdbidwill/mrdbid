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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapMarginShape newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapMarginShape newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapMarginShape query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapMarginShape whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapMarginShape whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapMarginShape whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapMarginShape whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapMarginShape whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapMarginShape whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapMarginShape whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapMarginShape whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class CapMarginShape extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
