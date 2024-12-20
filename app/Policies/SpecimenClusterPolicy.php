<?php

namespace App\Policies;

use App\Models\SpecimenGroup;
use App\Models\User;

class SpecimenClusterPolicy
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
    public function view(User $user, SpecimenGroup $specimen_group): void
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
    public function edit(User $user, SpecimenGroup $specimen_group): bool
    {
        return $specimen_group->member_id === $user->id;   // Only the user who created the specimen_group can edit it
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, SpecimenGroup $specimen_group): bool
    {
        return $specimen_group->member_id === $user->id;   // Only the user who created the specimen_group can update it
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, SpecimenGroup $specimen_group): bool
    {
        return $specimen_group->member_id === $user->id;   // Only the user who created the specimen_group can delete it
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, SpecimenGroup $specimen_group): void
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, SpecimenGroup $specimen_group): void
    {
        //
    }
}
