@extends('layouts.app')
@section('content')
    <x-specimens-nav-bar></x-specimens-nav-bar>

    {{-- Show file address if in development environment --}}
    @if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/data_sources/index.blade.php</p>
    @endif


    <h1>Data Sources</h1>
    <a href="{{ route('data_sources.create') }}">Create New Data Source</a>
    <ul>
        @foreach ($data_sources as $data_source)
            <li class="overflow-hidden rounded-md bg-white px-6 py-4 shadow">
                @php //dd($data_source->title); @endphp
                {{ $data_source->title ?? 'N/A' }}
                <a href="{{ route('data_sources.show', $data_source->id) }}">View</a> <a
                    href="{{ route('data_sources.edit', $data_source->id) }}">Edit</a>
                @if ($memberType <= 2)
                    <form action="{{ route('data_sources.destroy', $data_source->id) }}" method="POST"
                          style="display:inline;">
                        @csrf
                        @method('DELETE')
                        <button type="submit">Delete</button>
                    </form>
                @endif
            </li>
        @endforeach
    </ul>
@endsection


