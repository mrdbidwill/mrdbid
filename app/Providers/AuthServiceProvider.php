<?php

namespace App\Providers;

use App\Models\Article;
use App\Models\Cluster;
use App\Models\Group;
use App\Models\ImageSpecimen;
use App\Policies\ArticlePolicy;
use App\Policies\ImageSpecimenPolicy;
use App\Policies\SpecimenClusterPolicy;
use App\Policies\SpecimenGroupPolicy;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        ImageSpecimen::class => ImageSpecimenPolicy::class,
        Article::class => ArticlePolicy::class,
        Group::class => SpecimenGroupPolicy::class,
        Cluster::class => SpecimenClusterPolicy::class,
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        Gate::define('manage-mblist', function ($user) {
            return $user->role === 'admin';
        });

        //
    }
}
