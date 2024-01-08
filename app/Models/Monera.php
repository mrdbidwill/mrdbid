<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Monera extends Model
{
    private $id;

    private $specimen_name;

    private $specimen_owner;

    private $comments;

    private $common_name;

    private $date_month_found;

    private $date_day_found;

    private $date_year_found;

    private $location_found_county;

    private $location_found_city;

    private $state;

    private $country;

    private $annulus_position;

    private $cap_context_flesh_texture;

    private $entered_by;

    private $created_at;

    private $updated_at;

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function annulusPositions()
    {
        return $this->hasOne(AnnulusPosition::class);
    }

    public function capContextFleshTextures()
    {
        return $this->hasOne(CapContextFleshTexture::class);
    }

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param  mixed  $id
     */
    public function setId($id): void
    {
        $this->id = $id;
    }

    /**
     * @return mixed
     */
    public function getSpecimenName()
    {
        return $this->specimen_name;
    }

    /**
     * @param  mixed  $specimen_name
     */
    public function setSpecimenName($specimen_name): void
    {
        $this->specimen_name = $specimen_name;
    }

    /**
     * @return mixed
     */
    public function getSpecimenOwner()
    {
        return $this->specimen_owner;
    }

    /**
     * @param  mixed  $specimen_owner
     */
    public function setSpecimenOwner($specimen_owner): void
    {
        $this->specimen_owner = $specimen_owner;
    }

    /**
     * @return mixed
     */
    public function getComments()
    {
        return $this->comments;
    }

    /**
     * @param  mixed  $comments
     */
    public function setComments($comments): void
    {
        $this->comments = $comments;
    }

    /**
     * @return mixed
     */
    public function getCommonName()
    {
        return $this->common_name;
    }

    /**
     * @param  mixed  $common_name
     */
    public function setCommonName($common_name): void
    {
        $this->common_name = $common_name;
    }

    /**
     * @return mixed
     */
    public function getDateMonthFound()
    {
        return $this->date_month_found;
    }

    /**
     * @param  mixed  $date_month_found
     */
    public function setDateMonthFound($date_month_found): void
    {
        $this->date_month_found = $date_month_found;
    }

    /**
     * @return mixed
     */
    public function getDateDayFound()
    {
        return $this->date_day_found;
    }

    /**
     * @param  mixed  $date_day_found
     */
    public function setDateDayFound($date_day_found): void
    {
        $this->date_day_found = $date_day_found;
    }

    /**
     * @return mixed
     */
    public function getDateYearFound()
    {
        return $this->date_year_found;
    }

    /**
     * @param  mixed  $date_year_found
     */
    public function setDateYearFound($date_year_found): void
    {
        $this->date_year_found = $date_year_found;
    }

    /**
     * @return mixed
     */
    public function getLocationFoundCounty()
    {
        return $this->location_found_county;
    }

    /**
     * @param  mixed  $location_found_county
     */
    public function setLocationFoundCounty($location_found_county): void
    {
        $this->location_found_county = $location_found_county;
    }

    /**
     * @return mixed
     */
    public function getLocationFoundCity()
    {
        return $this->location_found_city;
    }

    /**
     * @param  mixed  $location_found_city
     */
    public function setLocationFoundCity($location_found_city): void
    {
        $this->location_found_city = $location_found_city;
    }

    /**
     * @return mixed
     */
    public function getState()
    {
        return $this->state;
    }

    /**
     * @param  mixed  $state
     */
    public function setState($state): void
    {
        $this->state = $state;
    }

    /**
     * @return mixed
     */
    public function getCountry()
    {
        return $this->country;
    }

    /**
     * @param  mixed  $country
     */
    public function setCountry($country): void
    {
        $this->country = $country;
    }

    public function annulusPosition(): HasOne
    {
        return $this->hasOne(AnnulusPosition::class);
    }

    /**
     * @return mixed
     */
    public function getAnnulusPosition()
    {
        return $this->annulus_position;
    }

    public function setAnnulusPosition($annulus_position): void
    {
        $this->annulus_position = $annulus_position;
    }

    public function capContextFleshTexture()
    {
        return $this->hasOne(CapContextFleshTexture::class);
    }

    /**
     * @return mixed
     */
    public function getCapContextFleshTexture()
    {

        return $this->cap_context_flesh_texture;
    }

    /**
     * @param  mixed  $cap_context_flesh_texture
     */
    public function setCapContextFleshTexture($cap_context_flesh_texture): void
    {
        $this->cap_context_flesh_texture = $cap_context_flesh_texture;
    }

    /**
     * @return mixed
     */
    public function getEnteredBy()
    {
        return $this->entered_by;
    }

    /**
     * @param  mixed  $entered_by
     */
    public function setEnteredBy($entered_by): void
    {
        $this->entered_by = $entered_by;
    }

    /**
     * @return mixed
     */
    public function getCreatedAt()
    {
        return $this->created_at;
    }

    /**
     * @return mixed
     */
    public function getUpdatedAt()
    {
        return $this->updated_at;
    }
}
