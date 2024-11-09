@extends('layouts.app')

@section('content')

    <!-- resources/views/book.blade.php -->
    <div class="container">
        <h1>Books Listing</h1>
        <div class="books">
            <ul role="list" class="space-y-3">
                @forelse ($books as $book)
                    <div class="book">
                        <li class="overflow-hidden rounded-md bg-white px-6 py-4 shadow">
                            <h2>{{ $book->title }}</h2>
                            <p class="mt-2">{{ $book->author }}</p>
                            <p class="mt-2">{{ $book->comment }}</p>
                            <p class="mt-2">MRDBID comment: {{ $book->my_comment }}</p>
                            <p class="mt-2">
                                <!-- {{--<a href="{{ $book->amazon_link }}" target="_blank">Buy on Amazon</a>  --}}  -->
                                Amazon Link </p>
                        </li>
                    </div>
                @empty
                    <p class="mt-2">No books available.</p>
                @endforelse
            </ul>
        </div>
    </div>
@endsection


