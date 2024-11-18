@php
    use App\Models\ImageSpecimen;  use App\Models\Specimen;use App\Utils\ImageUtils;use Illuminate\Support\Facades\DB ;
    //dd($specimens);
@endphp@extends('layouts.app')

@section('content')

    <x-specimens-nav-bar></x-specimens-nav-bar>

<h2>Comparison Results</h2>
<!-- Display your comparison results here -->

    </@endsection
