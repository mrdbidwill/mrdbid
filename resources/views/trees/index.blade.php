@extends('layouts.app')

@section('content')

    <x-slot:heading>
        Tree Listings
    </x-slot:heading>

    <div class="space-y-4">
        @foreach ($trees as $tree)
            <a href="/trees/{{ $tree['id'] }}" class="block px-4 py-6 border border-gray-200 rounded-lg">
                <div class="font-bold text-blue-500 text-sm">{{ $tree['specimen_name'] }}</div>

                <div>
                    <strong>{{ $tree['common_name'] }}:</strong> {{ $tree['description'] }} {{ $tree['comment'] }}
                    {{ $tree['specimen_location_now'] }} {{ $tree['location_found_city'] }} {{ $tree['location_found_county'] }} {{ $tree['state'] }} {{ $tree['country'] }}  {{ $tree['location_public_y_n'] }}     {{ $tree['share_data_y_n'] }} {{ $tree['month_found'] }}
                    -{{ $tree['day_found'] }}-{{ $tree['year_found'] }} {{ $tree['fungus_type'] }}
                </div>
            </a>
        @endforeach

        <div>
            {{ $trees->links() }}
        </div>
    </div>
@endsection


