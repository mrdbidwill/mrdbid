<x-layout>
    <x-slot:heading>
        Specimen Clusters
    </x-slot:heading>
    <p>This is views/specimen_clusters/index.blade.php.</p>

    <div class="space-y-4">
        @foreach ($specimen_clusters as $specimen_cluster)
            <a href="/characters/{{ $character['id'] }}" class="block px-4 py-6 border border-gray-200 rounded-lg">
                <div class="font-bold text-blue-500 text-sm">{{ $specimen_cluster['name'] }}</div>
            </a>
            <div>
                {{ $specimen_cluster['description'] }} - {{ $specimen_cluster['comments'] }}
            </div>
        @endforeach

        <div>
            {{ $specimen_cluster->links() }}
        </div>
    </div>
</x-layout>
