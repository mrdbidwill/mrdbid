<?php

namespace App\Http\Controllers;

use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;
use Intervention\Image\Laravel\Facades\Image;

class ImageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(): View
    {
        return view('upload.image_upload');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request): RedirectResponse
    {
        // request()->validate([

        //$this->validate($request, [

        request()->validate(['image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:8000',
        ]);

        $image = Image::read($request->file('image'));

        // Main Image Upload on Folder Code
        $imageName = time().'-'.$request->file('image')->getClientOriginalName();
        //dd($imageName);
        $destinationPath = public_path('storage/images/');
        //dd($destinationPath);
        $image->save($destinationPath.$imageName);

        // Generate Thumbnail Image Upload on Folder Code
        $destinationPathThumbnail = public_path('storage/images/thumbnail/');
        $image->resize(100, 100);
        $image->save($destinationPathThumbnail.$imageName);

        /**
         * Write Code for Image Upload Here,
         *
         * $upload = new Images();
         * $upload->file = $imageName;
         * $upload->save();
         */

        return back()
            ->with('success', 'Image Upload successful')
            ->with('imageName', $imageName);
    }
}
