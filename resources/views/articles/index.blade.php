@props(['active' => false])@php
    $isArticles = request()->routeIs('articles.index');
@endphp
@extends('layouts.app')

@section('content')

    <x-specimens-nav-bar></x-specimens-nav-bar>

    {{-- Show file address if in development environment --}}
     @if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/articles/index.blade.php</p>
    @endif

    <h1>Articles</h1>
    <a href="{{ route('articles.create') }}">Create New Article</a>
    <ul>
        @foreach ($articles as $article)
            @php
                // dd( $article->id);  // works here
             //dd( $memberType);
            @endphp
            <li class="overflow-hidden rounded-md bg-white px-6 py-4 shadow">
                @php //dd($article->title); @endphp
                {{ $article->title ?? 'N/A' }}
                <a href="{{ route('articles.show', $article->id) }}">View</a> <a
                    href="{{ route('articles.edit', $article->id) }}">Edit</a>
                @if ($memberType <= 2)
                    <form action="{{ route('articles.destroy', $article->id) }}" method="POST" style="display:inline;">
                        @csrf
                        @method('DELETE')
                        <button type="submit">Delete</button>
                    </form>
                @endif
            </li>
        @endforeach
    </ul>
@endsection


