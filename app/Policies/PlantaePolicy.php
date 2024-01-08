<?php

namespace App\Policies;

use App\Models\Plantae;
use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class PlantaePolicy
{
    use HandlesAuthorization;

    public function viewAny(User $user): bool
    {

    }

    public function view(User $user, Plantae $plantae): bool
    {
    }

    public function create(User $user): bool
    {
    }

    public function update(User $user, Plantae $plantae): bool
    {
    }

    public function delete(User $user, Plantae $plantae): bool
    {
    }

    public function restore(User $user, Plantae $plantae): bool
    {
    }

    public function forceDelete(User $user, Plantae $plantae): bool
    {
    }
}
