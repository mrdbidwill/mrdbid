<?php

namespace App\Http\Controllers;

use App\Models\ImageSpecimen;
use App\Models\ImageSpecimenThumbnail;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;
use Intervention\Image\Laravel\Facades\Image;

class ImageSpecimenController extends Controller
{
    use AuthorizesRequests;

    public function __construct()
    {

    }

    public function index()
    {
        $images = ImageSpecimen::where('specimen_id', auth()->id())->latest()->simplePaginate(6);

        return view('image_specimens.index', [
            'images_specimen' => $images,
        ]);
    }

    public function show($id)
    {
        //dd($id);

        // get images_specimen for this user and this image_specimens id
        $image_specimen = ImageSpecimen::where('id', $id)
            ->first();

        return view('image_specimens.show', ['image_specimen' => $image_specimen]);
    }

    public function store(Request $request): RedirectResponse
    {
        $specimen_id = $request['specimen_id'];
        $currentUser = Auth::user();
        $userId = $currentUser->id;
        $specimen = $currentUser->specimens()->find($specimen_id);

        if (! $specimen) {
            abort(404, 'Specimen not found or you do not have permission to access it');
        }

        //dd($request);

        $request->validate([
            'images.*' => 'required|image|mimes:jpeg,jpg,png,gif,svg,tiff,tif,heic|max:20000',
            'description' => 'nullable|string|max:1280',
            'parts' => 'nullable|integer',
            'lens' => 'nullable|string|max:255',
        ]);

        $images = $request->file('images');

        foreach ($images as $image) {
            $image_file_name_text = $image->getClientOriginalName();
            $image_file_name_text = preg_replace('/\s+/', '_', $image_file_name_text);
            $image_file_name_text = preg_replace('/-/', '_', $image_file_name_text);
            $image_file_name_text = preg_replace('/[^\w\-_.]/', '', $image_file_name_text);

            $imageName = $specimen_id.'_'.time().'_'.$image_file_name_text;

            $check_duplicate_name = DB::table('image_specimens')
                ->where([
                    ['specimen_id', '=', $specimen_id],
                    ['image_name', '=', $image_file_name_text],
                ])
                ->first();

            if ($check_duplicate_name != null) {
                Session::flash('message', 'You have already uploaded an image with that name.');

                return Redirect::back();
            }

            $destinationPathThumbnail = public_path('storage/uploaded_images/thumbnail/');
            $img = Image::read($image->path());

            // dd($img);

            // Resize the image if larger than 2048 x 2048
            if ($img->width() > 2048 and $img->height() > 2048) {
                $img->scale(2048, 2048);
            } elseif ($img->width() > 2048) {
                $img->scaleDown(width: 2048);
            } elseif ($img->height() > 2048) {
                $img->scaleDown(height: 2048);
            }

            $exifData = $img->exif();

            if ($img->exif('UndefinedTag:0xA434')) {
                $lens = $img->exif('UndefinedTag:0xA434');
                //dd($lens);
            } else {
                $lens = 'N/A';
            }

            //dd($exifData);
            $image_width = $img->width();
            $image_height = $img->height();
            $filesize = $img->exif('FILE.FileSize');
            $camera_make = $img->exif('IFD0.Make');
            $camera_model = $img->exif('IFD0.Model');
            $date_taken = $img->exif('EXIF.DateTimeOriginal');
            $exposure = $img->exif('EXIF.ExposureTime');
            $aperture = $img->exif('EXIF.FNumber');
            $iso = $img->exif('EXIF.ISOSpeedRatings');
            $FocalLength = $img->exif('EXIF.FocalLength');

            $GPSLatitudeRef = $img->exif('GPS.GPSLatitudeRef');
            $GPSLatitude_0 = $img->exif('GPS.GPSLatitude[0]');
            $GPSLatitude_1 = $img->exif('GPS.GPSLatitude[1]');
            $GPSLatitude_2 = $img->exif('GPS.GPSLatitude[2]');

            $GPSLongitudeRef = $img->exif('GPS.GPSLongitudeRef');
            $GPSLongitude_0 = $img->exif('GPS.GPSLongitude[0]');
            $GPSLongitude_1 = $img->exif('GPS.GPSLongitude[1]');
            $GPSLongitude_2 = $img->exif('GPS.GPSLongitude[2]');

            $GPSAltitudeRef = $img->exif('GPS.GPSAltitudeRef');
            $GPSAltitude = $img->exif('GPS.GPSAltitude');

            $destinationPath = public_path('storage/uploaded_images/');
            $img->save($destinationPath.$imageName);

            // $img->resize(100, 100)->save($destinationPathThumbnail.'/thumb_'.$imageName);
            $img->scale(100, 100)->save($destinationPathThumbnail.'/thumb_'.$imageName);

            try {
                $imageSpecimenId = DB::table('image_specimens')->insertGetId([
                    'specimen_id' => $specimen_id,
                    'parts' => $request['parts'],
                    'description' => $request['description'],
                    'image_name' => $image_file_name_text,
                    'file_address' => $imageName,
                    'image_width' => $image_width,
                    'image_height' => $image_height,
                    'camera_make' => $camera_make,
                    'camera_model' => $camera_model,
                    'lens' => $lens,
                    'exposure' => $exposure,
                    'aperture' => $aperture,
                    'iso' => $iso,
                    'focal_length' => $FocalLength,
                    'GPSLatitudeRef' => $GPSLatitudeRef,
                    'GPSLatitude_0' => $GPSLatitude_0,
                    'GPSLatitude_1' => $GPSLatitude_1,
                    'GPSLatitude_2' => $GPSLatitude_2,
                    'GPSLongitudeRef' => $GPSLongitudeRef,
                    'GPSLongitude_0' => $GPSLongitude_0,
                    'GPSLongitude_1' => $GPSLongitude_1,
                    'GPSLongitude_2' => $GPSLongitude_2,
                    'GPSAltitudeRef' => $GPSAltitudeRef,
                    'GPSAltitude' => $GPSAltitude,
                    'date_taken' => $date_taken,
                    'entered_by' => $userId,
                    'created_at' => Carbon::now(),
                    'updated_at' => Carbon::now(),
                ]);
            } catch (\Exception $e) {
                Log::error('Error creating ImageSpecimen: '.$e->getMessage());
            }

            try {
                DB::table('image_specimen_thumbnails')->insert([
                    'image_specimen_id' => $imageSpecimenId,
                    'thumbnail_file_address' => 'thumb_'.$imageName,
                    'image_width' => 100,
                    'image_height' => 100,
                    'entered_by' => $userId,
                    'created_at' => Carbon::now(),
                    'updated_at' => Carbon::now(),
                ]);
            } catch (\Exception $e) {
                Log::error('Error creating ImageSpecimenThumbnail: '.$e->getMessage());
            }
        }

        return back()->with('success', 'Images Uploaded successfully!');
    }

    public function create()
    {
        // get the specimen id from the request

        return view('/image_specimens/create')->with('specimen_id', request('specimen_id'));
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

    public function edit(int $image_specimen_id)
    {
        // dd($image_specimen_id);

        return view('image_specimens.edit', ['imageSpecimen' => $imageSpecimen = ImageSpecimen::findOrFail($image_specimen_id)]);

    }

    public function update(Request $request, $id)
    {
        //Gate::authorize('edit-image', $image);

        //  request()->validate([
        //      'parts' => 'required',
        //     'description' => 'required',
        //  ]);
        //dd($request);

        $entered_by = Auth::user()->id;
        $imageSpecimen = ImageSpecimen::findOrFail($id);
        $imageSpecimen->update([
            'parts' => request('parts'),
            'description' => request('description'),
            'entered_by' => $entered_by,
        ]);

        return redirect('/image_specimens/'.$id.'/edit')->with('message', 'Image Specimen updated successfully');
    }

    public function destroy(int $id)
    {
        $image = ImageSpecimen::findOrFail($id);
        $this->authorize('delete', $image);

        $specimen_id = $image->specimen_id;
        $file_name = $image->file_address;

        // Get the thumbnail for the image
        $thumbnail = ImageSpecimenThumbnail::where('image_specimen_id', $id)->first();
        $thumb_file_name = $thumbnail->thumbnail_file_address ?? null;

        // Define file paths
        $imagePath = public_path('storage/uploaded_images/'.$file_name);
        $thumbPath = public_path('storage/uploaded_images/thumbnail/'.$thumb_file_name);

        // Delete files from storage if they exist
        if (file_exists($imagePath)) {
            unlink($imagePath);
        }

        if ($thumb_file_name && file_exists($thumbPath)) {
            unlink($thumbPath);
        }

        // Delete database records
        $thumbnail?->delete(); // Deletes the thumbnail record if it exists
        $image->delete(); // Deletes the image record

        return redirect()->route('specimens.show', ['specimen' => $specimen_id])
            ->with('success', 'Image and its thumbnail deleted successfully.');
    }

    public function store_image(Request $request)   // NOT used - delete?
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

        return redirect()->route('image_specimens.index')->with('success', 'image image upload successfully.');
    }
}
