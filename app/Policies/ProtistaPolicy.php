<?php

namespace App\Policies;

use App\Models\Protista;
use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class ProtistaPolicy
{
    use HandlesAuthorization;

    public function viewAny(User $user): bool
    {

    }

    public function view(User $user, Protista $protista): bool
    {
    }

    public function create(User $user): bool
    {
    }

    public function update(User $user, Protista $protista): bool
    {
    }

    public function delete(User $user, Protista $protista): bool
    {
    }

    public function restore(User $user, Protista $protista): bool
    {
    }

    public function forceDelete(User $user, Protista $protista): bool
    {
    }
}
