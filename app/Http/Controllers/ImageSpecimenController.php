<?php

namespace App\Http\Controllers;

use App\Models\ImageSpecimen;
use App\Models\ImageSpecimenThumbnail;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Log;
use Intervention\Image\Laravel\Facades\Image;

class ImageSpecimenController extends Controller
{
    public function index()
    {
        $images = ImageSpecimen::where('specimen_id', auth()->id())->latest()->simplePaginate(6);

        return view('image_specimen.index', [
            'images_specimen' => $images,
        ]);
    }

    public function show(ImageSpecimen $image)
    {
        //return view('images_specimen.show', ['image' => $image->user_id = auth()->id()]);
        // get images_specimen for this user
        $images = ImageSpecimen::where('specimen_id', auth()->id())->get();

        return view('image_specimen.show', ['image' => $image, 'images_specimen' => $images]);
    }

    public function store(Request $request): RedirectResponse
    {
        //dd($request);
        $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:6000',
        ]);

        $specimen_id = $request['specimen_id'];

        $image = $request->file('image');

        $image_file_name_text = $image->getClientOriginalName();
        $imageName = $specimen_id.'_'.time().'.'.$image_file_name_text;

        $image_file_name_text = $image->getClientOriginalName();

        //dd($imageName);

        $destinationPathThumbnail = public_path('storage/uploaded_images/thumbnail/');
        $img = Image::read($image->path());
        $img->resize(100, 100, function ($constraint) {
            $constraint->aspectRatio();
        })->save($destinationPathThumbnail.'/thumb_'.$imageName);

        $destinationPath = public_path('storage/uploaded_images/');
        $image->move($destinationPath, $imageName);

        $image_file_name_text = $image->getClientOriginalName();

        try {

            /*
            $imageSpecimen = ImageSpecimen::create([
                'specimen_id' => $specimen_id,
                'parts' => $request['parts'],
                'description' => $request['description'],
                'image_name' => $image_file_name_text,
                'file_address' => $imageName,
                'image_width' => 0,
                'image_height' => 0,
                'camera_make' => 'generic_camera_make',
                'camera_model' => 'generic_camera_model',
                'lens' => 'generic_lens',
                'exposure' => 'generic_exposure',
                'aperture' => 'generic_aperture',
                'iso' => 'generic_iso',
                'date_taken' => '2024-06-02 00:05:27',
                'entered_by' => 1]);
            */

            $imageSpecimen = DB::table('image_specimens')->insert([
                'specimen_id' => $specimen_id,
                'parts' => $request['parts'],
                'description' => $request['description'],
                'image_name' => $image_file_name_text,
                'file_address' => $imageName,
                'image_width' => 0,
                'image_height' => 0,
                'camera_make' => 'generic_camera_make',
                'camera_model' => 'generic_camera_model',
                'lens' => 'generic_lens',
                'exposure' => 'generic_exposure',
                'aperture' => 'generic_aperture',
                'iso' => 'generic_iso',
                'date_taken' => '2024-06-02 00:05:27',
                'entered_by' => 1,
            ]);

        } catch (\Exception $e) {
            Log::error('Error creating ImageSpecimen: '.$e->getMessage());
        }

        try {

            $imageSpecimenThumbnail = DB::table('image_specimens_thumbnails')->insert([
                'image_specimen_id' => $imageSpecimen,  // id of image_specimen just entered
                'thumbnail_file_address' => 'thumb_'.$imageName,
                'image_width' => 100,
                'image_height' => 100,
                'entered_by' => 1,
            ]);

            /*
            ImageSpecimenThumbnail::create([
                'image_specimen_id' => $imageSpecimen->id,  // id of image_specimen just entered
                'thumbnail_file_address' => 'thumb_'.$imageName,
                'image_width' => 100,
                'image_height' => 100,
                'entered_by' => 1]);
            */

        } catch (\Exception $e) {
            Log::error('Error creating ImageSpecimenThumbnail: '.$e->getMessage());
        }

        return back()->with('success', 'Image Uploaded successfully!')
            ->with('imageName', $imageName);
    }

    public function create()
    {
        // get the specimen id from the request

        return view('/image_specimen/create')->with('specimen_id', request('specimen_id'));
    }

    public function image_return_exif_data($imagePath)
    {
        // echo "<p>imagepath:  $imagePath exists on line ".__LINE__.".</p>";
        // Check if the variable is set and if the file itself exists before continuing
        if ((isset($imagePath)) and (file_exists($imagePath))) {

            // There are 2 arrays which contains the information we are after, so it's easier to state them both
            //$exif_ifd0 = read_exif_data($imagePath ,'IFD0' ,0);
            //$exif_exif = read_exif_data($imagePath ,'EXIF' ,0);

            $exif_ifd0 = exif_read_data($imagePath, 'IFD0', 0);
            $exif_exif = exif_read_data($imagePath, 'EXIF', 0);

            //$exif = exif_read_data($imagePath, 0, true);
            //foreach ($exif as $key => $section) {
            //    foreach ($section as $name => $val) {
            //        echo "$key.$name: $val<br>\n";
            //    }
            //}

            //error control
            $notFound = 'Unavailable';

            // Make
            if (@array_key_exists('Make', $exif_ifd0)) {
                $camMake = $exif_ifd0['Make'];
            } else {
                $camMake = $notFound;
            }

            // Model
            if (@array_key_exists('Model', $exif_ifd0)) {
                $camModel = $exif_ifd0['Model'];
            } else {
                $camModel = $notFound;
            }

            // Exposure
            if (@array_key_exists('ExposureTime', $exif_ifd0)) {
                $camExposure = $exif_ifd0['ExposureTime'];
            } else {
                $camExposure = $notFound;
            }

            // Aperture
            if (@array_key_exists('ApertureFNumber', $exif_ifd0['COMPUTED'])) {
                $camAperture = $exif_ifd0['COMPUTED']['ApertureFNumber'];
            } else {
                $camAperture = $notFound;
            }

            // Date
            if (@array_key_exists('DateTime', $exif_ifd0)) {
                $camDate = $exif_ifd0['DateTime'];
            } else {
                $camDate = $notFound;
            }

            // ISO
            if (@array_key_exists('ISOSpeedRatings', $exif_exif)) {
                $camIso = $exif_exif['ISOSpeedRatings'];
            } else {
                $camIso = $notFound;
            }

            $return_array = [];
            $return_array['make'] = $camMake;
            $return_array['model'] = $camModel;
            $return_array['exposure'] = $camExposure;
            $return_array['aperture'] = $camAperture;
            $return_array['date'] = $camDate;
            $return_array['iso'] = $camIso;

            return $return_array;
        } else {
            return false;
        }
    }

    public function edit(ImageSpecimen $imagesSpecimen)
    {
        return view('image_specimen.edit', ['imagesSpecimen' => $imagesSpecimen]);

    }

    public function update(ImageSpecimen $image)
    {
        Gate::authorize('edit-image', $image);

        request()->validate([
            'parts' => ['required'],
            'description' => 'required',
        ]);

        $image->update([
            'parts' => request('parts'),
            'description' => request('description'),
            'source_remote' => 'generic_source_remote',
            'source_local' => 'generic_source_local',
            'image_width' => 0,
            'image_height' => 0,
            'camera_make' => 'generic_camera_make',
            'camera_model' => 'generic_camera_model',
            'lens' => 'generic_lens',
            'exposure' => 'generic_exposure',
            'aperture' => 'generic_aperture',
            'iso' => 'generic_iso',
            'date_taken' => 'generic_date_taken',
            'entered_by' => 0,

        ]);

        return redirect('/image_specimen/'.$image['id']);
    }

    public function destroy(ImageSpecimen $image)
    {
        Gate::authorize('edit-image', $image);

        $image->delete();

        return redirect('/image_specimen');
    }   // close image_return_exif_data($imagePath)

    public function store_image(Request $request)
    {
        $request->validate([
            'parts' => 'required',
            'description' => 'required',
            'file_name' => 'required|image|mimes:jpg,jpeg,png',

        ]);

        $parts = $request->parts;
        $description = $request->description;

        $specimen_id = request('specimen_id');
        $file_name = request('file_name')->getClientOriginalName();
        //dd($file_name);
        // file_address is created:   $file_address = $specimen_id.'_'.$file_name.'_'.time().'.'.$request->file_name->extension();
        $file_address = $specimen_id.'_'.$file_name.'_'.time().'.'.$request->file_name->extension();

        DB::table('image_specimens')->insert([
            ['parts' => $parts,
                'description' => $description,
                'file_address' => $file_address,
            ],
        ]);

        return redirect()->route('image_specimen.index')->with('success', 'image image upload successfully.');
    }
}
