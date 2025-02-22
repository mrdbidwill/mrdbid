@php
    //dd($clusters);
@endphp@extends('layouts.app')

@section('content')

        {{-- Show file address if in development environment --}}
    <x-specimens-nav-bar></x-specimens-nav-bar>

        @if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/clusters/index.blade.php</p>
    @endif



    @if (Session::has('message'))
        <div c lass="text-3xl text-red-700">{{ Session::get('message') }}</div>
    @endif

    <!-- if no specimens are found, display message -->
    @if ($specimen_clusters->count() == 0)
        <p class="text-red-500">No specimen clusters found.</p>
    @endif


    <p class="border-4 border-black p-2 text-fuchsia-700 text-center">
        <x-specimens-nav-link href="{{ route('clusters.create') }}"
                              :active="request()->routeIs('clusters.create')">
            Add New Cluster
        </x-specimens-nav-link>
    </p>

    <table
        class="table-auto size-full  bg-indigo-100 border-separate border border-slate-900 border-4-rounded rounded-lg outline-slate-100 outline-4">
        <!-- begin specimen clusters table -->


        <tr>
            <td class="border-4 border-black p-2 text-fuchsia-700 text-center">
                Specimen Clusters:
            </td>
        </tr>

    @foreach ($specimen_clusters as $specimen_cluster)



            <tr>
                <td class="border-4 border-black p-2 text-fuchsia-700 text-center">
                    <x-specimens-nav-link href="{{ route('clusters.edit', $specimen_cluster['id']) }}"
                                          :active="request()->routeIs('clusters.edit')">
                        Edit This Cluster
                    </x-specimens-nav-link>
                </td>
            </tr>

            <tr>
                <td class="border-4 border-black p-2">Cluster ID: {{ $specimen_cluster['id'] }}</td>
            </tr>
            <tr>
                <td class="border-4 border-black p-2">Cluster Name: {{ $specimen_cluster['name'] }}</td>
            </tr>
            <tr>
                <td class="border-4 border-black p-2">Description: {{ $specimen_cluster['description'] }}</td>
            </tr>

            <tr>
                <td class="border-4 border-black p-2">Comment: {{ $specimen_cluster['comments'] }}</td>
            </tr>


    @endforeach

        <tr>
            <td class="border-4 border-black p-2 text-fuchsia-700 text-center">
                End clusters.
            </td>
        </tr>


        <tr>
            <td class="bg-blue-400 border border-slate-800 p-2"></td>
        </tr>
    </table>    <!-- end table line 180 of clusters/index.blade.php -->
@endsection



