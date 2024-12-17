<?php

namespace App\Policies;

use App\Models\ImageSpecimen;
use App\Models\Specimen;
use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class ImageSpecimenPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the specimen can view any models.
     */
    public function viewAny(Specimen $specimen): void
    {
        //
    }

    /**
     * Determine whether the specimen can view the model.
     */
    public function view(Specimen $specimen, ImageSpecimen $image): void
    {
        //
    }

    /**
     * Determine whether the specimen can create models.
     */
    public function create(Specimen $specimen): void
    {
        //
    }

    /**
     * Determine whether the specimen can edit the model.
     */
    public function edit(Specimen $specimen, ImageSpecimen $image): void {}

    /**
     * Determine whether the specimen can update the model.
     */
    public function update(Specimen $specimen, ImageSpecimen $image): void
    {
        //
    }

    /**
     * Determine whether the specimen can delete the model.
     */
    /**
     * Determine if the given image can be deleted by the user.
     */
    public function delete(User $user, ImageSpecimen $imageSpecimen)
    {
        return $user->id === $imageSpecimen->entered_by;
    }

    /**
     * Determine whether the specimen can restore the model.
     */
    public function restore(Specimen $specimen, ImageSpecimen $image): void
    {
        //
    }

    /**
     * Determine whether the specimen can permanently delete the model.
     */
    public function forceDelete(Specimen $specimen, ImageSpecimen $image): void
    {
        //
    }
}
