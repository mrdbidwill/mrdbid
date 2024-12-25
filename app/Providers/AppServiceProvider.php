<?php

namespace App\Providers;

use App\Models\Article;
use App\Models\Cluster;
use App\Models\DataSource;
use App\Models\Group;
use App\Models\Specimen;
use App\Models\User;
use App\Policies\ArticlePolicy;
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
        Article::class => ArticlePolicy::class,
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
                    return redirect()->route('specimens.index');
                });
            });

        Gate::define('edit-specimen', function (User $user, Specimen $specimen) {
            return $user->id === $specimen->user_id;
        });

        Gate::define('edit-group', function (User $user, Group $specimen_group) {
            return $user->id === $specimen_group->member_id;
        });

        Gate::define('edit-cluster', function (User $user, Cluster $specimen_cluster) {
            return $user->id === $specimen_cluster->member_id;
        });

        Gate::define('delete-specimen', function (User $user, Specimen $specimen) {
            return $user->id === $specimen->user_id;
        });

        Model::preventsLazyLoading();

    }
}
