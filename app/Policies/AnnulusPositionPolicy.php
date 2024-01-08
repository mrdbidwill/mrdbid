<?php

namespace App\Policies;

use App\Models\AnnulusPosition;
use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class AnnulusPositionPolicy
{
    use HandlesAuthorization;

    public function viewAny(User $user): bool
    {

    }

    public function view(User $user, AnnulusPosition $annulusPosition): bool
    {
    }

    public function create(User $user): bool
    {
    }

    public function update(User $user, AnnulusPosition $annulusPosition): bool
    {
    }

    public function delete(User $user, AnnulusPosition $annulusPosition): bool
    {
    }

    public function restore(User $user, AnnulusPosition $annulusPosition): bool
    {
    }

    public function forceDelete(User $user, AnnulusPosition $annulusPosition): bool
    {
    }
}
