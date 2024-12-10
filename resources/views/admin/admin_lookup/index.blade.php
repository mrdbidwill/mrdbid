@extends('layouts.app')

@section('content')

    <x-admin-dashboard-nav-bar></x-admin-dashboard-nav-bar>

    @if (Session::has('message'))
        <div class="text-3xl text-red-700">{{ Session::get('message') }}</div>
    @endif
    <p>(resources/views/admin/admin_lookup/index.blade.php)</p>

    <table class="table table-bordered">

        <tr>
            <td>
           Select the Lookup Table you need to edit:
            </td>
        </tr>

        @php
            //dd($lookup_lists);
             //dd($lookup_lists->id);
        @endphp
        @foreach ($lookup_lists as $lookup_list)
            @php
               //dd($lookup_list);
               //dd($lookup_list['id']);
            @endphp
            <tr>
                <td>
                    {{ $lookup_list->name }} <a href="{{ route('admin.lookups.show', $lookup_list->id) }}">View</a>
                    <a href="{{ route('admin.lookups.edit', $lookup_list->id) }}">Edit</a>
                </td>
            </tr>
        @endforeach
    </table>
@endsection


