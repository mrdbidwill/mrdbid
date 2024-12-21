@extends('layouts.app')

@section('content')


    <x-specimens-nav-bar></x-specimens-nav-bar>

        {{-- Show file address if in development environment --}}
        @if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/specimen_groups/create.blade.php</p>
    @endif


    <p>resources/views/specimen_groups/create.blade.php</p>

    <form method="POST" action="{{ route('specimen_groups.store') }}">
        @csrf

        <div class="space-y-12">
            <div class="border-b border-gray-900/10 pb-12">
                <h2 class="text-base font-semibold leading-7 text-gray-900">Create a New Group</h2>


                <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
                    <x-form-field>
                        <x-form-label for="name">Group Name</x-form-label>

                        <div class="shadow mt-2 leading-tight focus:outline-none focus:shadow-outline">
                            <x-form-input name="name" id="name" placeholder=""/>

                            <x-form-error name="name"/>
                        </div>
                    </x-form-field>

                    <x-form-field>
                        <x-form-label for="description">Description</x-form-label>

                        <div class="shadow mt-2 leading-tight focus:outline-none focus:shadow-outline">
                            <textarea name="description" rows="4" style="width: 100%;"></textarea>

                            <x-form-error name="description"/>
                        </div>
                    </x-form-field>

                    <x-form-field>
                        <x-form-label for="comments">Comments</x-form-label>

                        <div class="shadow mt-2 leading-tight focus:outline-none focus:shadow-outline">
                            <textarea name="comments" rows="4" style="width: 100%;"></textarea>

                            <x-form-error name="comments"/>
                        </div>
                    </x-form-field>
                </div>
            </div>
        </div>

        <div class="mt-6 flex items-center justify-end gap-x-6">
            <button type="button" class="text-sm font-semibold leading-6 text-gray-900">Cancel</button>
            <x-form-button>Save</x-form-button>
        </div>
    </form>
@endsection


