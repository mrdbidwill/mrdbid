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

    public function getSpecimenName(): string
    {
        return $this->specimen_name;
    }

    public function setSpecimenName(string $specimen_name): void
    {
        $this->specimen_name = $specimen_name;
    }

    public function getCommonName(): string
    {
        return $this->common_name;
    }

    public function setCommonName(string $common_name): void
    {
        $this->common_name = $common_name;
    }

    public function getDescription(): string
    {
        return $this->description;
    }

    public function setDescription(string $description): void
    {
        $this->description = $description;
    }

    public function getComment(): string
    {
        return $this->comment;
    }

    public function setComment(string $comment): void
    {
        $this->comment = $comment;
    }

    public function getSpecimenLocationNow(): int
    {
        return $this->specimen_location_now;
    }

    public function setSpecimenLocationNow(int $specimen_location_now): void
    {
        $this->specimen_location_now = $specimen_location_now;
    }

    public function getLocationFoundCity(): string
    {
        return $this->location_found_city;
    }

    public function setLocationFoundCity(string $location_found_city): void
    {
        $this->location_found_city = $location_found_city;
    }

    public function getLocationFoundCounty(): string
    {
        return $this->location_found_county;
    }

    public function setLocationFoundCounty(string $location_found_county): void
    {
        $this->location_found_county = $location_found_county;
    }

    public function getState(): int
    {
        return $this->state;
    }

    public function setState(int $state): void
    {
        $this->state = $state;
    }

    public function getCountry(): int
    {
        return $this->country;
    }

    public function setCountry(int $country): void
    {
        $this->country = $country;
    }

    public function getLocationPublicYN(): int
    {
        return $this->location_public_y_n;
    }

    public function setLocationPublicYN(int $location_public_y_n): void
    {
        $this->location_public_y_n = $location_public_y_n;
    }

    public function getShareDataYN(): int
    {
        return $this->share_data_y_n;
    }

    public function setShareDataYN(int $share_data_y_n): void
    {
        $this->share_data_y_n = $share_data_y_n;
    }

    public function getMonthFound(): int
    {
        return $this->month_found;
    }

    public function setMonthFound(int $month_found): void
    {
        $this->month_found = $month_found;
    }

    public function getDayFound(): int
    {
        return $this->day_found;
    }

    public function setDayFound(int $day_found): void
    {
        $this->day_found = $day_found;
    }

    public function getYearFound(): int
    {
        return $this->year_found;
    }

    public function setYearFound(int $year_found): void
    {
        $this->year_found = $year_found;
    }

    public function getFungusType(): int
    {
        return $this->fungus_type;
    }

    public function setFungusType(int $fungus_type): void
    {
        $this->fungus_type = $fungus_type;
    }

    public function getEnteredBy(): int
    {
        return $this->entered_by;
    }

    public function setEnteredBy(int $entered_by): void
    {
        $this->entered_by = $entered_by;
    }

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
}
