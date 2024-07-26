@php use Illuminate\Support\Facades\DB; @endphp
<x-layout>
    <x-slot:heading>
        Specimen Show - views/specimens/show.blade.php
    </x-slot:heading>

    @php
        $specimen_id = $specimen->id;
        dd($specimen_id);

        $images_specimens = DB::table('images_specimens')
        ->where('specimen_id', '=', $specimen['specimen_id'])
        ->first();

        // display image for this specimen
        foreach ($images_specimens as $images_specimen) {
        echo "<img src='" . asset($images_specimen->file_address) . "' alt='" . $images_specimen->name . "'>";
        echo "<p>Part: " . $images_specimen->parts . "</p>";
        }
    @endphp

    <p class="mt-6">
        <x-button href="/specimens/{{ $specimen->id }}/edit">Edit Specimen</x-button>
    </p>
</x-layout>
