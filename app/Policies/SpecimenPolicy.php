<?php

namespace App\Policies;

use App\Models\Specimen;
use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class SpecimenPolicy
{
    use HandlesAuthorization;

    public function viewAny(User $user): bool
    {

    }

    public function view(User $user, Specimen $specimen): bool
    {
    }

    public function create(User $user): bool
    {
    }

    public function update(User $user, Specimen $specimen): bool
    {
    }

    public function delete(User $user, Specimen $specimen): bool
    {
    }

    public function restore(User $user, Specimen $specimen): bool
    {
    }

    public function forceDelete(User $user, Specimen $specimen): bool
    {
    }
}
