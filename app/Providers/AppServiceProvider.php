<?php

namespace App\Providers;

use App\Models\DataSource;
use App\Models\Specimen;
use App\Models\User;
use App\Policies\BookPolicy;
use App\Repositories\Lookup\CharacterRepository;
use App\Services\Lookup\CharacterService;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Route;

class AppServiceProvider extends ServiceProvider
{
    protected string $namespace = 'App\Http\Controllers';

    protected $policies = [
        DataSource::class => BookPolicy::class,
    ];

    /**
     * Register any application services.
     */
    public function register(): void
    {
        $this->app->singleton(CharacterService::class, function ($app) {
            return new CharacterService(characterRepository: new CharacterRepository);
        });

    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        $this->registerPolicies();

        Route::middleware('web')
            ->namespace($this->namespace)
            ->group(function () {
                require base_path('routes/web.php');

                Route::get('/specimens/', function () {
                    return redirect()->route('specimens.dashboard');
                });
            });

        Gate::define('edit-specimen', function (User $user, Specimen $specimen) {
            return $user->id === $specimen->user_id;
        });

        Gate::define('delete-specimen', function (User $user, Specimen $specimen) {
            return $user->id === $specimen->user_id;
        });

        Model::preventsLazyLoading();

    }
}
