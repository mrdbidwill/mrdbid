<x-layout>
    <x-admin-dashboard-nav-bar></x-admin-dashboard-nav-bar>

    <div class="bg-gray-900">
        <div class="mx-auto max-w-7xl">
            <div class="bg-gray-900 py-10">
                <div class="px-4 sm:px-6 lg:px-8">
                    <div class="sm:flex sm:items-center">
                        <div class="sm:flex-auto">
                            <p>
                                <resources/>
                                views/admin/admin_lookup_table/index.blade.php>
                            </p>
                            <h1 class="text-base font-semibold leading-6 text-white">Characters</h1>
                            <p class="mt-2 text-sm text-gray-300">Add the characters you know.</p>
                        </div>
                        <div class="mt-4 sm:ml-16 sm:mt-0 sm:flex-none">
                            <button type="button"
                                    class="block rounded-md bg-indigo-500 px-3 py-2 text-center text-sm font-semibold text-white hover:bg-indigo-400 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-500">
                                Add user
                            </button>
                        </div>
                    </div>
                    <div class="mt-8 flow-root">
                        <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                            <div class="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">
                                <table class="min-w-full divide-y divide-gray-700">
                                    <thead>
                                    <tr>
                                        <th scope="col"
                                            class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-white sm:pl-0">
                                            ID
                                        </th>
                                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-white">
                                            Name
                                        </th>
                                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-white">
                                            Display Options
                                        </th>
                                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-white">
                                            Is this a lookup table?
                                        </th>
                                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-white">
                                            Parts
                                        </th>
                                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-white">
                                            Source:
                                        </th>
                                        <th scope="col" class="relative py-3.5 pl-3 pr-4 sm:pr-0">
                                            <span class="sr-only">Edit</span>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody class="divide-y divide-gray-800">


                                    <tr>
                                        <td>Nothing here yet?</td>
                                    </tr>


                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</x-layout>
