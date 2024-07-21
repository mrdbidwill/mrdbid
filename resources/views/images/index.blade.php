@php use Illuminate\Support\Facades\DB;@endphp
<x-layout>
    <x-slot:heading>
        Image Listings
    </x-slot:heading>

    <div class="flex justify-end">
        <a href="/images/create" class="px-4 py-2 bg-blue-500 text-white rounded-lg">Add Image</a>
    </div>

    <div class="space-y-4">
        <p>This is views/images/index.blade.php</p>

        @foreach ($images as $image)
            <!--  add edit and upload buttons  -->
            <div class="flex justify-middle">
                <a href="/images/{{ $image['id'] }}/edit"
                   class="px-4 py-2 bg-blue-500 text-white rounded-lg">Edit</a>
            </div>


            @php

                $parts = DB::table('parts')
                ->where('id', '=', $image['id'])
                ->first();
                //dd($parts);


            @endphp

            <a href="/images/{{ $image['id'] }}" class="block px-4 py-6 border border-gray-200 rounded-lg">
                <div class="font-bold text-blue-500 text-sm">{{ $image['parts'] }}</div>

                <div>
                    <strong>{{ $image['parts'] }}:</strong>
                    {{ $image['description'] }}

                </div>
            </a>
        @endforeach


    </div>

    <div class="flex bg-amber-600 border-gray-100">
        {{ $images->links() }}
    </div>
</x-layout>
