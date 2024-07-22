<?php

namespace App\Http\Controllers;

use App\Models\ImagesSpecimen;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;

class ImagesSpecimenController extends Controller
{
    public function index()
    {
        $images = ImagesSpecimen::where('specimen_id', auth()->id())->latest()->simplePaginate(6);

        return view('images_specimen.index', [
            'images_specimen' => $images,
        ]);
    }

    public function show(ImagesSpecimen $image)
    {
        //return view('images_specimen.show', ['image' => $image->user_id = auth()->id()]);
        // get images_specimen for this user
        $images = ImagesSpecimen::where('specimen_id', auth()->id())->get();

        return view('images_specimen.show', ['image' => $image, 'images_specimen' => $images]);
    }

    public function create()
    {
        // get the specimen id from the request

        return view('/images_specimen/create')->with('specimen_id', request('specimen_id'));
    }

    public function store(Request $request)
    {
        //dd($request->all());

        $request->validate([
            'parts' => 'required',
            'description' => 'required',
            'photos' => 'required|file|max:5000',
        ]);

        $imagePath = $request->file('photos')->store('images', 'public');

        $exif_data = $this->image_return_exif_data($imagePath);

        $image = new ImagesSpecimen();
        $image->parts = $request->parts;
        $image->description = $request->description;
        $image->source_remote = 'generic_source_remote';
        $image->source_local = 'generic_source_local';
        $image->image_width = 0;
        $image->image_height = 0;
        $image->camera_make = $exif_data['make'];
        $image->camera_model = $exif_data['model'];
        $image->lens = 'generic_lens';
        $image->exposure = $exif_data['exposure'];
        $image->aperture = $exif_data['aperture'];
        $image->iso = $exif_data['iso'];
        $image->date_taken = $exif_data['date'];
        $image->entered_by = 0;
        $image->specimen_id = $request->specimen_id;
        $image->save();

        return redirect('/images_specimen');
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

    public function edit(ImagesSpecimen $imagesSpecimen)
    {
        return view('images_specimen.edit', ['imagesSpecimen' => $imagesSpecimen]);

    }

    public function update(ImagesSpecimen $image)
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

        return redirect('/images_specimen/'.$image['id']);
    }

    public function destroy(ImagesSpecimen $image)
    {
        Gate::authorize('edit-image', $image);

        $image->delete();

        return redirect('/images_specimen');
    }   // close image_return_exif_data($imagePath)

    public function store_image(Request $request)
    {
        $request->validate([
            'parts' => 'required',
            'description' => 'required',

        ]);

        $parts = $request->parts;
        $description = $request->description;

        DB::table('images_specimen')->insert([
            ['parts' => $parts,
                'description' => $description,
            ],
        ]);

        return redirect()->route('images_specimen.index')->with('success', 'image image upload successfully.');
    }
}
