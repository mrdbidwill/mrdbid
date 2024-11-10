@extends('layouts.app')

@section('content')

    <x-specimens-nav-bar></x-specimens-nav-bar>

    <h2 class="font-bold text-lg">{{ $character->name }}</h2>

    <p>
        This character display_option {{ $character->display_option }} . </p>
    <p class="mt-6">
        <x-button href="/characters/{{ $character->id }}/edit">Edit Character</x-button>
    </p>
@endsection


