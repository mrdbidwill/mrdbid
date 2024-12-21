@props(['active' => false])@php
    $isArticles = request()->routeIs('articles.index');
@endphp
@extends('layouts.app')

@section('content')

    <x-specimens-nav-bar></x-specimens-nav-bar>

    {{-- Show file address if in development environment --}}
    @if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/articles/show.blade.php</p>
    @endif

    <div class="w-full max-w-4xl p-6 bg-white rounded-lg shadow-lg mx-auto">

        <div class="flex justify-center">
            @if (!$isArticles)
                <x-button href="{{ route('articles.index') }}"
                                      :active="request()->routeIs('articles.index')">
                    Back to Articles
                </x-button>
            @endif
        </div>

        <h1>Title: {{ $article->title }}</h1>

        <p>Author: {{ $article->user_id }}</p>

        <p>{{ $article->body }}</p>

        <p>Created: {{ $article->created_at }}</p>

        <p>Last Edit: {{ $article->updated_at }}</p>

    </div>
@endsection


