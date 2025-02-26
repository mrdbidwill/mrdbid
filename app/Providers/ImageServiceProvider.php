<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Intervention\Image\Drivers\Gd\Driver as GdDriver;
use Intervention\Image\Drivers\Imagick\Driver as ImagickDriver;
use Intervention\Image\ImageManager;

class ImageServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        $this->app->singleton(ImageManager::class, function () {
            $driver = extension_loaded('imagick')
                ? new ImagickDriver
                : new GdDriver;

            return new ImageManager($driver);
        });
    }

    public function boot(): void
    {
        // Any additional configuration
    }
}
