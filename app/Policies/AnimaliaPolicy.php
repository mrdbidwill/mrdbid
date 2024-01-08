<?php

namespace App\Policies;

use App\Models\Animalia;
use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class AnimaliaPolicy
{
    use HandlesAuthorization;

    public function viewAny(User $user): bool
    {

    }

    public function view(User $user, Animalia $animalia): bool
    {
    }

    public function create(User $user): bool
    {
    }

    public function update(User $user, Animalia $animalia): bool
    {
    }

    public function delete(User $user, Animalia $animalia): bool
    {
    }

    public function restore(User $user, Animalia $animalia): bool
    {
    }

    public function forceDelete(User $user, Animalia $animalia): bool
    {
    }
}
