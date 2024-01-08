<?php

namespace App\Policies;

use App\Models\SpecimenCluster;
use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class SpecimenClusterPolicy
{
    use HandlesAuthorization;

    public function viewAny(User $user): bool
    {

    }

    public function view(User $user, SpecimenCluster $specimenCluster): bool
    {
    }

    public function create(User $user): bool
    {
    }

    public function update(User $user, SpecimenCluster $specimenCluster): bool
    {
    }

    public function delete(User $user, SpecimenCluster $specimenCluster): bool
    {
    }

    public function restore(User $user, SpecimenCluster $specimenCluster): bool
    {
    }

    public function forceDelete(User $user, SpecimenCluster $specimenCluster): bool
    {
    }
}
