<?php

namespace App\Models;

use App\Events\SpecimenCreated;
use App\Models\Lookup\Character;
use App\Models\Lookup\Country;
use App\Models\Lookup\State;
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
        'state_id',
        'country_id',
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

    public function images_specimens(): HasMany
    {
        return $this->hasMany(ImageSpecimen::class, 'specimen_id');
    }

    // Relationship with groups
    public function groups()
    {
        return $this->belongsToMany(Group::class, 'group_specimens');
    }

    // Relationship with clusters
    public function clusters()
    {
        return $this->belongsToMany(Cluster::class, 'cluster_specimens');
    }

    public function characterSpecimens(): HasMany
    {
        return $this->hasMany(CharacterSpecimen::class);
    }

    public function country()    // The `with` method expects relationships defined in the model, not column names
    {
        return $this->belongsTo(Country::class);
    }

    public function state()
    {
        return $this->belongsTo(State::class);
    }
}
