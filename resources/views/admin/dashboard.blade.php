@extends('layouts.app')

@section('content')

    <div class="container">
        <x-admin-dashboard-nav-bar/>

        {{-- Show file address if in development environment --}}
        @if (config('app.env') === 'local')
            <p class="text-gray-500 mt-4">File Address: /resources/views/admin/dashboard.blade.php</p>
        @endif

        <div class="flex justify-center items-center h-full">
            <h1 class="text-green-500 text-4xl">Admin Dashboard</h1>
        </div>

        <p class="mt-2 text-xl text-black">Is this page needed?</p>

        <p class="mt-2 text-xl text-black">The Admin options available are all in the menu buttons above.</p>

    </div>
@endsection


