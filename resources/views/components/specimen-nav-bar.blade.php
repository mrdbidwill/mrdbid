@props(['active' => false])
<nav class="bg-gray-100">
    <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div class="flex h-16 items-center justify-center">
            <div class="flex items-center">
                <div class="hidden md:block">
                    @auth
                        <div class="flex justify-center gap-2">
                            <a href="{{ route('specimens.create') }}"
                               class="px-4 py-2 bg-blue-500 text-white rounded-lg">Add Specimen</a>


                            <x-nav-link :href="route('specimens.create')"
                                        :active="request()->routeIs('specimens.create')">
                                <a class="{{ request()->routeIs('specimens.create') ? 'nav-link-active' : 'nav-link' }}">
                                    Add Specimen (Active)
                                </a>
                            </x-nav-link>


                            <a href="{{ route('specimen_compare.index') }}"
                               class="px-4 py-2 bg-blue-500 text-white rounded-lg">Compare Specimens</a>

                            <a href="{{ route('specimen_cluster.index') }}"
                               class="px-4 py-2 bg-blue-500 text-white rounded-lg">Manage Clusters</a>

                            <a href="{{ route('specimen_group.index') }}"
                               class="px-4 py-2 bg-blue-500 text-white rounded-lg">Manage Groups</a>
                        </div>
                    @endauth
                </div>
            </div>
        </div>
    </div>
</nav>
