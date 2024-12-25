<?php

namespace App\Policies;

use App\Models\Cluster;
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
    public function view(User $user, Cluster $specimen_cluster): void
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
    public function edit(User $user, Cluster $specimen_cluster): bool
    {
        return $specimen_cluster->member_id === $user->id;   // Only the user who created the specimen_cluster can edit it
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, Cluster $specimen_cluster): bool
    {
        return $specimen_cluster->member_id === $user->id;   // Only the user who created the specimen_cluster can update it
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, Cluster $specimen_cluster): bool
    {
        return $specimen_cluster->member_id === $user->id;   // Only the user who created the specimen_cluster can delete it
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, Cluster $specimen_cluster): void
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, Cluster $specimen_cluster): void
    {
        //
    }
}
