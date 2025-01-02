@php
    // dd($specimens);
@endphp

@extends('layouts.app')

@section('content')

    {{-- Show file address if in development environment --}}

    @if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/specimens/index.blade.php</p>
    @endif


    @if (Session::has('message'))
        <div class="text-3xl text-red-700">{{ Session::get('message') }}</div>
    @endif

    <!-- <p>resources/views/specimens/index.blade.php</p>  -->


    <!-- if no specimens are found, display message -->
    @if ($specimens->count() == 0)
        <p class="text-red-500">No specimens found.</p>
    @endif

    <div class="container">
        <h1>Specimens Sample List</h1>

        <p>To actually do anything useful you need to register and log in. This list shows some of what is possible to record, retrieve, and compare.</p>

        @foreach ($specimens as $specimen)
            <div>
                <p>
                    <strong>Specimen ID:</strong> {{ $specimen['id'] }} <br>
                    <strong>Specimen Name:</strong> {{ $specimen['specimen_name'] }}
                    <strong>City:</strong> {{ $specimen['location_found_city'] }}
                    <strong>County:</strong> {{ $specimen['location_found_county'] }}
                    <strong>State:</strong> {{ $specimen['state']['name'] ?? 'Unknown State' }}
                    <strong>Country:</strong> {{ $specimen['country']['name'] ?? 'Unknown Country' }} <br>
                </p>
            </div>
        @endforeach

        <!-- Pagination links -->
        {{ $specimens->onEachSide(3)->links() }}
    </div>
@endsection


