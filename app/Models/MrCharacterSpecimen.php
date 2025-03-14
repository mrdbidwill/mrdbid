<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id
 * @property int $mr_character_id
 * @property int $specimen_id
 * @property string $character_value
 * @property int $entered_by
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \App\Models\Specimen $specimen
 *
 * @method static \Illuminate\Database\Eloquent\Builder<static>|MrCharacterSpecimen newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|MrCharacterSpecimen newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|MrCharacterSpecimen query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|MrCharacterSpecimen whereCharacterValue($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|MrCharacterSpecimen whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|MrCharacterSpecimen whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|MrCharacterSpecimen whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|MrCharacterSpecimen whereMrCharacterId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|MrCharacterSpecimen whereSpecimenId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|MrCharacterSpecimen whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class MrCharacterSpecimen extends Model
{
    use HasFactory;

    protected $table = 'mr_character_specimens';

    protected $fillable = [
        'id',
        'character_id',
        'specimen_id',
        'character_value',
        'entered_by',
    ];

    public function specimen()
    {
        return $this->belongsTo(Specimen::class);
    }
}
