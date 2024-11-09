@extends('layouts.app')

@section('content')

    <p>This is views/data_sources/edit.blade.php</p>
    <x-specimens-nav-bar></x-specimens-nav-bar>

    <h1>Edit Data Source</h1>
    <form action="{{ route('data_source.update', $data_source->id) }}" method="POST">
        @csrf
        @method('PUT')
        <!-- Form fields here -->
        <input type="text" name="title" value="{{ $data_source->title }}" placeholder="Title"><br> <input type="text"
                                                                                                          name="author"
                                                                                                          value="{{ $data_source->author }}"
                                                                                                          placeholder="Author"><br>
        <input type="text" name="type" value="{{ $data_source->type }}" placeholder="Type"><br> <textarea name="comment"
                                                                                                          placeholder="Comment">{{ $data_source->comment }}</textarea><br>
        <input type="number" name="my_rating" value="{{ $data_source->my_rating }}" placeholder="Rating"><br> <textarea
            name="my_comment" placeholder="My Comment">{{ $data_source->my_comment }}</textarea><br> <input type="text"
                                                                                                            name="entered_by"
                                                                                                            value="{{ $data_source->entered_by }}"
                                                                                                            placeholder="Entered By"><br>
        <button type="submit">Update</button>
    </form>
@endsection


