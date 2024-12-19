@extends('layouts.app')

@section('content')
    <x-specimens-nav-bar></x-specimens-nav-bar>
    <div class="w-full max-w-4xl p-6 bg-white rounded-lg shadow-lg mx-auto">
        <p>This is views/articles/show.blade.php</p>

        <h1>Title: {{ $article->title }}</h1>

        <p>Author: {{ $article->user_id }}</p>

        <p>{{ $article->body }}</p>

        <p>Created: {{ $article->created_at }}</p>

        <p>Last Edit: {{ $article->updated_at }}</p>

    </div>
@endsection


