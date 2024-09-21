<x-layout>
    <x-slot:heading>
        Specimen Clusters
    </x-slot:heading>
    <p>This is views/specimen_clusters/index.blade.php.</p>

    <div class="space-y-4">
        @foreach ($specimen_clusters as $specimen_cluster)
            <a href="/{{ route('specimen_cluster.edit') }}/{{ $specimen_cluster['id'] }}"
               class="block px-4 py-6 border border-gray-200 rounded-lg">
                <div class="font-bold text-blue-500 text-sm">{{ $specimen_cluster['name'] }}</div>
            </a>
            <div>
                {{ $specimen_cluster['description'] }} - {{ $specimen_cluster['comments'] }}
            </div>
        @endforeach

        <div>
            {{ $specimen_clusters->links() }}
        </div>
    </div>
</x-layout>
