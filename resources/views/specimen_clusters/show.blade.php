@php use Illuminate\Support\Facades\DB;
@endphp@extends('layouts.app')

@section('content')

    <x-specimens-nav-bar></x-specimens-nav-bar>
    <h1>specimen_clusters.show.blade.php</h1>

    //dd($specimen_clusters);
    @foreach ($specimen_clusters as $specimen_cluster)

        <p>Cluster: {{$specimen_cluster['name']}} Description: {{$specimen_cluster['description']}}
            Comments: {{$specimen_cluster['comments']}}</p>

    @endforeach
@endsection


