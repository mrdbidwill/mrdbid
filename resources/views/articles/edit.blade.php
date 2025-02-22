@extends('layouts.app')

@section('content')

    <x-specimens-nav-bar></x-specimens-nav-bar>

    {{-- Show file address if in development environment --}}
    @if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/articles/edit.blade.php</p>
    @endif


    <h1>Edit Article</h1>
    <div class="w-full max-w-4xl p-6 bg-white rounded-lg shadow-lg mx-auto">
        <form action="/articles/{{$article->id}}" method="POST" class="space-y-6">
            @csrf
            @method('PUT')
            <!-- Form fields here -->
            <label for="title" class="block text-gray-700 font-bold mb-2">Article Title</label> <input type="text"
                                                                                                       name="title"
                                                                                                       value="{{ $article->title }}"
                                                                                                       placeholder="Title"
                                                                                                       class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"><br>

            <label for="author" class="block text-gray-700 font-bold mb-2">Author</label> <input type="text"
                                                                                                 name="user_id"
                                                                                                 value="{{ $article->user_id }}"
                                                                                                 placeholder="Author"
                                                                                                 class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"><br>

            <label for="body" class="block text-gray-700 font-bold mb-2">Article Body</label> <textarea name="body"
                                                                                                        placeholder="Type here..."
                                                                                                        class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">{{ $article->body }}</textarea><br>

            <x-form-button type="submit">Update</x-form-button>
        </form>
    </div>
@endsection


