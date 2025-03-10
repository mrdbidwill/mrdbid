<?php

namespace App\Policies;

use App\Models\AllGroup;
use App\Models\User;

class SpecimenAllGroupPolicy
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
    public function view(User $user, AllGroup $specimen_group): void
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
    public function edit(User $user, AllGroup $specimen_all_group): bool
    {
        dd($specimen_all_group);

        return $specimen_all_group->created_by === $user->id;   // Only the user who created the group can edit it
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, AllGroup $specimen_group): bool
    {
        return $specimen_group->created_by === $user->id;   // Only the user who created the group can update it
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, AllGroup $specimen_group): bool
    {
        return $specimen_group->created_by === $user->id;   // Only the user who created the group can delete it
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, AllGroup $specimen_group): void
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, AllGroup $specimen_group): void
    {
        //
    }
}
