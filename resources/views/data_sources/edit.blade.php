@extends('layouts.app')

@section('content')

    <p>This is views/data_sources/edit.blade.php</p>
    <x-specimens-nav-bar></x-specimens-nav-bar>

    <h1>Edit Data Source</h1>
    <form action="{{ route('data_sources.update', $data_source->id) }}" method="POST">
        @csrf
        @method('PUT')

        <table class="w-full table-auto bg-indigo-100 border-separate border border-4-rounded rounded-lg outline-slate-100 outline-4">
            <tr>
                <td class="border-4 border-blue-300 p-2">
        <input type="text"  class="wider-input" name="title" value="{{ $data_source->title }}" placeholder="Title"><br>
        </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2">
        <input type="text"  class="wider-input"  name="author" value="{{ $data_source->author }}" placeholder="Author"><br>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2">
        <input type="text"  class="wider-input" name="asin" value="{{ $data_source->asin }}" placeholder="ASIN 10 digit code"><br>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2">
        <input type="text"   class="wider-input"  name="type" value="{{ $data_source->type }}" placeholder="Type"><br>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2">
        <textarea   class="wider-input"  name="comment" placeholder="Comment">{{ $data_source->comment }}</textarea><br>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2">
        <input   class="wider-input" type="number" name="my_rating" value="{{ $data_source->my_rating }}" placeholder="Rating"><br>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2">
        <textarea   class="wider-input"  name="my_comment" placeholder="My Comment">{{ $data_source->my_comment }}</textarea><br>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2">
        <input   class="wider-input"  type="text" name="entered_by" value="{{ $data_source->entered_by }}" placeholder="Entered By"><br>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2">
        <button type="submit">Update</button>
            </td>
        </tr>
    </table>
    </form>
@endsection


