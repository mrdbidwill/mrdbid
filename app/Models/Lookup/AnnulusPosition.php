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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AnnulusPosition newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AnnulusPosition newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AnnulusPosition query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AnnulusPosition whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AnnulusPosition whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AnnulusPosition whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AnnulusPosition whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AnnulusPosition whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AnnulusPosition whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AnnulusPosition whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AnnulusPosition whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class AnnulusPosition extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
