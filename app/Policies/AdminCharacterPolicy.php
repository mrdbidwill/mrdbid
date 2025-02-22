<?php

namespace App\Policies;

use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class AdminCharacterPolicy
{
    use HandlesAuthorization;

    public function action(User $user): bool
    {
        return $user->type === 1 || $user->type === 2 || $user->type === 3;
    }
}
