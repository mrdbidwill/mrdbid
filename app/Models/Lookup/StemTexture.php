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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemTexture newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemTexture newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemTexture query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemTexture whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemTexture whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemTexture whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemTexture whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemTexture whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemTexture whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemTexture whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|StemTexture whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class StemTexture extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
