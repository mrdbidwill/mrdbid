@extends('layouts.app')

@section('content')

    <!-- resources/views/book.blade.php -->
    <div class="container">

        <h1 class="text-3xl text-black text-center mb-6">Book List</h1>

        <p class="mt-2 text-xl text-black">You can do just fine using Mushroom Expert <a
                href="https://www.mushroomexpert.com">https://www.mushroomexpert.com</a> as an online guide. Do yourself a favor and get Catherine (Kit) Scates <i>Easy Guide to Mushroom Descriptions</i>  and <i>Easy Key To Common Gilled Mushrooms</i>. Easy visual reference you will use a lot to identify your mushrooms. <a
                href="https://fungi.com/products/easy-mushroom-identification-charts">https://fungi.com/products/easy-mushroom-identification-charts</a> </p>

        <p class="mt-2 text-xl text-black">I use them AND I also like having books for reference. This is my list of mushroom books. A few are new, many are old. A few are real old and you will have to look a little harder for them.</p>

        <p class="mt-2 text-xl text-black">As an Amazon Associate I earn from qualifying purchase.</p>
        <div class="books">
            <ul role="list" class="space-y-3">
                @forelse ($dataSources as $dataSource)
                        <li class="overflow-hidden rounded-md bg-white px-6 py-4 shadow">
                            <h2>{{ $dataSource->title }}</h2>
                            <p class="mt-2">{{ $dataSource->author }}</p>
                            <p class="mt-2">{{ $dataSource->comment }}</p>
                            <p class="mt-2">MRDBID comment: {{ $dataSource->my_comment }}</p>
                            @if($dataSource->item_code)
                            <p class="mt-2">
                                <a href="{{ $dataSource->item_code }}" target="_blank"> <img
                                    src="{{ asset( 'storage/images/amazon/available_at_amazon_en_horizontal.png') }}" alt="Available at Amazon"></a>
                            </p>
                            @endif
                        </li>
                @empty
                    <li>
                    <p class="mt-2">No books available.</p>
                    </li>
                @endforelse
            </ul>
        </div>
    </div>
@endsection


