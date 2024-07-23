<x-layout>
    <x-slot:heading>
        Specimen Show - views/specimens/show.blade.php
    </x-slot:heading>

    <h2 class="font-bold text-lg">{{ $specimen['specimen_name'] }}</h2>

    <p>This is views/specimens/show.blade.php</p>

    <p>
        Common Name: {{ $specimen['common_name'] }}.
    </p>
    @php
        // get all images_specimen for this specimen_id
        $images_specimen = App\Models\ImagesSpecimen::where('specimen_id', $specimen->id)->first();
        // dd($images_specimen);
        // dd($images_specimen->image);
        // dd($images_specimen->name);
        // dd($images_specimen->id);
        // dd($images_specimen->specimen_id);
        // dd($images_specimen->parts);
        // dd($images_specimen->created_at);
        // dd($images_specimen->updated_at);
        // dd($images_specimen->image);

        // display image for this specimen




           <!--   // <img src="{{ asset($images_specimen->image) }}" alt="{{ $images_specimen->name }}">  -->

    @endphp
    <p class="mt-6">
        <x-button href="/specimens/{{ $specimen->id }}/edit">Edit Specimen</x-button>
    </p>
</x-layout>
