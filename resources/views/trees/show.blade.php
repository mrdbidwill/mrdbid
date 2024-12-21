@extends('layouts.app')

@section('content')

        {{-- Show file address if in development environment --}}
    <x-specimens-nav-bar></x-specimens-nav-bar>@if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/</p>
    @endif



    <h2 class="font-bold text-lg">{{ $tree['tree_name'] }}</h2>

    <p>
        Common Name: {{ $tree['common_name'] }}. </p>

    <p class="mt-6">
        <x-button href="/specimens/{{ $specimen->id }}/edit">Edit Tree</x-button>
    </p>
@endsection


