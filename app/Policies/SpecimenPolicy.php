<?php

namespace App\Policies;

use App\Models\Specimen;
use App\Models\User;

class SpecimenPolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): void
    {
        //
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, Specimen $specimen): void
    {
        //
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): void
    {
        //
    }

    /**
     * Determine whether the user can edit the model.
     */
    public function edit(User $user, Specimen $specimen): bool
    {
        return $specimen->user_id === $user->id;   // Only the user who created the specimen can edit it
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, Specimen $specimen): bool
    {
        return $specimen->user_id === $user->id;   // Only the user who created the specimen can update it
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, Specimen $specimen): bool
    {
        return $specimen->user_id === $user->id;   // Only the user who created the specimen can delete it
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, Specimen $specimen): void
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, Specimen $specimen): void
    {
        //
    }

    public function guestView(?User $user)
    {
        return true;
    }
}
