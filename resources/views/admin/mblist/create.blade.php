@extends('layouts.app')

@section('content')

    <x-admin-dashboard-nav-bar></x-admin-dashboard-nav-bar>
    @if (Session::has('message'))
        <div class="text-3xl text-red-700">{{ Session::get('message') }}</div>
    @endif
    <p>(resources/views/admin/mblist/create.blade.php)</p>

@endsection


