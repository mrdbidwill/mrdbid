<x-layout>
    <x-slot:heading>
        Admin: Specimen Table
    </x-slot:heading>


    <h2 class="font-bold text-lg">{{ $character_table->name }}</h2>

    <p>
        This character pays {{ $character_table->display_option }} per year.
    </p>
    <p class="mt-6">
        <x-button href="/characters/{{ $character_table->id }}/edit">Edit Character</x-button>
    </p>
</x-layout>
