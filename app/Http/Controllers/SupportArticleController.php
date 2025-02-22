<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Storage;

class SupportArticleController extends Controller
{
    public function show($path = null)
    {
        $disk = Storage::disk('support_articles');

        if ($path && $disk->exists($path)) {
            return response()->file($disk->path($path));
        }

        // Handle cases where path is null or file does not exist.
        return abort(404);
    }
}
