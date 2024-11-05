@props(['active' => false])@php
    $isSpecimens = request()->routeIs('specimens.index');
@endphp

<nav class="bg-gray-100 p-4">
    <div class="container mx-auto flex justify-between items-center">
        <!-- Standard navigation links -->
        <div class="hidden md:flex space-x-4">
            @if (!$isSpecimens)
                <x-specimens-nav-link href="{{ route('specimens.index') }}"
                                      :active="request()->routeIs('specimens.index')">
                    Back to Specimens
                </x-specimens-nav-link>
            @endif

            <x-specimens-nav-link href="{{ route('specimens.create') }}"
                                  :active="request()->routeIs('specimens.create')">
                Add Specimen
            </x-specimens-nav-link>

            <x-specimens-nav-link href="{{ route('character_specimens.index') }}"
                                  :active="request()->routeIs('character_specimens.index')">
                Characters
            </x-specimens-nav-link>

            <x-specimens-nav-link href="{{ route('data_source.index') }}"
                                  :active="request()->routeIs('data_source.index')">
                Add Data Source
            </x-specimens-nav-link>

            <x-specimens-nav-link href="{{ route('specimen_cluster.index') }}"
                                  :active="request()->routeIs('specimens_cluster.index')">
                Manage Clusters
            </x-specimens-nav-link>

            <x-specimens-nav-link href="{{ route('specimen_group.index') }}"
                                  :active="request()->routeIs('specimens_group.index')">
                Manage Groups
            </x-specimens-nav-link>
        </div>
        <!-- End Standard navigation links -->
        <!-- Hamburger menu for mobile -->
        <div class="md:hidden">
            <button type="button" class="text-gray-300 hover:text-white focus:outline-none"
                    onclick="toggleMenu('specimens-menu')">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                     xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M4 6h16M4 12h16M4 18h16"></path>
                </svg>
            </button>
        </div>

        <!-- End Mobile Navigation links -->
        <div id="specimens-menu" class="hidden md:hidden">
            @if (!$isSpecimens)
                <x-specimens-nav-link href="{{ route('specimens.index') }}"
                                      :active="request()->routeIs('specimens.index')">
                    Back to Specimens
                </x-specimens-nav-link>
            @endif

            <x-specimens-nav-link href="{{ route('specimens.create') }}"
                                  :active="request()->routeIs('specimens.create')">
                Add Specimen
            </x-specimens-nav-link>

            <x-specimens-nav-link href="{{ route('character_specimens.index') }}"
                                  :active="request()->routeIs('character_specimens.index')">
                Characters
            </x-specimens-nav-link>

            <x-specimens-nav-link href="{{ route('data_source.index') }}"
                                  :active="request()->routeIs('data_source.index')">
                Add Data Source
            </x-specimens-nav-link>

            <x-specimens-nav-link href="{{ route('specimen_cluster.index') }}"
                                  :active="request()->routeIs('specimens_cluster.index')">
                Manage Clusters
            </x-specimens-nav-link>

            <x-specimens-nav-link href="{{ route('specimen_group.index') }}"
                                  :active="request()->routeIs('specimens_group.index')">
                Manage Groups
            </x-specimens-nav-link>
        </div>
        <!-- End Mobile navigation links -->
    </div>
</nav>

<script>
    function toggleMenu(menuId) {
        var element = document.getElementById(menuId);
        element.classList.toggle("hidden");
    }
</script>
