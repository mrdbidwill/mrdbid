<?php

namespace App\Models;

use App\Events\SpecimenCreated;
use App\Models\Lookup\Country;
use App\Models\Lookup\State;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Validation\ValidationException;

class Specimen extends Model
{
    use HasFactory;

    protected $fillable = [
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
        'user_id',
    ];

    protected $rules = [
        'specimen_name' => 'required|string|max:255', // Keep regular validation
    ];

    protected $dispatchesEvents = [
        'created' => SpecimenCreated::class,
    ];

    protected static function boot()
    {
        parent::boot();

        // Enforce user-scoped uniqueness using a model-based primitive
        static::saving(function ($specimen) {
            $isDuplicate = Specimen::where('specimen_name', $specimen->specimen_name)
                ->where('user_id', $specimen->user_id)
                ->where('id', '!=', $specimen->id) // Ignore current instance during updates
                ->exists();

            if ($isDuplicate) {
                throw ValidationException::withMessages([
                    'specimen_name' => ['You have used that specimen name already. The specimen name must be unique for your specimens.'],
                ]);
            }
        });
    }

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
