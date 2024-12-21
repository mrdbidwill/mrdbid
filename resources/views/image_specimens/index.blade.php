@php use Illuminate\Support\Facades\DB;@endphp@extends('layouts.app')

@section('content')

        {{-- Show file address if in development environment --}}
    <x-specimens-nav-bar></x-specimens-nav-bar>@if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/image_specimens/index.blade.php</p>
    @endif


    @if (Session::has('message'))
        <div class="text-3xl text-red-700">{{ Session::get('message') }}</div>
    @endif
    <div class="space-y-4">

        @foreach ($images_specimen as $image)
            <!--  add edit and upload buttons  -->
            <div class="flex justify-middle">
                <a href="/images/{{ $images_specimen['id'] }}/edit" class="px-4 py-2 bg-blue-500 text-white rounded-lg">Edit</a>
            </div>


            @php

                $parts = DB::table('parts')
                ->where('id', '=', $images_specimen['id'])
                ->first();
                //dd($parts);


            @endphp

            <a href="/images/{{ $images_specimen['id'] }}" class="block px-4 py-6 border border-gray-200 rounded-lg">
                <div class="font-bold text-blue-500 text-sm">{{ $images_specimen['parts'] }}</div>

                <div>
                    <strong>{{ $images_specimen['parts'] }}:</strong>
                    {{ $images_specimen['description'] }}

                </div>
            </a>
        @endforeach


    </div>

    <div class="flex bg-amber-600 border-gray-100">
        {{ $images_specimen->links() }}
    </div>
@endsection


