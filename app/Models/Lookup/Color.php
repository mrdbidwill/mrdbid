<?php

namespace App\Models\Lookup;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id
 * @property string $latin_name
 * @property string $common_name
 * @property int $color_group
 * @property string $hex
 * @property int $sequence
 * @property int $r_val
 * @property int $g_val
 * @property int $b_val
 * @property string $closest_websafe_color
 * @property int $cwc_r
 * @property int $cwc_g
 * @property int $cwc_b
 * @property string $image_file
 * @property int $entered_by
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 *
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Color newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Color newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Color query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Color whereBVal($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Color whereClosestWebsafeColor($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Color whereColorGroup($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Color whereCommonName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Color whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Color whereCwcB($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Color whereCwcG($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Color whereCwcR($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Color whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Color whereGVal($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Color whereHex($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Color whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Color whereImageFile($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Color whereLatinName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Color whereRVal($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Color whereSequence($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Color whereUpdatedAt($value)
 *
 * @mixin \Eloquent
 */
class Color extends Model
{
    use HasFactory;
}
