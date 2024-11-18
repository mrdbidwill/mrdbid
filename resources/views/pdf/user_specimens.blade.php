@php
    use App\Models\ImageSpecimen;  use App\Models\Specimen;use App\Utils\ImageUtils;use Illuminate\Support\Facades\DB ;
    //dd($specimens);
@endphp@extends('layouts.app')

@section('content')

    <x-specimens-nav-bar></x-specimens-nav-bar>
<h1>User Specimens</h1>
@foreach ($specimens as $specimen)
    <div>
        <h2>{{ $specimen->name }}</h2>
        <p>{{ $specimen->description }}</p>
        @foreach ($specimen->characterSpecimens as $character)
            <p>{{ $character->name }}: {{ $character->value }}</p>
        @endforeach
        <img src="{{ public_path('storage/' . $specimen->image) }}" alt="{{ $specimen->name }}" />
    </div>
@endforeach
</@endsection>
