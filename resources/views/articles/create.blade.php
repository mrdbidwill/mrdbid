@props(['active' => false])@php
    $isArticles = request()->routeIs('articles.index');
@endphp
@extends('layouts.app')

@section('content')

    <x-specimens-nav-bar></x-specimens-nav-bar>

    {{-- Show file address if in development environment --}}
    @if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/</p>
    @endif


    <p>This is views/articles/create.blade.php</p>

    <div class="flex justify-center">
        @if (!$isArticles)
            <x-button href="{{ route('articles.index') }}"
                      :active="request()->routeIs('articles.index')">
                Back to Articles
            </x-button>
        @endif
    </div>

    <h1>Create Article</h1>
    <div class="w-full max-w-4xl p-6 bg-white rounded-lg shadow-lg mx-auto">
        <form action="{{ route('articles.store') }}" method="POST" class="space-y-6">
            @csrf
            <!-- Form fields here -->
            <label for="title" class="block text-gray-700 font-bold mb-2">Article Title</label> <input type="text"

                                                                                                       name="title"

                                                                                                       id="title"

                                                                                                       placeholder="Type Title here..."

                                                                                                       class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">

            <label for="author" class="block text-gray-700 font-bold mb-2">Author</label> <input type="text"

                                                                                                 name="author"

                                                                                                 id="author"

                                                                                                 placeholder="Author goes here..."

                                                                                                 class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">

            <label for="body" class="block text-gray-700 font-bold mb-2">Article Body</label> <textarea name="body"

                                                                                                        id="body"

                                                                                                        placeholder="Type here..."

                                                                                                        class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"></textarea>

            <x-form-button type="submit">Create Article</x-form-button>
        </form>
    </div>
@endsection


