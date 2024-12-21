@php use Illuminate\Support\Facades\DB;
@endphp@extends('layouts.app')

@section('content')

        {{-- Show file address if in development environment --}}
    <x-specimens-nav-bar></x-specimens-nav-bar>

        @if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/specimen_clusters/show.blade.php</p>
    @endif

    <h1>specimen_clusters.show.blade.php</h1>

    //dd($specimen_clusters);
    @foreach ($specimen_clusters as $specimen_cluster)

        <p>Cluster: {{$specimen_cluster['name']}} Description: {{$specimen_cluster['description']}}
            Comments: {{$specimen_cluster['comments']}}</p>

    @endforeach
@endsection


