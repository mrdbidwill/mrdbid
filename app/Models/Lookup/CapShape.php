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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapShape newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapShape newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapShape query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapShape whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapShape whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapShape whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapShape whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapShape whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapShape whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapShape whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapShape whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class CapShape extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
