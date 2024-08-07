<?php

namespace App\Http\Controllers;

use App\Models\ImageSpecimen;
use App\Models\ImageSpecimenThumbnail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
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

    //public function store(StoreImageSpecimenRequest $request)
    public function store(Request $request)
    {
        //dd($request->all());
        //dd($request->file('file_name')->getClientOriginalName());

        //dd($request->all());
        //dd($request->file_name->extension());
        $specimen_id = request('specimen_id');
        $file_name = request('file_name')->getClientOriginalName();
        // dd($file_name);
        //$file_address = $specimen_id.'_'.$file_name.'_'.time().'.'.$request->file_name->extension();
        $file_address = $specimen_id.'_'.time().'_'.$file_name;

        //dd($file_address);

        // save request to database
        $image = ImageSpecimen::create([
            'specimen_id' => request('specimen_id'),
            'parts' => request('parts'),
            'description' => request('description'),
            'file_address' => $file_address,
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

        $request->file_name->move(public_path('storage/uploaded_images'), $file_address);

        $image_path = public_path('storage/uploaded_images/'.$file_address);

        // resize the image and save to thumbnail directory
        $destinationPathThumbnail = public_path('storage/uploaded_images/thumbnail');
        $img = Image::read($image_path);
        $img->resize(200, 200, function ($constraint) {
            $constraint->aspectRatio();
        })->save($destinationPathThumbnail.'/thumb_'.$file_address);

        $destinationPath = public_path('storage/uploaded_images/thumbnail');
        //$image->move($destinationPath, $file_address);

        $thumbnail_image = ImageSpecimenThumbnail::create([
            'specimen_id' => request('specimen_id'),
            'thumbnail_file_address' => 'thumb_'.$file_address,
            'image_width' => 0,
            'image_height' => 0,
            'entered_by' => 1]);

        //dd($image);

        //return redirect('/specimens.show/'.$specimen_id);
        return back()->with('success', 'Image Uploaded successfully!');
    }

    public function create()
    {
        // get the specimen id from the request

        return view('/image_specimen/create')->with('specimen_id', request('specimen_id'));
    }

    /*
        public function index()
        {
            $jobs = Job::all()->groupBy('featured');

            return view('jobs.index', [
                'featuredJobs' => $jobs[0],
                'jobs' => $jobs[1],
                'tags' => Tag::all(),
            ]);
        }

        */

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
