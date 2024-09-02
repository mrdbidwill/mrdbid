<?php

namespace App\Http\Controllers;

use App\Models\ImageSpecimen;
use App\Models\ImageSpecimenThumbnail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;
use Illuminate\Validation\Rule;
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
        $specimen_id = request('specimen_id');
        $image_name = $request['image_name'];
        $image_file_name_text = $image_name->getClientOriginalName();

        $check_duplicate_name = DB::table('image_specimens')
            ->where([
                ['specimen_id', '=', $specimen_id],
                ['image_name',  '=', $image_file_name_text],
            ])
            ->first();

        //dd($check_duplicate_name);

        if ($check_duplicate_name != null) {
            Session::flash('message', 'You have already uploaded an image with that name.');

            return Redirect::back();
        }

        $rules = [
            'specimen_id' => [
                'required',
                'integer',
            ],
            'image_name' => [
                'required',
                'file',
                'mimes:jpg,jpeg,png',
                'max:6000',
                Rule::unique('image_specimens', 'image_name')->where(function ($query) use ($request) {
                    return $query->where('specimen_id', $request->specimen_id);
                }),
            ],
            'parts' => [
                'required',
                'integer',
            ],
            'description' => [
                'required',
                'string',
                'min:3',
                'max:2048',
            ],
        ];

        $messages = [
            'image_name.required' => 'The image name field is required.',
            'image_name.file' => 'The image name must be a file.',
            'image_name.mimes' => 'The image must be a file of type: jpg, jpeg, png.',
            'image_name.max' => 'The image must not be greater than 6000 kilobytes.',
            'image_name.unique' => 'An image with this name already exists for the specified specimen.',
            'specimen_id.required' => 'The Specimen ID must be included.',
            'specimen_id.integer' => 'The Specimen ID must be an integer.',
            'parts.required' => 'The parts field is required.',
            'description.required' => 'The description field must be filled in with something meaningful to specimen image, else what is the point?',
            'description.min' => 'Description is required.',
            'description.max' => 'You have 2048 characters for description field.',
        ];

        // Perform the validation
        $validated = $request->validate($rules, $messages);

        if ($image_name) {
            // Get the original file name

            // Get the temporary file path
            $temporary_file_path = $image_name->getPathName();

            // Use getimagesize() to get the image dimensions
            $image_data = getimagesize($temporary_file_path);

            //dd($image_data);

            if ($image_data) {
                $width = $image_data[0];
                $height = $image_data[1];

                if ($width > 2048) {
                    // resize while maintain proportions
                } elseif ($height > 2048) {
                    // resize while maintain proportions
                }
            }

        } else {
            Session::flash('message', 'No image data received!');

            return Redirect::back();
        }

        //end AI code

        $file_address = $specimen_id.'_'.time().'_'.$image_file_name_text;

        //dd($file_address);

        // save request to database
        $image = ImageSpecimen::create([
            'specimen_id' => $validated['specimen_id'],
            'parts' => $validated['parts'],
            'description' => $validated['description'],
            'image_name' => $image_file_name_text,
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

        $file_name = request('image_name')->getClientOriginalName();
        // $file_address = $specimen_id.'_'.time().'_'.$file_name;
        // $request->file_name->move(public_path('storage/uploaded_images'), $file_address);
        // $image_path = public_path('storage/uploaded_images/'.$file_address);
        //dd($image_file_name_text);
        //dd($image_name);
        //dd($file_name);

        $request->image_name->move(public_path('storage/uploaded_images'), $file_address);

        $image_path = public_path('storage/uploaded_images/'.$file_address);
        //dd($image_path);
        // resize the image and save to thumbnail directory
        $destinationPathThumbnail = public_path('storage/uploaded_images/thumbnail');

        //dd($image_path);
        $img = Image::read($image_path);
        $img->resize(200, 200, function ($constraint) {
            $constraint->aspectRatio();
        })->save($destinationPathThumbnail.'/thumb_'.$file_address);

        $destinationPath = public_path('storage/uploaded_images/thumbnail');
        //$image->move($destinationPath, $file_address);

        $thumbnail_image = ImageSpecimenThumbnail::create([
            'specimen_id' => request('specimen_id'),
            'thumbnail_file_address' => 'thumb_'.$file_address,
            'image_width' => 200,
            'image_height' => 200,
            'entered_by' => 1]);

        //dd($image);

        //return redirect('/specimens.show/'.$specimen_id);
        //return back()->with('success', 'Image Uploaded successfully!');
        Session::flash('message', 'Image uploaded!');

        return Redirect::back();
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
