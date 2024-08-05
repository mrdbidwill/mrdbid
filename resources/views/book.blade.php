<x-layout>
    <x-slot:heading>
        Source Materials:
    </x-slot:heading>

    <h1>Source Materials:</h1>

    <p>I like books. While at home, they are near and available, regardless of power and technology.</p>

    <p>I get it. You can do internet search, where available. But a book always works.</p>

    <p>I recommend you buy all of these books, and more, if you are serious about learning about, well, just
        learning.</p>

    <p>I like libraries, but like to have my books available. Do what suits you best. (This list of books is more than
        my local library has.)</p>

    @foreach($books as $book)
        <p> {{ $book['title'] }} {{ $book['author'] }} - {{ $book['my_comment'] }}</p>
    @endforeach
</x-layout>
