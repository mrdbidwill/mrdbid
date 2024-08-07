<?php

namespace App\Policies;

use App\Models\ImagesSpecimen;
use App\Models\Specimen;

class ImagesSpecimenPolicy
{
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
    public function view(Specimen $specimen, ImagesSpecimen $image): void
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
    public function edit(Specimen $specimen, ImagesSpecimen $image): bool
    {
        return $image->specimen_id === $specimen->id;   // Only the specimen this image belongs to can edit it
    }

    /**
     * Determine whether the specimen can update the model.
     */
    public function update(Specimen $specimen, ImagesSpecimen $image): void
    {
        //
    }

    /**
     * Determine whether the specimen can delete the model.
     */
    public function delete(Specimen $specimen, ImagesSpecimen $image): void
    {
        //
    }

    /**
     * Determine whether the specimen can restore the model.
     */
    public function restore(Specimen $specimen, ImagesSpecimen $image): void
    {
        //
    }

    /**
     * Determine whether the specimen can permanently delete the model.
     */
    public function forceDelete(Specimen $specimen, ImagesSpecimen $image): void
    {
        //
    }
}
