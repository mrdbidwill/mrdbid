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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ChemReaction newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ChemReaction newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ChemReaction query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ChemReaction whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ChemReaction whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ChemReaction whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ChemReaction whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ChemReaction whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ChemReaction whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ChemReaction whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|ChemReaction whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class ChemReaction extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
