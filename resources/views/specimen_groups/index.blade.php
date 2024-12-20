@extends('layouts.app')

@section('content')

    <x-specimens-nav-bar/>

    <p>resources/views/specimen_groups/index.blade.php</p>

    <p class="mt-2 text-xl text-black">These are <u>your</u> groups. Some are created automatically when a specimen is created, such as the months of the year. These month groups can not be edited or deleted, so they are not shown here. You do not have to use them. You can also create your own version, just give them a different name.</p>

    <p class="text-fuchsia-700 text-center">
        <x-specimens-nav-link href="{{ route('specimen_groups.create') }}"
                              :active="request()->routeIs('specimen_groups.create')">
            Add New Group
        </x-specimens-nav-link>
    </p>

    <div class="space-y-1">
        @foreach ($specimen_groups as $specimen_group)
            @php
            $months = array(1 => 'January', 2 => 'February', 3 => 'March', 4 => 'April', 5 => 'May', 6 => 'June', 7 => 'July', 8 => 'August', 9 => 'September', 10 => 'October', 11 => 'November', 12 => 'December');
            @endphp

            @if(in_array($specimen_group['name'], $months))

            @else
            <a href="/specimen_groups/{{ $specimen_group['id'] }}/edit"
               class="block px-1 py-1 border border-gray-200 rounded-lg">
                <div class="font-bold text-blue-500 text-sm">{{ $specimen_group['name'] }} {{ $specimen_group['description'] }}
                    - {{ $specimen_group['comments'] }}</div>
            </a>
            @endif

        @endforeach

        <div>
            {{ $specimen_groups->links() }}
        </div>
    </div>
@endsection


