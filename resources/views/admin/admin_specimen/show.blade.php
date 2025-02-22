@extends('layouts.app')

@section('content')

    <x-admin-dashboard-nav-bar></x-admin-dashboard-nav-bar>


    {{-- Show file address if in development environment --}}
    @if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/admin/admin_specimen/show.blade.php</p>
    @endif

    <h2 class="font-bold text-lg">{{ $specimen->name }}</h2>

    <p>{{ $specimen->common_name }}   {{ $specimen->description }} {{ $specimen->comment }}</p>

@endsection


