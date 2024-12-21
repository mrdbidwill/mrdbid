@extends('layouts.app')

@section('content')

    This is views/data_sources/show.blade.php
        {{-- Show file address if in development environment --}}
    <x-specimens-nav-bar></x-specimens-nav-bar>@if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/</p>
    @endif


    <h1>Data Source: {{ $data_source->title }}</h1>

    <table
        class="w-full table-auto bg-indigo-100 border-separate border border-4-rounded rounded-lg outline-slate-100 outline-4">
        <!-- begin basic specimens table -->
        <tr>
            <td class="p-2">
    Author: {{ $data_source->author }}
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2" colspan="2">
    Type: {{ $data_source->type }}
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2" colspan="2">
    Comment: {{ $data_source->comment }}
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2" colspan="2">
    My Rating: {{ $data_source->my_rating }}
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2" colspan="2">
    My Comment: {{ $data_source->my_comment }}
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2" colspan="2">
    Entered By: {{ $data_source->entered_by }}
            </td>
        </tr>


@endsection


