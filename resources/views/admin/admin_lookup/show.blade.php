@extends('layouts.app')

@section('content')

    <x-admin-dashboard-nav-bar></x-admin-dashboard-nav-bar>

    @if (Session::has('message'))
        <div class="text-3xl text-red-700"><strong>{{ Session::get('message') }} </strong></div>
    @endif
    @php
    //dd($lookup_tables);
    @endphp

    <table class="w-full table-auto bg-indigo-100 border-separate border border-4-rounded rounded-lg outline-slate-100 outline-4">
        <!-- begin basic specimens table -->
        <tr>
            <td class="p-2">
    (resources/views/admin/admin_lookup/show.blade.php)
            </td>
        </tr>

        <tr>
            <td class="p-2">
    Lookup Table ID:  <strong>{{ $lookup_table->id }} </strong>
            </td>
        </tr>

        <tr>
            <td class="p-2">
    Lookup Table Name:  <strong>{{ $lookup_table->name }} </strong>
            </td>
        </tr>

        <tr>
            <td class="p-2">
    Description:  <strong>{{ $lookup_table->description }} </strong>
            </td>
        </tr>

        <tr>
            <td class="p-2">
    Comments:  <strong>{{ $lookup_table->comments }} </strong>
            </td>
        </tr>

        <tr>
            <td class="p-2">
    Source:  <strong>{{ $lookup_source->title }} </strong>
            </td>
        </tr>

        <tr>
            <td class="p-2">
    Entered By:  <strong>{{ $lookup_table->entered_by }} </strong>
            </td>
        </tr>

        <tr>
            <td class="p-2">
    <p class="mt-6">
        <x-button href="route('admin.lookups.edit', $lookup_list->id)">Edit Character</x-button>
            </td>
        </tr>
    </table>

@endsection


