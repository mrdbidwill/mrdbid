<?php

namespace App\Providers;

// use Illuminate\Support\Facades\Gate;
use App\Models\Animalia;
use App\Models\AnnulusPosition;
use App\Models\CapContextFleshTexture;
use App\Models\Country;
use App\Models\Specimen;
use App\Models\SpecimenCluster;
use App\Models\SpecimenGroup;
use App\Models\State;
use App\Policies\AnimaliaPolicy;
use App\Policies\AnnulusPositionPolicy;
use App\Policies\CapContextFleshTexturePolicy;
use App\Policies\CountryPolicy;
use App\Policies\SpecimenClusterPolicy;
use App\Policies\SpecimenGroupPolicy;
use App\Policies\SpecimenPolicy;
use App\Policies\StatePolicy;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The model to policy mappings for the application.
     *
     * @var array<class-string, class-string>
     */
    protected $policies = [
        //
        Animalia::class => AnimaliaPolicy::class,
        AnnulusPosition::class => AnnulusPositionPolicy::class,
        CapContextFleshTexture::class => CapContextFleshTexturePolicy::class,
        Specimen::class => SpecimenPolicy::class,
        Country::class => CountryPolicy::class,
        State::class => StatePolicy::class,
        SpecimenCluster::class => SpecimenClusterPolicy::class,
        SpecimenGroup::class => SpecimenGroupPolicy::class,
    ];

    /**
     * Register any authentication / authorization services.
     */
    public function boot(): void
    {
        //
    }
}
