<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id
 * @property int $all_group_id
 * @property int $specimen_id
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \App\Models\AllGroup|null $all_group
 *
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AllGroupSpecimen newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AllGroupSpecimen newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AllGroupSpecimen query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AllGroupSpecimen whereAllGroupId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AllGroupSpecimen whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AllGroupSpecimen whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AllGroupSpecimen whereSpecimenId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|AllGroupSpecimen whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class AllGroupSpecimen extends Model
{
    use HasFactory;

    protected $fillable = [
        'group_id',
        'specimen_id',
    ];

    public function all_group()
    {
        return $this->belongsTo(AllGroup::class, 'group_id');
    }
}
