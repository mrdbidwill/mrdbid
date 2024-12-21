@extends('layouts.app')

@section('content')

    <x-admin-dashboard-nav-bar></x-admin-dashboard-nav-bar>

    {{-- Show file address if in development environment --}}
    @if (config('app.env') === 'local')
        <p class="text-gray-500 mt-4">File Address: /resources/views/admin/admin_character/create.blade.php</p>
    @endif

    <form method="POST" action="/admin_character/">
        @csrf

        <div class="space-y-12">
            <div class="border-b border-gray-900/10 pb-12">
                <h2 class="text-base font-semibold leading-7 text-gray-900">Add a new character to the "characters"
                    Table?</h2>
                <h2 class="text-sm font-semibold leading-5 text-red-800">Admin! Admin! Admin! Admin! Admin!</h2>

                <p>This is resources/views/admin/admin_character/create.blade.php</p>

                <p class="mt-1 text-sm leading-6 text-gray-600">All fields are required.</p>

                <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
                    <x-form-field>
                        <x-form-label for="name">Character Name</x-form-label>

                        <div class="mt-2">
                            <x-form-input name="name" id="name" placeholder="Full Moon Behavior"/>

                            <x-form-error name="name"/>
                        </div>
                    </x-form-field>
                    @php
                        $display_options = DB::table('display_options')->get();
                    @endphp


                    <x-form-field>
                        <x-form-label for="display_options">How should this character be displayed in a form?
                        </x-form-label>
                        @foreach($display_options as $display_option)
                            <div class="mt-2">
                                <input type="radio" value="{{ $display_option->id }}" id="display_options"
                                       name="display_options"> {{ $display_option->name}}
                                @endforeach
                                <x-form-error name="display_options"/>
                            </div>
                    </x-form-field>


                    <x-form-field>
                        <x-form-label for="look_up_y_n">Does this character need a lookup table?</x-form-label>

                        <fieldset>
                            <label>Yes<input type="radio" name="look_up_y_n" value="0"></label> <label>No<input
                                    type="radio" name="look_up_y_n" value="1"></label>
                        </fieldset>

                        <x-form-error name="look_up_y_n"/>
                    </x-form-field>


                    @php
                        $parts = DB::table('parts')->get();
                    @endphp


                    <x-form-field>
                        <x-form-label for="parts">What part is referred to?</x-form-label>

                        <div class="mt-2">
                            @foreach($parts as $part)
                                <input type="radio" value="{{ $part->id }}" id="parts" name="parts">  {{ $part->name}}
                            @endforeach
                            <x-form-error name="parts"/>
                        </div>
                    </x-form-field>


                    @php
                        $data_sources = DB::table('data_sources')->get();
                    @endphp


                    <x-form-field>
                        <x-form-label for="source">What is the verifiable source for this character?</x-form-label>

                        <div class="mt-2">
                            @foreach($data_sources as $data_source)
                                <input type="radio" value="{{ $data_source->id }}" id="source"
                                       name="source"> {{ $data_source->title}}
                            @endforeach
                            <x-form-error name="source"/>
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


