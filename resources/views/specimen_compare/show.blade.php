@php use Illuminate\Support\Facades\DB; @endphp
<x-layout>
    <h1>specimens.show.blade.php</h1>

    @php
        //dd($specimen);
        foreach ($specimens as $specimen) {

            //$images_specimens = DB::table('images')
              //  ->where('specimen_compareid', '=', $specimen['id'])
                //->first()
               // ->get();

            $images_specimens = \App\Models\ImageSpecimen::where('specimen_compareid', '=', $specimen->id)->get();

            //dd($images_specimens);

            // display image for this specimen_comparecompare
                foreach ($images_specimens as $images_specimen) {
                    $file_address = $images_specimen['file_address'];

                // $image_address = url('storage/uploaded_images/'.$file_address);
                $image_address = url('storage/uploaded_images/thumbnail/'.$file_address);
                echo "<img src='$image_address' alt='Image for specimen_comparecompare'>";


                echo "<p>Part: " . $images_specimen['parts'] . "</p>";
                }  // end foreach images_specimens
            } // end foreach specimen_comparecompare
    @endphp

    <p class="mt-6">
        <x-button href="/specimens/{{ $specimen->id }}/edit">Edit Specimen Compare</x-button>
    </p>
</x-layout>
