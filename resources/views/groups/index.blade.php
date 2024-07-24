<x-layout>
    <x-slot:heading>
        Character Listings
    </x-slot:heading>

    <div class="space-y-4">
        @foreach ($characters as $character)
            <a href="/characters/{{ $character['id'] }}" class="block px-4 py-6 border border-gray-200 rounded-lg">
                <div class="font-bold text-blue-500 text-sm">{{ $character['name'] }}</div>
            </a>
            <div>
                {{ $character['display_options'] }} - {{ $character['look_up_y_n'] }} - {{ $character['part'] }}
                - {{ $character['source'] }} - {{ $character['entered_by'] }}

            </div>
        @endforeach

        <div>
            {{ $characters->links() }}
        </div>
    </div>
</x-layout>
