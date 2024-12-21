@extends('layouts.app')

@section('content')

    <x-admin-dashboard-nav-bar></x-admin-dashboard-nav-bar>

    {{-- Show file address if in development environment --}}
    @if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/admin/admin_data_source/show.blade.php</p>
    @endif


    <h2 class="font-bold text-lg">{{ $data_source_table->name }}</h2>

    <p>
        This data_source pays {{ $data_source_table->display_option }} per year. </p>
    <p class="mt-6">
        <x-button href="/data_sources/{{ $data_source_table->id }}/edit">Edit data_source</x-button>
    </p>
@endsection


