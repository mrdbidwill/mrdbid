<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id
 * @property string $name
 * @property string $synonym_with
 * @property string $comments
 * @property int $source
 * @property int $entered_by
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 *
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Synonym newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Synonym newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Synonym query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Synonym whereComments($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Synonym whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Synonym whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Synonym whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Synonym whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Synonym whereSource($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Synonym whereSynonymWith($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Synonym whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class Synonym extends Model
{
    use HasFactory;
}
