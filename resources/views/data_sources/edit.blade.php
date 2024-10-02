<x-layout>
    <p>This is views/data_sources/edit.blade.php</p>
    <x-specimens-nav-bar></x-specimens-nav-bar>

    <h1>Edit Data Source</h1>
    <form action="{{ route('data_source.update', $data_source->id) }}" method="POST">
        @csrf
        @method('PUT')
        <!-- Form fields here -->
        <input type="text" name="title" value="{{ $data_source->title }}" placeholder="Title"> <input type="text"
                                                                                                      name="author"
                                                                                                      value="{{ $data_source->author }}"
                                                                                                      placeholder="Author">
        <input type="text" name="type" value="{{ $data_source->type }}" placeholder="Type"> <textarea name="comment"
                                                                                                      placeholder="Comment">{{ $data_source->comment }}</textarea>
        <input type="number" name="my_rating" value="{{ $data_source->my_rating }}" placeholder="Rating"> <textarea
            name="my_comment" placeholder="My Comment">{{ $ddata_source->my_comment }}</textarea> <input type="text"
                                                                                                         name="entered_by"
                                                                                                         value="{{ $data_source->entered_by }}"
                                                                                                         placeholder="Entered By">
        <button type="submit">Update</button>
    </form>
</x-layout>
