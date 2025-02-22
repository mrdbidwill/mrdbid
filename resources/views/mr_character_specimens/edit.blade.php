@extends('layouts.app')

@section('content')

    <!-- Specimens Navigation -->
    <x-specimens-nav-bar/>

    {{-- Show file address if in development environment --}}
    @if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/character_specimens/edit.blade.php</p>
    @endif

    <x-notification message="{{ Session::get('message') }}"/>

    <div class="bg-gray-200 mx-auto max-w-7xl py-10 px-4 sm:px-6 lg:px-8">
        <!-- Quick Navigation Link -->
        <p class="text-blue-600 font-bold">
            <a href="#color-section">Jump to Color Selection</a>
        </p>
        <hr>
        <hr>
        <hr>
        @php
            // dd($setCharacters, $unsetCharacters, $colorCharacterNames, $specimenId);
        @endphp
        <p>
            character.manage-existing-characters :specimen-id="$specimenId" :setCharacters="$setCharacters" </p>

        <livewire:character.manage-existing-characters :specimen-id="$specimenId" :setCharacters="$setCharacters"/>
        <hr>
        <hr>
        <hr>
        <p>
            character.edit-unset-characters :specimen-id="$specimenId" :unset-characters="$unsetCharacters" </p>
        <!-- Unset Characters Component -->


        <livewire:character.edit-unset-characters :specimen-id="$specimenId" :unset-characters="$unsetCharacters"/>
        <hr>
        <hr>
        <hr>
        <p>
            character.color-selection :colors="$colors" :color-character-names="$colorCharacterNames"
            :list-of-set-characters="$setCharacters" :specimen-id="$specimenId" </p>
        <!-- Color Selection Component -->
        <livewire:character.color-selection :colors="$colors" :color-character-names="$colorCharacterNames"
                                            :list-of-set-characters="$setCharacters" :specimen-id="$specimenId"/>
        <hr>
        <hr>
        <hr>
    </div>
@endsection


