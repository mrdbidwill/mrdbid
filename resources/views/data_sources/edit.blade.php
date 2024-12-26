@props(['active' => false])
@php
    $member_type = \App\Utils\MemberUtils::get_member_type();
@endphp
@extends('layouts.app')
@section('content')

    <x-specimens-nav-bar></x-specimens-nav-bar>
    {{-- Show file address if in development environment --}}
    @if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/data_sources/edit.blade.php</p>
    @endif

    <h1>Edit Data Source</h1>
    <form action="{{ route('data_sources.update', $data_source->id) }}" method="POST">
        @csrf
        @method('PUT')

        <table class="w-full table-auto bg-indigo-100 border-separate border border-4-rounded rounded-lg outline-slate-100 outline-4">
            <tr>
                <td class="border-4 border-blue-300 p-2">
        <input type="text"  class="wider-input" name="title" value="{{ $data_source->title }}" placeholder="Title"> <label for="title" class="text-black font-bold mb-2">Title</label>
        </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2">
        <input type="text"  class="wider-input"  name="author" value="{{ $data_source->author }}" placeholder="Author"> <label for="author" class="text-black font-bold mb-2">Author</label>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2">
        <input type="text"  class="wider-input" name="asin" value="{{ $data_source->asin }}" placeholder="ASIN 10 digit code"> <label for="asin" class="text-black font-bold mb-2">Optional - ISBN 10 or 13 for book</label>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2">
                @php // dd($data_source, $memberType, $dataTypes, $selected_data_type)@endphp
                <label for="type" class="text-black font-bold mb-2">Type: </label>
                <select name="type" id="type" class="wider-input text-black">
                    <option value="" disabled {{ !$selected_data_type ? 'selected' : '' }}>Select a Type</option>

                    @foreach($dataTypes as $dataType)
                        <option value="{{ $dataType->id }}" {{ $dataType->id == $selected_data_type ? 'selected' : '' }}>
                            {{ $dataType->name }}
                        </option>
                    @endforeach
                </select>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2">
        <textarea   class="wider-input"  name="comment" placeholder="Comment">{{ $data_source->comment }}</textarea> <label for="comment" class="text-black font-bold mb-2">Comment</label>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2">
        <input   class="wider-input" type="number" name="my_rating" value="{{ $data_source->my_rating }}" placeholder="Rating">  <label for="my_rating" class="text-black font-bold mb-2">Rating</label>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2">
        <textarea   class="wider-input"  name="my_comment" placeholder="My Comment">{{ $data_source->my_comment }}</textarea> <label for="my_comment" class="text-black font-bold mb-2">My Comment</label>
            </td>
        </tr>

        <tr>
            <td class="border-4 border-blue-300 p-2">
                <!-- Hidden input for entered_by -->
                <input type="hidden" name="entered_by" value="{{ auth()->id() }}">
        <button type="submit">Update</button>
            </td>
        </tr>
    </table>
    </form>

    <table class="w-full table-auto bg-indigo-100 border-separate border border-4-rounded rounded-lg outline-slate-100 outline-4">
        <x-action-buttons
            :cancelUrl="route('data_sources.show', $data_source->id)"
            :deleteAction="route('data_sources.destroy', $data_source->id)"
            deleteItem="This Data Source"/>
    </table>
@endsection


