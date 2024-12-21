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


    @php //dd($lookup_table_edits); @endphp
    @php //dd($id); // contains the character table id
        $table_name = DB::table('characters')->select('name')->where('id', '=', $id)->get();
        //dd($table_name);
        $display_name = StringUtils::convert_table_name_for_display($characters->name);
    @endphp

    <h1>Table Name: {{$display_name}}</h1>

    <table
        class="w-full table-auto bg-indigo-100 border-separate border border-4-rounded rounded-lg outline-slate-100 outline-4">

    @foreach ($lookup_table_edits as $lookup_table_edit)
        @php  //dd($lookup_table_edit->id); @endphp

        <tr class="odd:bg-white even:bg-gray-200">
            <td class="p-2">

                    <form method="POST" action="/admin.lookups/{$lookup_table_edit->id }}">
                        @csrf
                        @method('PATCH')
                        <label for="new_value" class="block text-sm font-medium leading-6 text-gray-900">Name
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input type="text" name="new_value" id="new_value"
                                       class="block flex-1 border-0 bg-transparent py-1  px-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                       placeholder="" value="{{ $lookup_table_edit->name }}" required>
                            </div>
                        </label>
                        @error('new_value')
                        <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                        @enderror
                        <input type="hidden" name="table_name" id="table_name" value="{{ $characters->name }}"> <input
                            type="hidden" name="row" id="row" value="{{ $lookup_table_edit->id }}"> <input type="hidden"
                                                                                                           name="column"
                                                                                                           id="column"
                                                                                                           value="name">
                        <div>
                            <x-form-button-small class="spaced-button" fieldName="Table Name">Update</x-form-button-small>
                        </div>
                    </form>
            </td>
        </tr>

            <tr class="odd:bg-white even:bg-gray-200">
                <td class="p-2">

                    <form method="POST" action="/admin.lookups/{$lookup_table_edit->id }}">
                        @csrf
                        @method('PATCH')
                        <label for="new_value"
                               class="block text-sm font-medium leading-6 text-gray-900">Description</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input type="text" name="new_value" id="new_value"
                                       class="block flex-1 border-0 bg-transparent py-1  px-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                       placeholder=""
                                       value="{{ $lookup_table_edit->description }}">
                            </div>

                            @error('new_value')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                            <input type="hidden" name="table_name" id="table_name" value="{{ $characters->name }}">
                            <input type="hidden" name="row" id="row" value="{{ $lookup_table_edit->id }}"> <input
                                type="hidden" name="column" id="column" value="description">
                            <div>
                                <x-form-button-small class="spaced-button" fieldName="Description">Update</x-form-button-small>
                            </div>
                        </div>
                    </form>
                </td>
            </tr>

            <tr class="odd:bg-white even:bg-gray-200">
                <td class="p-2">

                    <form method="POST" action="/admin.lookups/{$lookup_table_edit->id }}">
                        @csrf
                        @method('PATCH')
                        <label for="new_value"
                               class="block text-sm font-medium leading-6 text-gray-900">Comments</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input type="text" name="new_value" id="new_value"
                                       class="block flex-1 border-0 bg-transparent py-1  px-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                       placeholder=""
                                       value="{{ $lookup_table_edit->description }}">
                            </div>

                            @error('new_value')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                            <input type="hidden" name="table_name" id="table_name" value="{{ $characters->name }}">
                            <input type="hidden" name="row" id="row" value="{{ $lookup_table_edit->id }}"> <input
                                type="hidden" name="column" id="column" value="comments">
                            <div>
                                <x-form-button-small class="spaced-button" fieldName="Comments">Update</x-form-button-small>
                            </div>
                        </div>
                    </form>

                </td>
            </tr>

            <tr class="odd:bg-white even:bg-gray-200">
                <td class="p-2">
                    <form method="POST" action="/admin.lookups/{$lookup_table_edit->id }}">
                        @csrf
                        @method('PATCH')
                        <label for="new_value" class="block text-sm font-medium leading-6 text-gray-900">Source</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input type="text" name="new_value" id="new_value"
                                       class="block flex-1 border-0 bg-transparent py-1  px-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                       placeholder=""
                                       value="{{ $lookup_table_edit->source }}">
                            </div>
                            @error('new_value')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                            <input type="hidden" name="table_name" id="table_name" value="{{ $characters->name }}">
                            <input type="hidden" name="row" id="row" value="{{ $lookup_table_edit->id }}"> <input
                                type="hidden" name="column" id="column" value="source">
                            <div>
                                <x-form-button-small class="spaced-button" fieldName="Source">Update</x-form-button-small>
                            </div>
                        </div>
                    </form>
                </td>
            </tr>
    @endforeach
    </table>
@endsection


