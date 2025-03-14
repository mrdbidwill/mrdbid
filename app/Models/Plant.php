<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id
 * @property int $specimen_id
 * @property int $plant_id
 * @property string $comments
 * @property int $source
 * @property int $entered_by
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 *
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Plant newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Plant newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Plant query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Plant whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Plant whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Plant whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Plant whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Plant wherePlantId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Plant whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Plant whereSpecimenId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Plant whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class Plant extends Model
{
    use HasFactory;
}
