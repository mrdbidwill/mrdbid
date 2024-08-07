<x-layout>
    <x-slot:heading>
        Character Listings
    </x-slot:heading>


    <div class="bg-gray-100">
        <div class="mx-auto max-w-7xl">
            <div class="bg-gray-100 py-10">
                <div class="px-4 sm:px-6 lg:px-8">
                    <div class="sm:flex sm:items-center">
                        <div class="sm:flex-auto">
                            <h1 class="text-base font-semibold leading-6 text-black">Characters
                                (characters/index.blade.php)</h1>
                            <p class="mt-2 text-sm text-black">Use this list to add characters to your specimen.</p>
                        </div>
                        <div class="mt-4 sm:ml-16 sm:mt-0 sm:flex-none">
                            <button type="button"
                                    class="block rounded-md bg-indigo-500 px-3 py-2 text-center text-sm font-semibold text-black hover:bg-indigo-400 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-500">
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
                                            class="py-3.5 pl-4 pr-3 text-left text-sm font-semibold text-black sm:pl-0">
                                            ID
                                        </th>
                                        <th scope="col" class="px-3 py-3.5 text-left text-sm font-semibold text-black">
                                            Name
                                        </th>
                                    </tr>
                                    </thead>

                                    // start form here
                                    <form method="POST" action="/characters.update/">
                                        @csrf
                                        <div class="mt-10 grid>
                                        <div class=" mt-2
                                        ">
                                        <x-form-input name="name" id="name" placeholder="Full Moon Behavior"/>
                                        <x-form-error name="name"/>
                            </div>
                            </x-form-field>

                            <tbody class="divide-y divide-gray-800">


                            @foreach ($characters as $character)
                                <tr>
                                    <td class="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-black sm:pl-0">{{ $character['id'] }}</td>
                                    <td class="whitespace-nowrap px-3 py-4 text-sm text-black">{{ $character['name'] }}</td>
                                </tr>
                            @endforeach


                            </tbody>
                            </form>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>


</x-layout>
