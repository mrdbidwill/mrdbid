<?php

namespace App\Http\Controllers;

use App\Models\ImageSpecimen;
use Illuminate\Http\Request;
use Illuminate\View\View;

class ImageSpecimenController extends Controller
{
    public function index(): View
    {
        return view('image_specimen.index');
    }

    public function create() {}

    public function show($id)
    {
        // dd($id);  // id is good here
        // get all image_specimens for this specimen_id
        $image_specimens = ImageSpecimen::where('specimen_id', $id)->get();
        //dd($image_specimen);

        return view('image_specimen.show', ['image_specimens' => $image_specimens]);
    }

    public function edit($id) {}

    public function update(Request $request, $id) {}

    public function destroy($id) {}
}
