@php
    $isDashboard = request()->routeIs('specimens.dashboard');
@endphp

<nav>
    @if (!$isDashboard)
        <x-dashboard-nav-link href="{{ route('specimens.dashboard') }}"
                              :active="request()->routeIs('specimens.dashboard')">
            Back to Dashboard
        </x-dashboard-nav-link>
    @endif

    <x-dashboard-nav-link href="{{ route('specimens.create') }}" :active="request()->routeIs('specimens.create')">
        Add Specimen
    </x-dashboard-nav-link>

    <x-dashboard-nav-link href="{{ route('specimen_cluster.index') }}"
                          :active="request()->routeIs('specimens_cluster.index')">
        Manage Clusters
    </x-dashboard-nav-link>

    <x-dashboard-nav-link href="{{ route('specimen_group.index') }}"
                          :active="request()->routeIs('specimens_group.index')">
        Manage Clusters
    </x-dashboard-nav-link>

    <!-- Add more links as needed -->
</nav>
