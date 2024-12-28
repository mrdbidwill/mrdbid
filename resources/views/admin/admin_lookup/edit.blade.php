@php use App\Utils\StringUtils;   @endphp@extends('layouts.app')

@section('content')

    <x-admin-dashboard-nav-bar></x-admin-dashboard-nav-bar>

    {{-- Show file address if in development environment --}}
    @if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/admin/admin_lookup/edit.blade.php</p>
    @endif

    @if (Session::has('message'))
        <div class="text-3xl text-red-700">{{ Session::get('message') }}</div>
    @endif

    @php
        // Note: Assuming $lookup_tables contains all the tables to iterate over
        $table_name = DB::table('characters')->select('name')->where('id', '=', $id)->get();
        $display_name = StringUtils::convert_table_name_for_display($characters->name);
    @endphp

    <h1>Table Name: {{$display_name}}</h1>

    <table class="w-full table-auto border-separate border border-4-rounded rounded-lg outline-slate-100 outline-4 bg-indigo-100">
        @foreach ($lookup_table_edits as $key => $lookup_table_edit)
            <tr class="{{ $key % 2 == 0 ? 'bg-white' : 'bg-gray-200' }}">
                <td class="p-2">
                    <form method="POST" action="/admin.lookups/{{$lookup_table_edit->id}}">
                        @csrf
                        @method('PATCH')
                        <label for="new_value" class="block text-sm font-medium leading-6 text-gray-900">Name</label>
                        <div class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-indigo-600 sm:max-w-md">
                            <input type="text" name="new_value" id="new_value" class="block flex-1 border-0 bg-transparent py-1 px-1 text-gray-900 focus:ring-0 sm:text-sm sm:leading-6"
                                   value="{{ $lookup_table_edit->name }}" required>
                        </div>
                        <input type="hidden" name="table_name" value="{{ $characters->name }}">
                        <input type="hidden" name="row" value="{{ $lookup_table_edit->id }}">
                        <input type="hidden" name="column" value="name">
                        <div>
                            <x-form-button-small fieldName="Table Name">Update</x-form-button-small>
                        </div>
                    </form>
                </td>
            </tr>
        @endforeach
    </table>

@endsection


