@extends('layouts.app')

@section('content')

    <p>This is views/data_sources/show.blade.php</p>
    <x-specimens-nav-bar></x-specimens-nav-bar>

    <h1>Data Source: {{ $data_source->title }}</h1>
    <p>Author: {{ $data_source->author }}</p>
    <p>Type: {{ $data_source->type }}</p>
    <p>Comment: {{ $data_source->comment }}</p>
    <p>My Rating: {{ $data_source->my_rating }}</p>
    <p>My Comment: {{ $data_source->my_comment }}</p>
    <p>Entered By: {{ $data_source->entered_by }}</p>
    <a href="{{ route('data_source.edit', $data_source->id) }}">Edit</a>
    <form action="{{ route('data_source.destroy', $data_source->id) }}" method="POST" style="display:inline;">
        @csrf
        @method('DELETE')
        <button type="submit">Delete</button>
    </form>
@endsection


