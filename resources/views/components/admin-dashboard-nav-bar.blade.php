@props(['active' => false])@php
    $isAdmin = request()->routeIs('admin_dashboard');
@endphp

<nav>
    @if (!$isAdmin)
        <x-specimens-nav-link href="{{ route('admin_dashboard') }}">
            Back to Admin Dashboard
        </x-specimens-nav-link>
    @endif

    <x-specimens-nav-link href="{{ route('admin_specimen.index') }}"
                          :active="request()->routeIs('admin_specimen.index')">
        Manage Specimen Table
    </x-specimens-nav-link>

    <x-specimens-nav-link href="{{ route('admin_character.index') }}"
                          :active="request()->routeIs('admin_character.index')">
        Manage Character Table
    </x-specimens-nav-link>

    <x-specimens-nav-link href="{{ route('admin_lookup.index') }}" :active="request()->routeIs('admin_lookup.index')">
        Manage Lookup Tables
    </x-specimens-nav-link>

    <x-specimens-nav-link href="{{ route('admin_export_database.index') }}"
                          :active="request()->routeIs('admin_export_database.index')">
        Export Database
    </x-specimens-nav-link>


    <!-- Add more links as needed -->
</nav>
