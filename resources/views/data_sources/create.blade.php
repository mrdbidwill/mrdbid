@extends('layouts.app')

@section('content')

    <p>This is views/data_sources/create.blade.php</p>
    <x-specimens-nav-bar></x-specimens-nav-bar>

    <h1>Create Data Source</h1>
    <form action="{{ route('data_source.store') }}" method="POST">
        @csrf
        <!-- Form fields here -->
        <input type="text" name="title" placeholder="Title">
        <input type="text" name="author" placeholder="Author">
        <input type="text" name="asin" placeholder="ASIN 10 digit code"><br>
        <input type="text" name="type" placeholder="Type">
        <textarea name="comment" placeholder="Comment"></textarea>
        <input type="number" name="my_rating" placeholder="Rating">
        <textarea name="my_comment"
                                                                              placeholder="My Comment"></textarea>
        <input type="text" name="entered_by" placeholder="Entered By">
        <button type="submit">Create</button>
    </form>
@endsection


