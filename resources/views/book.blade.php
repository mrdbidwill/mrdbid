@extends('layouts.app')

@section('content')

    @if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/book.blade.php</p>
    @endif
    <div class="container">
        <h1 class="text-3xl text-black text-center mb-6">Book List</h1>

        <p class="mt-2 text-xl text-black">You can do just fine using Mushroom Expert <a
                href="https://www.mushroomexpert.com">https://www.mushroomexpert.com</a> as an online guide. Do yourself a favor and get Catherine (Kit) Scates <i>Easy Guide to Mushroom Descriptions</i>  and <i>Easy Key To Common Gilled Mushrooms</i>. Easy visual reference you will use a lot to identify your mushrooms. <a
                href="https://fungi.com/products/easy-mushroom-identification-charts">https://fungi.com/products/easy-mushroom-identification-charts</a> </p>

        <p class="mt-2 text-xl text-black">I use them AND I also like having books for reference. This is my list of mushroom books. A few are new, many are old. A few are real old and you will have to look a little harder for them.</p>

        <table style="width: 100%; border-collapse: separate; border-spacing: 0; background-color:#e0e7ff; border: 0 solid #93c5fd; border-radius: 0.5rem; outline: 4px solid #f1f5f9;">
                @forelse ($dataSources as $dataSource)
                    <tr class="{{ $loop->even ? 'bg-gray-200' : 'bg-white' }}">
                        <td colspan="2" style="padding: 0.5rem; border: 0 solid #93c5fd;">
                            <h2>{{ $dataSource->title }}</h2>
                        </td>
                    </tr>
   <!--   {{--              @if($dataSource->item_code)  --}}
                    <tr class="{{ $loop->even ? 'bg-gray-200' : 'bg-white' }}">
                            <td style="padding: 0.5rem; border: 0 solid #93c5fd;">{{ $dataSource->author }}</td>
                            <td style="padding: 0.5rem; border: 0 solid #93c5fd;"><a href="{{ $dataSource->item_code }}" target="_blank"><img class="w-19 h-auto"  src="{{ asset( 'storage/images/amazon/available_at_amazon_US_EN_logo_stacked_RGB_SQUID_100x48.png') }}" alt="Available at Amazon"></a></td>
                        </tr>
           {{--           @else   --}}
                -->
                    <tr class="{{ $loop->even ? 'bg-gray-200' : 'bg-white' }}">
                            <td colspan="2" style="padding: 0.5rem; border: 0 solid #93c5fd;">{{ $dataSource->author }}</td>
                        </tr>
           {{--           @endif   --}}

            @if( $dataSource->comment || $dataSource->description )
                    <tr class="{{ $loop->even ? 'bg-gray-200' : 'bg-white' }}">
                            <td colspan="2" style="padding: 0.5rem; border: 0 solid #93c5fd;">{{ $dataSource->comment }} {{ $dataSource->description }}</td>
                        </tr>
                    @endif

                @empty
                <tr class="{{ $loop->even ? 'bg-gray-200' : 'bg-white' }}">
                        <td style="padding: 0.5rem; border: 0 solid #93c5fd;">
                        <p class="mt-2">No books available.</p>
                         </td>
                </tr>
                @endforelse
        </table>
    </div>
@endsection


