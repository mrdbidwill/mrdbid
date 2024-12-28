@extends('layouts.app')

@section('content')

    <x-admin-dashboard-nav-bar></x-admin-dashboard-nav-bar>

    {{-- Show file address if in development environment --}}
    @if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/admin/admin_specimen/index.blade.php</p>
    @endif

    <p>This just displays a list of <b>my</b> specimens. So, not very useful in admin. And, since all of the relations between models, controllers, views, and migrations need to be maintained in any changes to <u>the structure of any table</u>, I won't add any ability to do that here.</p>

    <p>Not sure this view or whole admin_specimen directory is necessary.</p>

    <div class="bg-gray-900">
        <div class="mx-auto max-w-7xl">
            <div class="bg-gray-300 py-10">
                <div class="px-4 sm:px-6 lg:px-8">
                    <div class="sm:flex sm:items-center">
                        <div class="sm:flex-auto">
                            <h1 class="text-base font-semibold leading-6 text-gray-900">Specimens</h1>
                        </div>
                    </div>
                    <div class="mt-8 flow-root">
                        <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                            <div class="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">
                                <table class="min-w-full divide-y divide-gray-700">
                                    <thead>
                                    <tr>
                                        <th
                                            class="py-4   text-sm font-medium text-gray-900">
                                            ID
                                        </th>
                                        <th class="py-4   text-sm font-medium text-gray-900">
                                            Name
                                        </th>
                                        <th class="py-4   text-sm font-medium text-gray-900">
                                            Common Name
                                        </th>
                                        <th class="py-4   text-sm font-medium text-gray-900">
                                            Description
                                        </th>
                                        <th class="py-4   text-sm font-medium text-gray-900">
                                            Comments
                                        </th>

                                    </tr>
                                    </thead>
                                    <tbody class="divide-y divide-gray-800">
                                    @php //dd($specimen_lists); @endphp
                                    @foreach($specimen_lists as $specimen_list)
                                        <tr>
                                            <td class=" py-4   text-sm font-medium text-gray-900">
                                                {{$specimen_list->id}}
                                            </td>
                                            <td class=" py-4   text-sm font-medium text-gray-900">
                                                {{$specimen_list->specimen_name}}
                                            </td>
                                            <td class=" py-4   text-sm font-medium text-gray-900">
                                                {{$specimen_list->common_name}}
                                            </td>
                                            <td class=" py-4   text-sm font-medium text-gray-900">
                                                {{$specimen_list->description}}
                                            </td>
                                            <td class=" py-4   text-sm font-medium text-gray-900">
                                                {{$specimen_list->comment}}
                                            </td>

                                        </tr>
                                    @endforeach


                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection


