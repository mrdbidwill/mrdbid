@php
    use App\Models\ImageSpecimen;  use App\Models\Specimen;use App\Utils\ImageUtils;use Illuminate\Support\Facades\DB ;
    //dd($image_specimens);
@endphp

@extends('layouts.app')

@section('content')

    <x-specimens-nav-bar></x-specimens-nav-bar>

    @if(session('success'))
        <div x-data="{ show: true }" x-init="setTimeout(() => show = false, 5000)" x-show="show"
             x-transition:enter="transition ease-out duration-300" x-transition:enter-start="opacity-0"
             x-transition:enter-end="opacity-100" x-transition:leave="transition ease-in duration-500"
             x-transition:leave-start="opacity-100" x-transition:leave-end="opacity-0"
             class="custom-success text-orange-600">
            <strong>Success!</strong> {{ session('success') }}
        </div>
    @endif

    @if(session('error'))
        <div class="alert alert-danger">
            {{ session('error') }}
        </div>
    @endif

    <!-- if no specimens are found, display message -->
    @if ($image_specimen->count() == 0)
        <p class="text-red-500">No images found.</p>
    @endif

    <p>resources/views/image_specimen/show.blade.php</p>

    <table
        class="w-full table-auto bg-indigo-100 border-separate border border-4-rounded rounded-lg outline-slate-100 outline-4">


        <tr>
            <td class="border-4 border-blue-300 p-2 text-black text-center">
Image Info   <a href="/image_specimen/<?php echo $image_specimen->id; ?>/edit" class="w-64 h-10 flex items-center justify-center rounded-full  text-black bg-green-100 hover:bg-green-300  no-underline"
                                    title="Return to this Image">
                    <b>Return to this Image</b>
                </a>
            </td>
        </tr>

        <!--

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
         -->

        <tr>
            <td class="border-4 border-blue-300 p-2">
                Image ID: <b>{{ $image_specimen->id }}</b> Specimen ID: <b>{{ $image_specimen->specimen_id }}</b> Image Name: <b>{{ $image_specimen->image_name }}</b>  Date Taken: <b>{{ $image_specimen->date_taken }}</b>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2">
                Description: <b>{{ $image_specimen->description }}</b>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2">
                File Address: <b>{{ $image_specimen->file_address }}</b> Image Width: <b>{{ $image_specimen->image_width }}</b>  Image Height: <b>{{ $image_specimen->image_height }}</b>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2">
                Camera Make: <b>{{ $image_specimen->camera_make }}</b> Camera Model: <b>{{ $image_specimen->camera_model }}</b>  Lens: <b>{{ $image_specimen->lens }}</b>
            </td>
        </tr>


        <tr>
            <td class="border-4 border-blue-300 p-2">
                Exposure: <b>{{ $image_specimen->exposure }}</b> Aperture: <b>{{ $image_specimen->aperture }}</b>  ISO: <b>{{ $image_specimen->iso }}</b> Focal Length: <b>{{ $image_specimen->focal_length }}</b>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2">
                GPS Latitude Ref: <b>{{ $image_specimen->GPSLatitudeRef }}</b> GPS Lat 0: <b>{{ $image_specimen->GPSLatitude_0 }}</b>  GPS Lat 1: <b>{{ $image_specimen->GPSLatitude_1 }}</b> GPS Lat 2: <b>{{ $image_specimen->GPSLatitude_2 }}</b>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2">
                GPS Longitude Ref: <b>{{ $image_specimen->GPSLongitudeRef }}</b> GPS Long 0: <b>{{ $image_specimen->GPSLongitude_0 }}</b>  GPS Long 1: <b>{{ $image_specimen->GPSLongitude_1 }}</b> GPS Long 2: <b>{{ $image_specimen->GPSLatitude_2 }}</b>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2">
                GPS Altitude Ref: <b>{{ $image_specimen->GPSAltitudeRef }}</b>  GPS Altitude: <b>{{ $image_specimen->GPSAltitude }}</b>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2 text-fuchsia-700 text-center">
                End image_specimen info.
            </td>
        </tr> <!-- end image_specimen info table line image_specimens/index.blade.php -->
    </table>
@endsection


