<?php

namespace App\Providers;

use App\Models\Specimen;
use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Gate::define('edit-specimen', function (User $user, Specimen $specimen) {
            return $user->id === $specimen->user_id;
        });

        Gate::define('delete-specimen', function (User $user, Specimen $specimen) {
            return $user->id === $specimen->user_id;
        });

        Model::preventsLazyLoading();

    }
}
