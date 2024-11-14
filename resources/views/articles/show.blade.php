@extends('layouts.app')

@section('content')
    <div class="w-full max-w-4xl p-6 bg-white rounded-lg shadow-lg mx-auto">
        <p>This is views/articles/show.blade.php</p>

        <h1>Title: {{ $articles->title }}</h1>

        <p>Author: {{ $articles->user_id }}</p>

        <p>{{ $articles->body }}</p>

        <p>Created: {{ $articles->created_at }}</p>

        <p>Last Edit: {{ $articles->updated_at }}</p>

    </div>
@endsection


