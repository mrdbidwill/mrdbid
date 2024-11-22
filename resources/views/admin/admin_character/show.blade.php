@extends('layouts.app')

@section('content')

    <x-admin-dashboard-nav-bar></x-admin-dashboard-nav-bar>
    <p>This is resources/views/admin/admin_character/show.blade.php</p>


    <h2 class="font-bold text-lg">{{ $character_table->name }}</h2>

    <p>
        This character pays {{ $character_table->display_option }} per year. </p>
    <p class="mt-6">
        <x-button href="/characters/{{ $character_table->id }}/edit">Edit Character</x-button>
    </p>
@endsection


