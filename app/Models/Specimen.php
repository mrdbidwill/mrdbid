<?php

namespace App\Models;

use App\Events\SpecimenCreated;
use App\Models\Lookup\Character;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Specimen extends Model
{
    use HasFactory;

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

    public function images_specimen(): HasMany
    {
        return $this->hasMany(Specimen::class);
    }

    public function specimen_clusters(): HasMany
    {
        return $this->hasMany(SpecimenCluster::class);
    }

    public function specimen_groups(): HasMany
    {
        return $this->hasMany(SpecimenGroup::class);
    }

    public function characterSpecimens(): HasMany
    {
        return $this->hasMany(CharacterSpecimen::class);
    }
}
