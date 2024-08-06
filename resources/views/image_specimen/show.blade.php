<x-layout>
    <x-slot:heading>
        Image Show - views/images/show.blade.php
    </x-slot:heading>
    <h1 class="text-2xl font-bold">Image Specimen Show</h1>
    <p>This is views/images_specimen/show.blade.php</p>

    @foreach($image_specimens as $image_specimen)

        <img src="{{ $image_specimen['file_address'] }}" alt="{{ $image_specimen['image->name'] }}" class="w-1/2">
        <h2 class="font-bold text-lg">{{ $image_specimen['parts'] }}</h2>
    
        <p>
            {{ $image_specimen['description'] }}.
        </p>

        <p class=" mt-6">
            <x-button href="/images/{{ $image_specimen['id'] }}/edit">Edit Image</x-button>
        </p>

    @endforeach

</x-layout>
