@php use App\Utils\StringUtils;   @endphp@extends('layouts.app')

@section('content')

    <x-admin-dashboard-nav-bar></x-admin-dashboard-nav-bar>

    @if (Session::has('message'))
        <div class="text-3xl text-red-700">{{ Session::get('message') }}</div>
    @endif

    <p>(resources/views/admin/admin_lookup/edit.blade.php)</p>
    @php //dd($lookup_table_edits); @endphp
    @php //dd($id); // contains the character table id
        $table_name = DB::table('characters')->select('name')->where('id', '=', $id)->get();
        //dd($table_name);
        $display_name = StringUtils::convert_table_name_for_display($characters->name);
    @endphp

    <h1>Table Name: {{$display_name}}</h1>

    @foreach ($lookup_table_edits as $lookup_table_edit)
        @php  //dd($lookup_table_edit->id); @endphp
        <div class="space-y-4">
            <div class="border-b border-gray-900/10 pb-6">
                <div class="mt-2 grid grid-cols-1 gap-x-4 gap-y-4">

                    <form method="POST" action="{{ route('admin_lookup.update', ['admin_lookup' => $id]) }}">
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
                            <button type="submit"
                                    class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                                Update
                            </button>
                        </div>
                    </form>

                    <form method="POST" action="{{ route('admin_lookup.update', ['admin_lookup' => $id]) }}">
                        @csrf
                        @method('PATCH')
                        <label for="new_value"
                               class="block text-sm font-medium leading-6 text-gray-900">Description</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input type="text" name="new_value" id="new_value"
                                       class="block flex-1 border-0 bg-transparent py-1  px-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                       placeholder="Example:  Looks like lions mane, maybe?"
                                       value="{{ $lookup_table_edit->description }}">
                            </div>

                            @error('new_value')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                            <input type="hidden" name="table_name" id="table_name" value="{{ $characters->name }}">
                            <input type="hidden" name="row" id="row" value="{{ $lookup_table_edit->id }}"> <input
                                type="hidden" name="column" id="column" value="description">
                            <div>
                                <button type="submit"
                                        class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                                    Update
                                </button>
                            </div>
                        </div>
                    </form>


                    <form method="POST" action="{{ route('admin_lookup.update', ['admin_lookup' => $id]) }}">
                        @csrf
                        @method('PATCH')
                        <label for="new_value"
                               class="block text-sm font-medium leading-6 text-gray-900">Comments</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input type="text" name="new_value" id="new_value"
                                       class="block flex-1 border-0 bg-transparent py-1  px-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                       placeholder="Example:  Little Brown Mushroom - Front Yard"
                                       value="{{ $lookup_table_edit->description }}">
                            </div>

                            @error('new_value')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                            <input type="hidden" name="table_name" id="table_name" value="{{ $characters->name }}">
                            <input type="hidden" name="row" id="row" value="{{ $lookup_table_edit->id }}"> <input
                                type="hidden" name="column" id="column" value="comments">
                            <div>
                                <button type="submit"
                                        class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                                    Update
                                </button>
                            </div>
                        </div>
                    </form>


                    <form method="POST" action="{{ route('admin_lookup.update', ['admin_lookup' => $id]) }}">
                        @csrf
                        @method('PATCH')
                        <label for="new_value" class="block text-sm font-medium leading-6 text-gray-900">Source</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input type="text" name="new_value" id="new_value"
                                       class="block flex-1 border-0 bg-transparent py-1  px-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                       placeholder="Example:  Little Brown Mushroom - Front Yard"
                                       value="{{ $lookup_table_edit->source }}">
                            </div>
                            @error('new_value')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror
                            <input type="hidden" name="table_name" id="table_name" value="{{ $characters->name }}">
                            <input type="hidden" name="row" id="row" value="{{ $lookup_table_edit->id }}"> <input
                                type="hidden" name="column" id="column" value="source">
                            <div>
                                <button type="submit"
                                        class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                                    Update
                                </button>
                            </div>
                        </div>
                    </form>
                    <hr>
                    <hr>
                    <hr>
                </div>
            </div>
        </div>
    @endforeach
@endsection


