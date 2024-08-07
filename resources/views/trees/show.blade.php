<x-layout>
    <x-slot:heading>
        Tree
    </x-slot:heading>

    <h2 class="font-bold text-lg">{{ $tree['tree_name'] }}</h2>

    <p>
        Common Name: {{ $tree['common_name'] }}.
    </p>

    <p class="mt-6">
        <x-button href="/specimens/{{ $specimen->id }}/edit">Edit Tree</x-button>
    </p>
</x-layout>
