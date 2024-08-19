<x-layout>
    <x-slot:heading>
        Source Materials:
    </x-slot:heading>

    <h1 class="font-extrabold">Source Materials:</h1>
    

    <ol class="list-decimal">

        @foreach($books as $book)

            <li> {{ $book['title'] }} {{ $book['author'] }} - {{ $book['my_comment'] }}</li>
        @endforeach

    </ol>

</x-layout>
