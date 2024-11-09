@extends('layouts.app')

@section('content')

    <x-slot:heading>
        Character
    </x-slot:heading>


    <h2 class="font-bold text-lg">{{ $character->name }}</h2>

    <p>
        This character pays {{ $character->display_option }} per year. </p>
    <p class="mt-6">
        <x-button href="/characters/{{ $character->id }}/edit">Edit Character</x-button>
    </p>
@endsection


