@props(['active' => false])
@php
    $member_type = \App\Utils\MemberUtils::get_member_type();
@endphp
@extends('layouts.app')
@section('content')

    <x-specimens-nav-bar></x-specimens-nav-bar>

    {{-- Show file address if in development environment --}}
    @if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/data_sources/create.blade.php</p>
    @endif

    <h1>Create Data Source</h1>

    @if($member_type < 4)
        <p>FYI. You are seeing this message and the additional two form fields because you have demonstrated some expertise in mycology.</p>
        <p>The "Rating" and "My Comment" are for future use. I assume since you are creating <b>this</b> data source, you have a high opinion of it. If users over time select one data source as useful, particularly for characters, then it may be useful to limit low rated or unused data sources as an option for that character. So in the future, this ranking may be determined automatically by the program. Or not.</p>

        <p>The same or similar process should work out regarding all characters.</p>
    @endif

    <form action="{{ route('data_sources.store') }}" method="POST">
        @csrf
        <table class="w-full table-auto bg-indigo-100 border-separate border border-4-rounded rounded-lg outline-slate-100 outline-4">
        <tr>
           <td class="border-4 border-blue-300 p-2">
                <input type="text"  class="wider-input text-black"   name="title" placeholder="Title"> <label class="text-black">Title</label>
            </td>
        </tr>

        <tr>
           <td class="border-4 border-blue-300 p-2">
        <input type="text"  class="wider-input text-black"    name="author" placeholder="Author"> <label class="text-black">Author</label>
            </td>
        </tr>

        <tr>
           <td class="border-4 border-blue-300 p-2">
        <input type="text"  class="wider-input text-black"    name="asin" placeholder="Optional - For a book use ISBN 10 or 13"><br> <label class="text-black">Optional - ISBN 10 or 13 for book</label>

            </td>
        </tr>

        <tr>
           <td class="border-4 border-blue-300 p-2">
               <label for="type" class="text-black font-bold mb-2">Type</label>
               <select name="type" id="type" class="wider-input text-black">
                   <option value="" disabled selected>Select a Type</option>
                   @foreach($dataTypes as $dataType)
                       <option value="{{ $dataType->id }}">{{ $dataType->name }}</option>
                   @endforeach
               </select>
            </td>
        </tr>

        <tr>
           <td class="border-4 border-blue-300 p-2">
        <textarea  class="wider-input text-black"    name="comment" placeholder="Comment"></textarea> <label class="text-black">Comment</label>
            </td>
        </tr>

        @if($member_type < 4)
            <tr>
               <td class="border-4 border-blue-300 p-2">
            <input type="number" name="my_rating" placeholder="Rating">  <label class="text-black">Rating</label>

                </td>
            </tr>

            <tr>
                <td class="border-4 border-blue-300 p-2">
                    <textarea  class="wider-input text-black"    name="my_comment"  placeholder="My Comment"></textarea> <label class="text-black">My Comment</label>
                </td>
            </tr>
        @endif

        <tr>
           <td class="border-4 border-blue-300 p-2">
               <!-- Hidden input for entered_by -->
               <input type="hidden" name="entered_by" value="{{ auth()->id() }}">
               <x-form-button-small class="spaced-button" fieldName="">Enter</x-form-button-small>
            </td>
        </tr>

            <tr>
                <td class="border-4 border-blue-300 p-2">
                    <x-cancel-button :cancelUrl="route('data_sources.index')"/>
                </td>
            </tr>


    </table>

    </form>
@endsection


