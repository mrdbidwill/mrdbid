<?php

namespace App\Policies;

use App\Models\Article;
use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class ArticlePolicy
{
    use HandlesAuthorization;

    public function create(User $user)
    {
        // return $user->member_type < 7;  // let anyone who has registered create article
    }

    public function update(User $user, Article $article)
    {
        return $user->id == $article->user_id;  // same here - removed && $user->type < 7
    }

    public function delete(User $user, Article $article)
    {
        return $user->id == $article->user_id;  // same here - removed && $user->type < 7
    }
}
