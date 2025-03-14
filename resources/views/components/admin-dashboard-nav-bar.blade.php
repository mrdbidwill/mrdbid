@props(['active' => false])

<nav>
    @if (!Route::is('admin.dashboard'))
        <x-specimens-nav-link href="{{ route('admin.dashboard') }}">
            Back to Admin Dashboard
        </x-specimens-nav-link>
    @endif


    <x-specimens-nav-link href="{{ route('admin.specimens.index') }}"
                          :active="request()->routeIs('admin.specimens.index')">
        Manage Specimen Table
    </x-specimens-nav-link>

    <x-specimens-nav-link href="{{ route('admin.mr_characters.index') }}"
                          :active="request()->routeIs('admin.mr_characters.index')">
        Manage Character Table
    </x-specimens-nav-link>

    <x-specimens-nav-link href="{{ route('admin.lookups.index') }}" :active="request()->routeIs('admin.lookups.index')">
        Manage Lookup Tables
    </x-specimens-nav-link>

    <x-specimens-nav-link href="{{ route('admin.export_databases.export') }}"
                          :active="request()->routeIs('admin.export_database.export')">
        Export Database
    </x-specimens-nav-link>


    <!-- Add more links as needed -->
</nav>
