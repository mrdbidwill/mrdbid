<x-layout>
    <x-slot:heading>
        Create Character
    </x-slot:heading>

    <form method="POST" action="/{{ route('specimen_group.create') }}">
        @csrf

        <div class="space-y-12">
            <div class="border-b border-gray-900/10 pb-12">
                <h2 class="text-base font-semibold leading-7 text-gray-900">Create a New Character</h2>
                <p class="mt-1 text-sm leading-6 text-gray-600">Your groups:</p>

                <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
                    <x-form-field>
                        <x-form-label for="title">Groups</x-form-label>

                        <div class="mt-2">
                            <x-form-input name="character_name" id="character_name" placeholder="wrj_2_20_2024_1"/>

                            <x-form-error name="character_name"/>
                        </div>
                    </x-form-field>

                    <x-form-field>
                        <x-form-label for="common_name">Common Name</x-form-label>

                        <div class="mt-2">
                            <x-form-input name="common_name" id="common_name"
                                          placeholder="Little brown mushroom - front yard"/>

                            <x-form-error name="common_name"/>
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
</x-layout>
