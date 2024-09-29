<x-layout>
    <x-admin-dashboard-nav-bar></x-admin-dashboard-nav-bar>
    <p>(resources/views/admin/admin_lookup_table/edit.blade.php)</p>
    @php //dd($lookup_table_edits); @endphp
    <form method="POST" action="/admin_look_up_table/{{ $id }}">
        @csrf
        @method('PATCH')

        @foreach ($lookup_table_edits as $lookup_table_edit)
            {{--  @php//dd($lookup_table_edit); @endphp --}}
            <div class="space-y-4">
                <div class="border-b border-gray-900/10 pb-6">
                    <div class="mt-2 grid grid-cols-1 gap-x-4 gap-y-4">


                        <label for="name" class="block text-sm font-medium leading-6 text-gray-900">Name
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input type="text" name="name" id="name"
                                       class="block flex-1 border-0 bg-transparent py-1  px-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                       placeholder="" value="{{ $lookup_table_edit->name }}" required>
                            </div>
                        </label>
                        @error('name')
                        <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                        @enderror


                        <label for="description"
                               class="block text-sm font-medium leading-6 text-gray-900">Description</label>
                        <div class="mt-2">
                            <div
                                class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                <input type="text" name="description" id="description"
                                       class="block flex-1 border-0 bg-transparent py-1  px-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                       placeholder="Example:  Looks like lions mane, maybe?"
                                       value="{{ $lookup_table_edit->description }}">
                            </div>

                            @error('description')
                            <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                            @enderror


                            <label for="comments"
                                   class="block text-sm font-medium leading-6 text-gray-900">Comments</label>
                            <div class="mt-2">
                                <div
                                    class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                    <input type="text" name="comments" id="comments"
                                           class="block flex-1 border-0 bg-transparent py-1  px-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                           placeholder="Example:  Little Brown Mushroom - Front Yard"
                                           value="{{ $lookup_table_edit->description }}">
                                </div>

                                @error('comments')
                                <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                                @enderror


                                <label for="source"
                                       class="block text-sm font-medium leading-6 text-gray-900">Source</label>
                                <div class="mt-2">
                                    <div
                                        class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                        <input type="text" name="source" id="source"
                                               class="block flex-1 border-0 bg-transparent py-1  px-1 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                               placeholder="Example:  Little Brown Mushroom - Front Yard"
                                               value="{{ $lookup_table_edit->source }}">
                                    </div>

                                    @error('source')
                                    <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                                    @enderror
                                </div>

                            </div>
                        </div>
                    </div>
                    @endforeach

                    <div>
                        <button type="submit"
                                class="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                            Update
                        </button>
                    </div>
                </div>
            </div>
    </form>

    <form method="POST" action="/lookup_lists/{{ $lookup_table_edit->id }}" id="delete-form" class="hidden">
        @csrf
        @method('DELETE')
    </form>
</x-layout>
