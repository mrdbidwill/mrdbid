<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id
 * @property string $name
 * @property int $display_options
 * @property int $look_up_y_n
 * @property int $parts
 * @property int $source
 * @property int $entered_by
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \App\Models\Specimen|null $specimen
 *
 * @method static \Illuminate\Database\Eloquent\Builder<static>|MrCharacter newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|MrCharacter newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|MrCharacter query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|MrCharacter whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|MrCharacter whereDisplayOptions($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|MrCharacter whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|MrCharacter whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|MrCharacter whereLookUpYN($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|MrCharacter whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|MrCharacter whereParts($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|MrCharacter whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|MrCharacter whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class MrCharacter extends Model
{
    protected $table = 'mr_characters';

    protected $fillable = [
        'name',
        'display_options',
        'look_up_y_n',
        'parts',
        'source',
        'entered_by',
    ];

    public function specimen()
    {
        return $this->belongsTo(Specimen::class);
    }
}
