<x-layout>
    <x-slot:heading>
        Character
    </x-slot:heading>
    <div class="sm:flex-auto">
        <h1 class="text-base font-semibold leading-6 text-black">Characters
            (character_specimens/show.blade.php)</h1>
        @if(isset($message))
            <p class="mt-2 text-sm text-black">{{$message}}</p>
        @endif
        @php
            //dd($specimens);
        @endphp
        <p class="mt-2 text-sm text-black">Use this list to add characters to your specimen.</p>
    </div>

    <h2 class="font-bold text-lg">{{ $specimens->name }}</h2>

    <p>
        This character pays {{ $specimens->display_option }} per year.
    </p>
    <p class="mt-6">
        <x-button href="/characters/{{ $specimens->id }}/edit">Edit Character</x-button>
    </p>
</x-layout>
