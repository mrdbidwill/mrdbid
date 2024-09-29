<x-layout>
    <x-admin-dashboard-nav-bar></x-admin-dashboard-nav-bar>
    <p>(resources/views/admin/admin_lookup_table/create.blade.php)</p>
    <form method="POST" action="/admin_look_up_table">
        @csrf

        <div class="space-y-12">
            <div class="border-b border-gray-900/10 pb-12">
                <h2 class="text-base font-semibold leading-7 text-gray-900">Create a New Look Up Table?</h2>
                <p class="mt-1 text-sm leading-6 text-gray-600">We just need a handful of details from you.</p>

                <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
                    <x-form-field>
                        <x-form-label for="title">Look Up Table Name</x-form-label>

                        <div class="mt-2">
                            <x-form-input name="look_up_table_name" id="character_name"
                                          placeholder="Look up table name"/>

                            <x-form-error name="look_up_table_name"/>
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
