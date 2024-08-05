<?php

namespace App\Policies;

use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class AdminSpecimenPolicy
{
    use HandlesAuthorization;

    public function action(User $user): bool
    {
        // only owner or admin user type can access
        return $user->type === 1 || $user->type === 2 || $user->type === 3;  // Only owner or admin character_editor

        // return $user->type === 2;   // Only owner or admin
    }
}
