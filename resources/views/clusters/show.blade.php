@php use Illuminate\Support\Facades\DB;
@endphp@extends('layouts.app')

@section('content')

        {{-- Show file address if in development environment --}}
    <x-specimens-nav-bar></x-specimens-nav-bar>

        @if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/clusters/show.blade.php</p>
    @endif

    //dd($specimen_clusters);
    @foreach ($specimen_clusters as $specimen_cluster)

        <p>Cluster: {{$specimen_cluster['name']}} Description: {{$specimen_cluster['description']}}</p>

    @endforeach
@endsection


