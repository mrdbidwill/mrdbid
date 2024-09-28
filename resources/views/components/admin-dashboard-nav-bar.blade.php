@props(['active' => false])@php
    $isAdmin = request()->routeIs('admin/dashboard');
@endphp

<nav>
    @if (!$isAdmin)
        <x-specimens-nav-link href="{{ route('admin_dashboard') }}" :active="request()->routeIs('admin_dashboard')">
            Back to Admin Dashboard
        </x-specimens-nav-link>
    @endif

    <x-specimens-nav-link href="{{ route('admin_specimen_table.index') }}"
                          :active="request()->routeIs('admin_specimen_table.index')">
        Manage Specimen Table
    </x-specimens-nav-link>

    <x-specimens-nav-link href="{{ route('admin_character_table.index') }}"
                          :active="request()->routeIs('admin_character_table.index')">
        Manage Character Table
    </x-specimens-nav-link>

    <x-specimens-nav-link href="{{ route('admin_lookup_table.index') }}"
                          :active="request()->routeIs('admin_lookup_table.index')">
        Manage Lookup Tables
    </x-specimens-nav-link>

    <x-specimens-nav-link href="{{ route('admin.exportDatabase.index') }}"
                          :active="request()->routeIs('admin.exportDatabase.index')">
        Export Database
    </x-specimens-nav-link>


    <!-- Add more links as needed -->
</nav>
