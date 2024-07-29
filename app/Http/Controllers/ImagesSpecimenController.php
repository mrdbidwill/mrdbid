<?php

namespace App\Http\Controllers;

use App\Models\ImagesSpecimen;
use Illuminate\Http\Request;
use Illuminate\View\View;
use Intervention\Image\Laravel\Facades\Image;

class ImagesSpecimenController extends Controller
{
    public function index(): View
    {
        return view('images_specimen.index');
    }

    public function store(Request $request): View
    {
        $specimen_id = request('specimen_id');

        //dd($request->specimen_id);
        // request()->validate([

        //$this->validate($request, [

        request()->validate(['image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:8000',
        ]);

        $image = Image::read($request->file('image'));

        // Main ImagesSpecimen Upload on Folder Code
        $imageName = $specimen_id.'-'.time().'-'.$request->file('image')->getClientOriginalName();
        //dd($imageName);
        $destinationPath = public_path('storage/uploaded_images/');

        //dd($destinationPath);
        $image->save($destinationPath.$imageName);

        // Generate Thumbnail ImagesSpecimen Upload on Folder Code
        $destinationPathThumbnail = public_path('storage/uploaded_images/thumbnail/');
        $image->resize(100, 100);
        $image->save($destinationPathThumbnail.$imageName);

        // save request to database
        $image = ImagesSpecimen::create([
            'specimen_id' => request('specimen_id'),
            'parts' => request('parts'),
            'description' => request('description'),
            'file_address' => $imageName,
            'image_width' => 0,
            'image_height' => 0,
            'camera_make' => 0,
            'camera_model' => 'generic_camera_model',
            'lens' => 'generic_lens',
            'exposure' => 'generic_exposure',
            'aperture' => 'generic_aperture',
            'iso' => 'generic_iso',
            'date_taken' => '2024-06-02 00:05:27',
            'entered_by' => 1]);

        /**
         * Write Code for ImagesSpecimen Upload Here,
         *
         * $upload = new Images();
         * $upload->file = $imageName;
         * $upload->save();
         */

        return view('/images_specimen/create')->with('specimen_id', request('specimen_id'));
    }

    public function create()
    {
        // get the specimen id from the request and pass it to the view
        return view('/images_specimen/create')->with('specimen_id', request('specimen_id'));
    }

    public function show(): View
    {
        return view('images_specimen.show');
    }
}
