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
        // get all image_specimens for this specimen_id
        $image_specimen = ImageSpecimen::where('specimen_id', $id)
            ->get();
        //dd($image_specimen);

        return view('image_specimen.show', ['image_specimen' => $image_specimen]);
    }

    public function edit($id) {}

    public function update(Request $request, $id) {}

    public function destroy($id) {}
}
