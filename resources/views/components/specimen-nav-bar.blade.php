<nav class="bg-gray-100">
    <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div class="flex h-16 items-center justify-between">
            <div class="flex items-center">

                <div class="hidden md:block">
                    <div class="ml-10 flex items-baseline space-x-4">


                        @auth
                            <div class="flex justify-end">
                                <a href="/specimens/cluster_create" class="px-4 py-2 bg-blue-500 text-white rounded-lg">Create
                                    New Cluster</a>
                                <a href="/specimens/cluster_create" class="px-4 py-2 bg-blue-500 text-white rounded-lg">Create
                                    New Group</a>
                                <a href="/specimens/cluster_create" class="px-4 py-2 bg-blue-500 text-white rounded-lg">Create
                                    New Specimen</a>
                                <a href="/specimens/cluster_create" class="px-4 py-2 bg-blue-500 text-white rounded-lg">Create
                                    Data File</a>
                            </div>
                        @endauth
                    </div>
                </div>


            </div>
        </div>
    </div>
</nav>
