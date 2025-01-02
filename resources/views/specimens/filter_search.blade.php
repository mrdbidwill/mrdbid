@extends('layouts.app')

@section('content')
    <div class="container">
        <x-specimen-filter :states="$states" :countries="$countries" />

        <!-- Display the filtered specimens -->
        <div class="mt-4">
            @foreach($specimens as $specimen)
                <div class="p-4 bg-gray-100 mb-2 rounded-md">
                    <h3 class="text-lg font-medium">{{ $specimen->specimen_name }}</h3>
                    <p class="text-sm text-gray-600">Found in {{ $specimen->location_found_city }}, {{ $specimen->location_found_county }}</p>
                </div>
            @endforeach

            <!-- Pagination -->
            <div class="mt-4">
                {{ $specimens->links() }}
            </div>
        </div>
    </div>
@endsection
