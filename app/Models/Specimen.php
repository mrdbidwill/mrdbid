<?php

namespace App\Models;

use App\Events\SpecimenCreated;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Specimen extends Model
{
    use HasFactory;

    public string $specimen_name;

    public string $common_name;

    public string $description;

    public string $comment;

    public int $specimen_location_now;

    public string $location_found_city;

    public string $location_found_county;

    public int $state;

    public int $country;

    public int $location_public_y_n;

    public int $share_data_y_n;

    public int $month_found;

    public int $day_found;

    public int $year_found;

    public int $fungus_type;

    public int $entered_by;

    protected $fillable = [
        'user_id',
        'specimen_name',
        'common_name',
        'description',
        'comment',
        'specimen_location_now',
        'location_found_city',
        'location_found_county',
        'state',
        'country',
        'location_public_y_n',
        'share_data_y_n',
        'month_found',
        'day_found',
        'year_found',
        'fungus_type',
        'entered_by',
    ];

    protected $dispatchesEvents = [
        'created' => SpecimenCreated::class,

    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function characters(): HasMany
    {
        return $this->hasMany(Character::class);
    }

    public function images(): HasMany
    {
        return $this->hasMany(Image::class);
    }
}
