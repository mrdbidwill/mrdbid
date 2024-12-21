@extends('layouts.app')

@section('content')

    <p>This is views/data_sources/create.blade.php</p>
        {{-- Show file address if in development environment --}}
    <x-specimens-nav-bar></x-specimens-nav-bar>@if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/</p>
    @endif


    <h1>Create Data Source</h1>

    <form action="{{ route('data_sources.store') }}" method="POST">
        @csrf
        <table class="w-full table-auto bg-indigo-100 border-separate border border-4-rounded rounded-lg outline-slate-100 outline-4">
        <tr>
           <td class="border-4 border-blue-300 p-2">
                <input type="text"  class="wider-input text-gray-900"   name="title" placeholder="Title">
            </td>
        </tr>

        <tr>
           <td class="border-4 border-blue-300 p-2">
        <input type="text"  class="wider-input text-gray-900"    name="author" placeholder="Author">
            </td>
        </tr>

        <tr>
           <td class="border-4 border-blue-300 p-2">
        <input type="text"  class="wider-input text-gray-900"    name="asin" placeholder="ASIN 10 digit code"><br>
            </td>
        </tr>

        <tr>
           <td class="border-4 border-blue-300 p-2">
        <input type="text"  class="wider-input text-gray-900"   name="type" placeholder="Type">
            </td>
        </tr>

        <tr>
           <td class="border-4 border-blue-300 p-2">
        <textarea  class="wider-input text-gray-900"    name="comment" placeholder="Comment"></textarea>
            </td>
        </tr>

        <tr>
           <td class="border-4 border-blue-300 p-2">
        <input type="number" name="my_rating" placeholder="Rating">

            </td>
        </tr>

        <tr>
           <td class="border-4 border-blue-300 p-2">
        <textarea  class="wider-input text-gray-900"    name="my_comment"  placeholder="My Comment"></textarea>
            </td>
        </tr>

        <tr>
           <td class="border-4 border-blue-300 p-2">
        <input type="text"  class="wider-input text-gray-900"   name="entered_by" placeholder="Entered By">
            </td>
        </tr>

        <tr>
           <td class="border-4 border-blue-300 p-2">
                <x-form-button-small class="spaced-button" fieldName="">Enter</x-form-button-small>
            </td>
        </tr>
    </table>

    </form>
@endsection


