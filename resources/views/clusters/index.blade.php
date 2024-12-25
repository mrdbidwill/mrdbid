@extends('layouts.app')

@section('content')

    <x-specimens-nav-bar/>

    {{-- Show file address if in development environment --}}
    @if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/clusters/index.blade.php</p>
    @endif

    <p class="mt-2 text-xl text-black">These are <u>your</u> clusters. Use them as you wish.</p>

    <p class="text-fuchsia-700 text-center">
        <x-specimens-nav-link href="{{ route('clusters.create') }}"
                              :active="request()->routeIs('clusters.create')">
            Add New Cluster
        </x-specimens-nav-link>
    </p>

    <div class="space-y-1">
        @foreach ($clusters as $cluster)
            @php
                $months = array(1 => 'January', 2 => 'February', 3 => 'March', 4 => 'April', 5 => 'May', 6 => 'June', 7 => 'July', 8 => 'August', 9 => 'September', 10 => 'October', 11 => 'November', 12 => 'December');
            @endphp

            @if(in_array($cluster['name'], $months))

            @else
                <a href="/clusters/{{ $cluster['id'] }}/edit"
                   class="block px-1 py-1 border border-gray-200 rounded-lg">
                    <div class="font-bold text-blue-500 text-sm">{{ $cluster['name'] }} {{ $cluster['description'] }}
                        - {{ $cluster['comments'] }}</div>
                </a>
            @endif

        @endforeach

        <div>
            {{ $clusters->links() }}
        </div>
    </div>
@endsection


