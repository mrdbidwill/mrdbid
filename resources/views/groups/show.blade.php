@extends('layouts.app')

@section('content')

    <x-specimens-nav-bar/>

    {{-- Show file address if in development environment --}}
    @if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/groups/show.blade.php</p>
    @endif

    <p>
        {{ $group->name }}  {{ $group->description }} </p>

@endsection


