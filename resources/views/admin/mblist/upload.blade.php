@extends('layouts.app')

@section('content')

    <x-admin-dashboard-nav-bar></x-admin-dashboard-nav-bar>

<h1>Upload MBList</h1>
@if($errors->any())
    <div>
        <strong>Error:</strong> {{ $errors->first() }}
    </div>
@endif

@if(session('success'))
    <div>
        <strong>Success:</strong> {{ session('success') }}
    </div>
@endif

<form action="{{ route('admin.mblist.upload') }}" method="POST" enctype="multipart/form-data">
    @csrf
    <div>
        <input type="file" name="zip_file" required>
    </div>
    <button type="submit">Upload</button>
</form>

    </@endsection>
