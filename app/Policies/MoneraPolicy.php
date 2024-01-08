<?php

namespace App\Policies;

use App\Models\Monera;
use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class MoneraPolicy
{
    use HandlesAuthorization;

    public function viewAny(User $user): bool
    {

    }

    public function view(User $user, Monera $monera): bool
    {
    }

    public function create(User $user): bool
    {
    }

    public function update(User $user, Monera $monera): bool
    {
    }

    public function delete(User $user, Monera $monera): bool
    {
    }

    public function restore(User $user, Monera $monera): bool
    {
    }

    public function forceDelete(User $user, Monera $monera): bool
    {
    }
}
