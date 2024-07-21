<?php

namespace App\Http\Controllers;

use App\Models\Image;
use Illuminate\Support\Facades\Gate;

class ImageController extends Controller
{
    public function index()
    {
        $images = Image::where('user_id', auth()->id())->latest()->simplePaginate(6);

        return view('images.index', [
            'images' => $images,
        ]);
    }

    public function show(Image $image)
    {
        //return view('images.show', ['image' => $image->user_id = auth()->id()]);
        // get images for this user
        $images = Image::where('specimen_id', auth()->id())->get();

        return view('images.show', ['image' => $image, 'images' => $images]);
    }

    public function store()
    {
        request()->validate([
            'image_name' => ['required', 'min:3'],
            'common_name' => ['required'],
            'image_location_now' => ['required'],
            'location_found_city' => ['required', 'min:3'],
            'location_found_county' => ['required', 'min:3'],
            'state' => ['required'],
            'country' => ['required'],
            'location_public_y_n' => ['required'],
            'share_data_y_n' => ['required'],
            'month_found' => ['required'],
            'day_found' => ['required'],
            'year_found' => ['required'],
            'fungus_type' => ['required'],
            'entered_by' => ['required'],
        ]);

        $image = Image::create([
            'user_id' => auth()->id(),
            'image_name' => request('image_name'),
            'common_name' => request('common_name'),
            'description' => request('description'),
            'comment' => request('comment'),
            'image_location_now' => request('image_location_now'),
            'location_found_city' => request('location_found_city'),
            'location_found_county' => request('location_found_county'),
            'state' => request('state'),
            'country' => request('country'),
            'location_public_y_n' => request('location_public_y_n'),
            'share_data_y_n' => request('share_data_y_n'),
            'month_found' => request('month_found'),
            'day_found' => request('day_found'),
            'year_found' => request('year_found'),
            'fungus_type' => request('fungus_type'),
            'entered_by' => request('entered_by')]);

        // Mail::to($image['user'])->queue(new ImageCreated($image));

        return redirect('/images');
        //return view('images.show', ['image' => $image]);
    }

    public function create()
    {
        return view('images.create');
    }

    public function edit(Image $image)
    {
        return view('images.edit', ['image' => $image]);

    }

    public function update(Image $image)
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

        return redirect('/images/'.$image['id']);
    }

    public function destroy(Image $image)
    {
        Gate::authorize('edit-image', $image);

        $image->delete();

        return redirect('/images');
    }

    public function store_image(Request $request)
    {
        $request->validate([
            'parts' => 'required',
            'description' => 'required',

        ]);

        $parts = $request->parts;
        $description = $request->description;

        DB::table('images')->insert([
            ['parts' => $parts,
                'description' => $description,
            ],
        ]);

        return redirect()->route('images.index')->with('success', 'image image upload successfully.');
    }   // close image_return_exif_data($imagePath)

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
}
