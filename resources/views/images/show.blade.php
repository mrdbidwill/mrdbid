<x-layout>
    <x-slot:heading>
        Image Show - views/images/show.blade.php
    </x-slot:heading>

    <h2 class="font-bold text-lg">{{ $image['parts'] }}</h2>

    <p>This is views/images/show.blade.php</p>

    <p>
        {{ $image['description'] }}.
    </p>

    <p class="mt-6">
        <x-button href="/images/{{ $image->id }}/edit">Edit Image</x-button>
    </p>
</x-layout>
