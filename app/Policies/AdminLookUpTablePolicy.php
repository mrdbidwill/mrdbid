<?php

namespace App\Policies;

use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class AdminLookUpTablePolicy
{
    use HandlesAuthorization;

    public function action(User $user): bool
    {
        return $user->hasRole('admin');
    }
}
