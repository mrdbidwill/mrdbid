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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapSurfaceTexture newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapSurfaceTexture newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapSurfaceTexture query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapSurfaceTexture whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapSurfaceTexture whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapSurfaceTexture whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapSurfaceTexture whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapSurfaceTexture whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapSurfaceTexture whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapSurfaceTexture whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|CapSurfaceTexture whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class CapSurfaceTexture extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
