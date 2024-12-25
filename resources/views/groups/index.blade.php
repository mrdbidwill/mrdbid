@extends('layouts.app')

@section('content')

    <x-specimens-nav-bar/>

    {{-- Show file address if in development environment --}}
    @if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/groups/index.blade.php</p>
    @endif

    <p class="mt-2 text-xl text-black">These are <u>your</u> groups. Some are created automatically when a specimen is created, such as the months of the year. These month groups can not be edited or deleted, so they are not shown here. You do not have to use them. You can also create your own version, just give them a different name.</p>

    <p class="text-fuchsia-700 text-center">
        <x-specimens-nav-link href="{{ route('groups.create') }}"
                              :active="request()->routeIs('groups.create')">
            Add New Group
        </x-specimens-nav-link>
    </p>

    <div class="space-y-1">
        @foreach ($groups as $group)
            @php
            $months = array(1 => 'January', 2 => 'February', 3 => 'March', 4 => 'April', 5 => 'May', 6 => 'June', 7 => 'July', 8 => 'August', 9 => 'September', 10 => 'October', 11 => 'November', 12 => 'December');
            @endphp

            @if(in_array($group['name'], $months))

            @else
            <a href="/groups/{{ $group['id'] }}/edit"
               class="block px-1 py-1 border border-gray-200 rounded-lg">
                <div class="font-bold text-blue-500 text-sm">{{ $group['name'] }} {{ $group['description'] }}</div>
            </a>
            @endif

        @endforeach

        <div>
            {{ $groups->links() }}
        </div>
    </div>
@endsection


