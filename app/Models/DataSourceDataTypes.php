<?php

namespace App\Models;

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
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DataSourceDataTypes newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DataSourceDataTypes newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DataSourceDataTypes query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DataSourceDataTypes whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DataSourceDataTypes whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DataSourceDataTypes whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DataSourceDataTypes whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DataSourceDataTypes whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DataSourceDataTypes whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DataSourceDataTypes whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|DataSourceDataTypes whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class DataSourceDataTypes extends Model
{
    protected $fillable = [
        'name',
        'description',
        'comments',
        'source',
        'entered_by',
    ];
}
