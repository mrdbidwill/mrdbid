@php
    //dd($specimen_clusters);
@endphp
<x-layout>
    <x-specimens-nav-bar></x-specimens-nav-bar>
    <p>This is views/specimen_clusters/index.blade.php.</p>

    @if (Session::has('message'))
        <div class="text-3xl text-red-700">{{ Session::get('message') }}</div>
    @endif

    <!-- if no specimens are found, display message -->
    @if ($specimen_clusters->count() == 0)
        <p class="text-red-500">No specimen clusters found.</p>
    @endif


    <p class="border-4 border-black p-2 text-fuchsia-700 text-center">
        <x-specimens-nav-link href="{{ route('specimen_cluster.create') }}"
                              :active="request()->routeIs('specimens_cluster.create')">
            Add New Cluster
        </x-specimens-nav-link>
    </p>


    @foreach ($specimen_clusters as $specimen_cluster)

        <table
            class="table-auto size-full  bg-indigo-100 border-separate border border-slate-900 border-4-rounded rounded-lg outline-slate-100 outline-4">
            <!-- begin specimen clusters table -->


            <tr>
                <td class="border-4 border-black p-2 text-fuchsia-700 text-center">
                    Specimen Clusters:
                </td>
            </tr>

            <tr>
                <td class="border-4 border-black p-2 text-fuchsia-700 text-center">
                    <x-specimens-nav-link href="{{ route('specimen_cluster.edit', $specimen_cluster['id']) }}"
                                          :active="request()->routeIs('specimens_cluster.edit')">
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

            <tr>
                <td class="border-4 border-black p-2 text-fuchsia-700 text-center">
                    End clusters.
                </td>
            </tr>


            <tr>
                <td class="bg-blue-400 border border-slate-800 p-2"></td>
            </tr>
        </table>    <!-- end table line 180 of specimen_clusters/index.blade.php -->
    @endforeach
</x-layout>

