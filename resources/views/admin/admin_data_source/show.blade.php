@extends('layouts.app')

@section('content')

    <x-admin-dashboard-nav-bar></x-admin-dashboard-nav-bar>
    <p>This is resources/views/admin/admin_data_source_table/show.blade.php</p>


    <h2 class="font-bold text-lg">{{ $data_source_table->name }}</h2>

    <p>
        This data_source pays {{ $data_source_table->display_option }} per year. </p>
    <p class="mt-6">
        <x-button href="/data_sources/{{ $data_source_table->id }}/edit">Edit data_source</x-button>
    </p>
@endsection


