<?php

namespace App\Policies;

use App\Models\DataSource;
use App\Models\User;

class BookPolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        //
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, DataSource $dataSource): bool
    {
        //
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        //
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, DataSource $dataSource): bool
    {
        //
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, DataSource $book): bool
    {
        return $user->type <= 2;   // must be owner or admin
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, DataSource $dataSource): bool
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, DataSource $dataSource): bool
    {
        //
    }
}
