<x-layout>
    <x-slot:heading>
        Image Show - views/images/show.blade.php
    </x-slot:heading>

    @isset($image_specimens)
        @foreach($image_specimens as $image_specimen)

            <img src="{{ $image_specimen->image->url}}" alt="{{ $image_specimen->image->name }}" class="w-1/2">
            <h2 class="font-bold text-lg">{{ $image_specimen->parts }}</h2>

            <p>This is views/images_specimen/show.blade.php</p>

            <p>
                {{ $image_specimen['description'] }}.
            </p>

            <p class=" mt-6">
                <x-button href="/images/{{ $image_specimen->id }}/edit">Edit Image</x-button>
            </p>

        @endforeach
    @endisset
    @empty($image_specimen)
        <p>There are no images for this specimen.</p>

    @endempty
</x-layout>
