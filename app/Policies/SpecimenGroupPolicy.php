<?php

namespace App\Policies;

use App\Models\SpecimenGroup;
use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class SpecimenGroupPolicy
{
    use HandlesAuthorization;

    public function viewAny(User $user): bool
    {

    }

    public function view(User $user, SpecimenGroup $specimenGroup): bool
    {
    }

    public function create(User $user): bool
    {
    }

    public function update(User $user, SpecimenGroup $specimenGroup): bool
    {
    }

    public function delete(User $user, SpecimenGroup $specimenGroup): bool
    {
    }

    public function restore(User $user, SpecimenGroup $specimenGroup): bool
    {
    }

    public function forceDelete(User $user, SpecimenGroup $specimenGroup): bool
    {
    }
}
