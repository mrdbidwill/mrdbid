@props(['active' => false])@php
    $isSpecimens = request()->routeIs('specimens.index');
@endphp

<nav>
    @if (!$isSpecimens)
        <x-specimens-nav-link href="{{ route('specimens.index') }}" :active="request()->routeIs('specimens.index')">
            Back to Specimens
        </x-specimens-nav-link>
    @endif

    <x-specimens-nav-link href="{{ route('specimens.create') }}" :active="request()->routeIs('specimens.create')">
        Add Specimen
    </x-specimens-nav-link>

    <x-specimens-nav-link href="{{ route('character_specimens.index') }}"
                          :active="request()->routeIs('character_specimens.index')">
        Characters
    </x-specimens-nav-link>

    {{--
<x-specimens-nav-link href="{{ route('specimens/lookup/data_sources.blade.php') }}"
                      :active="request()->routeIs('specimens/lookup/data_sources.blade.php')">
    Add Data Source
</x-specimens-nav-link>
    --}}
    <x-specimens-nav-link href="{{ route('specimen_cluster.index') }}"
                          :active="request()->routeIs('specimens_cluster.index')">
        Manage Clusters
    </x-specimens-nav-link>

    <x-specimens-nav-link href="{{ route('specimen_group.index') }}"
                          :active="request()->routeIs('specimens_group.index')">
        Manage Groups
    </x-specimens-nav-link>

    <!-- Add more links as needed -->
</nav>
