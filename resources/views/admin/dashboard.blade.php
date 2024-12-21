@extends('layouts.app')

@section('content')

    <div class="container">
        <x-admin-dashboard-nav-bar/>

        {{-- Show file address if in development environment --}}
        @if (config('app.env') === 'local')
            <p class="text-gray-500 mt-4">File Address: /resources/views/admin/mblist/dashboard.blade.php</p>
        @endif

        <div class="flex justify-center items-center h-full">
            <h1 class="text-green-500 text-4xl">MBList Dashboard</h1>
        </div>

        <p class="mt-2 text-xl text-black">The MBList is not created by mrdbid.</p>

        <p class="mt-2 text-xl text-black">The Admin options available are all in the menu buttons above.</p>

    </div>
@endsection


