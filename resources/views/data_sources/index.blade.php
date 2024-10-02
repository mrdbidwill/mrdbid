<x-layout>
    <p>This is views/data_sources/index.blade.php</p>
    <x-specimens-nav-bar></x-specimens-nav-bar>

    <h1>Data Sources</h1>
    <a href="{{ route('data_source.create') }}">Create New Data Source</a>
    <ul>
        @foreach ($data_sources as $data_source)
            <li>
                @php //dd($data_source->title); @endphp
                {{ $data_source->title ?? 'N/A' }}
                <a href="{{ route('data_source.show', $data_source->id) }}">View</a> <a
                    href="{{ route('data_source.edit', $data_source->id) }}">Edit</a>
                <form action="{{ route('data_source.destroy', $data_source->id) }}" method="POST"
                      style="display:inline;">
                    @csrf
                    @method('DELETE')
                    <button type="submit">Delete</button>
                </form>
            </li>
        @endforeach
    </ul>
</x-layout>
