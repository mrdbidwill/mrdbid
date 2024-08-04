@php use Illuminate\Support\Facades\DB; @endphp
<x-layout>
    <x-slot:heading>
        Specimen Show - views/specimens/show.blade.php
    </x-slot:heading>

    @php
        //dd($specimen);
        foreach ($specimen as $specimen) {

            //$images_specimens = DB::table('images')
              //  ->where('specimen_id', '=', $specimen['id'])
                //->first()
               // ->get();

            $images_specimens = \App\Models\ImageSpecimen::where('specimen_id', '=', $specimen['id'])->get();

            //dd($images_specimens);

            // display image for this specimen
                foreach ($images_specimens as $images_specimen) {
                echo "<img src='" . asset($images_specimen->file_address) . "' alt='" . $images_specimen->name . "'>";
                echo "<p>Part: " . $images_specimen->parts . "</p>";
                }  // end foreach images_specimens
            } // end foreach specimen
    @endphp

    <p class="mt-6">
        <x-button href="/specimens/{{ $specimen->id }}/edit">Edit Specimen</x-button>
    </p>
</x-layout>
