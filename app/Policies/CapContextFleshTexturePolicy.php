<?php

namespace App\Policies;

use App\Models\CapContextFleshTexture;
use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class CapContextFleshTexturePolicy
{
    use HandlesAuthorization;

    public function viewAny(User $user): bool
    {

    }

    public function view(User $user, CapContextFleshTexture $capContextFleshTexture): bool
    {
    }

    public function create(User $user): bool
    {
    }

    public function update(User $user, CapContextFleshTexture $capContextFleshTexture): bool
    {
    }

    public function delete(User $user, CapContextFleshTexture $capContextFleshTexture): bool
    {
    }

    public function restore(User $user, CapContextFleshTexture $capContextFleshTexture): bool
    {
    }

    public function forceDelete(User $user, CapContextFleshTexture $capContextFleshTexture): bool
    {
    }
}
