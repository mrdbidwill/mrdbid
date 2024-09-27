<x-layout>
    <x-specimens-nav-bar></x-specimens-nav-bar>

    <h2 class="font-bold text-lg">{{ $character->name }}</h2>

    <p>
        This character pays {{ $character->display_option }} per year.
    </p>
    <p class="mt-6">
        <x-button href="/characters/{{ $character->id }}/edit">Edit Character</x-button>
    </p>
</x-layout>
