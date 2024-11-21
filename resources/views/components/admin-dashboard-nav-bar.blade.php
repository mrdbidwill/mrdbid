@props(['active' => false])@php
    $isAdmin = request()->routeIs('admin.dashboard');
// dd($isAdmin);
@endphp

<nav>

<!-- resources/views/admin/dashboard.blade.php -->

    <title>Admin Dashboard</title>

<h1>Admin Dashboard</h1>


    @if (!$isAdmin)
        <x-admin-nav-link href="{{ route('admin.dashboard') }}">
            Back to Admin Dashboard
        </x-admin-nav-link>
    @endif

    <x-admin-nav-link href="{{ route('admin.specimens.index') }}"
                          :active="request()->routeIs('admin.specimens.index')">
        Manage Specimen Table
    </x-admin-nav-link>

    <x-admin-nav-link href="{{ route('admin.characters.index') }}"
                          :active="request()->routeIs('admin.characters.index')">
        Manage Character Table
    </x-admin-nav-link>

    <x-admin-nav-link href="{{ route('admin.lookups.index') }}" :active="request()->routeIs('admin.lookups.index')">
        Manage Lookup Tables
    </x-admin-nav-link>

    <x-admin-nav-link href="{{ route('admin.export_databases.index') }}"
                          :active="request()->routeIs('admin.export_databases.index')">
        Export Database
    </x-admin-nav-link>

    <x-admin-nav-link href="{{ route('admin.mblists.index') }}"
                          :active="request()->routeIs('admin.mblists.index')">
        Manage MBList Database
    </x-admin-nav-link>

</nav>
