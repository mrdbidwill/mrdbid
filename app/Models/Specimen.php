<?php

namespace App\Models;

use App\Events\SpecimenCreated;
use App\Models\Lookup\Country;
use App\Models\Lookup\State;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

/**
 * @property int $id
 * @property int $user_id
 * @property string $specimen_name
 * @property string $common_name
 * @property string $description
 * @property string $comment
 * @property int $specimen_location_now
 * @property string $location_found_city
 * @property string $location_found_county
 * @property int $state_id
 * @property int $country_id
 * @property int $location_public_y_n
 * @property int $share_data_y_n
 * @property int $month_found
 * @property int $day_found
 * @property int $year_found
 * @property int $fungus_type
 * @property int $entered_by
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \App\Models\AllGroup> $all_groups
 * @property-read int|null $all_groups_count
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \App\Models\MrCharacterSpecimen> $characterSpecimens
 * @property-read int|null $character_specimens_count
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \App\Models\MrCharacter> $characters
 * @property-read int|null $characters_count
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \App\Models\Cluster> $clusters
 * @property-read int|null $clusters_count
 * @property-read Country|null $country
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \App\Models\ImageSpecimen> $images_specimens
 * @property-read int|null $images_specimens_count
 * @property-read State|null $state
 * @property-read \App\Models\User $user
 *
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Specimen newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Specimen newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Specimen query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Specimen whereComment($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Specimen whereCommonName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Specimen whereCountryId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Specimen whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Specimen whereDayFound($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Specimen whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Specimen whereEnteredBy($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Specimen whereFungusType($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Specimen whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Specimen whereLocationFoundCity($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Specimen whereLocationFoundCounty($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Specimen whereLocationPublicYN($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Specimen whereMonthFound($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Specimen whereShareDataYN($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Specimen whereSpecimenLocationNow($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Specimen whereSpecimenName($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Specimen whereStateId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Specimen whereUpdatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Specimen whereUserId($value)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Specimen whereYearFound($value)
 *
 * @mixin \Eloquent
 */
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
        return $this->hasMany(MrCharacter::class);
    }

    public function images_specimens(): HasMany
    {
        return $this->hasMany(ImageSpecimen::class, 'specimen_id');
    }

    // Relationship with all_groups
    public function all_groups()
    {
        return $this->belongsToMany(AllGroup::class, 'all_group_specimens');
    }

    // Relationship with clusters
    public function clusters()
    {
        return $this->belongsToMany(Cluster::class, 'cluster_specimens');
    }

    public function characterSpecimens(): HasMany
    {
        return $this->hasMany(MrCharacterSpecimen::class);
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
