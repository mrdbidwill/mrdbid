<x-layout>
    <x-slot:heading>
        Specimen Show - views/specimens/show.blade.php
    </x-slot:heading>

    <h2 class="font-bold text-lg">{{ $specimen['specimen_name'] }}</h2>

    <p>This is views/specimens/show.blade.php</p>

    <p>
        Common Name: {{ $specimen['common_name'] }}.
    </p>

    <p class="mt-6">
        <x-button href="/specimens/{{ $specimen->id }}/edit">Edit Specimen</x-button>
    </p>
</x-layout>
