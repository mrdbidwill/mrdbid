<?php

namespace App\Repositories\Lookup;

use App\Models\Lookup\Color;
use Illuminate\Support\Facades\Cache;

class ColorRepository
{
    protected string $color;

    // Constructor to inject the MrCharacter model
    public function __construct(Color $color)
    {
        $this->color = $color;
    }

    public function getAll()
    {
        return $this->color->all(); // Call the `all()` method
    }

    /**
     * Get all colors with caching.
     *
     * @return \Illuminate\Support\Collection
     */
    public function getAllColors()
    {
        return Cache::remember('colors.all', 60 * 60 * 24, function () {
            // Cache for 24 hours
            return Color::all();
        });
    }

    /**  To clear the cache manually (e.g., if colors are ever modified via an admin panel or migration),
     * you can add logic to clear the cache when needed:
     */
    public function clearCache()
    {
        Cache::forget('colors.all');
    }

    /**
     * Get a color by ID.
     *
     * @return Color|null
     */
    public function getColorById(int $id)
    {
        return Cache::remember("colors.{$id}", 60 * 60 * 24, function () use ($id) {
            // Cache for 24 hours
            return Color::find($id);
        });
    }
}
