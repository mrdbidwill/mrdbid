<x-layout>
    <x-slot:heading>
        Specimen Group Listings
    </x-slot:heading>

    <p>This is views/specimen_groups/index.blade.php.</p>

    <div class="space-y-4">
        @foreach ($specimen_groups as $specimen_group)
            <a href="/specimen_group/{{ $specimen_group['id'] }}/edit"
               class="block px-4 py-6 border border-gray-200 rounded-lg">
                <div
                    class="font-bold text-blue-500 text-sm">{{ $specimen_group['name'] }} {{ $specimen_group['description'] }}
                    - {{ $specimen_group['comments'] }}</div>
            </a>

        @endforeach

        <div>
            {{ $specimen_groups->links() }}
        </div>
    </div>
</x-layout>
