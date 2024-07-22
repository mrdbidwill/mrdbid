<x-layout>
    <x-slot:heading>
        Image Show - views/images/show.blade.php
    </x-slot:heading>

    <h2 class="font-bold text-lg">{{ $images_specimen['parts'] }}</h2>

    <p>This is views/images_specimen/show.blade.php</p>

    <p>
        {{ $image_specimen['description'] }}.
    </p>

    <p class="mt-6">
        <x-button href="/images/{{ $images_specimen->id }}/edit">Edit Image</x-button>
    </p>
</x-layout>
