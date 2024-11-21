@extends('layouts.app')

@section('content')

    <x-admin-dashboard-nav-bar></x-admin-dashboard-nav-bar>


    <h2 class="font-bold text-lg">{{ $specimen->name }}</h2>
    <p>resources/views/admin/admin_specimen/show.blade.php</p>
    <p>{{ $specimen->common_name }}   {{ $specimen->description }} {{ $specimen->comment }}</p>

@endsection


