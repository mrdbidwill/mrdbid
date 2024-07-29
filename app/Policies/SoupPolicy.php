<?php

namespace App\Policies;

use App\Models\Soup;
use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class SoupPolicy
{
    use HandlesAuthorization;

    public function viewAny(User $user): bool {}

    public function view(User $user, Soup $soup): bool {}

    public function create(User $user): bool {}

    public function update(User $user, Soup $soup): bool {}

    public function delete(User $user, Soup $soup): bool {}

    public function restore(User $user, Soup $soup): bool {}

    public function forceDelete(User $user, Soup $soup): bool {}
}
