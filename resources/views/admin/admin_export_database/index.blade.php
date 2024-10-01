<x-layout>
    <x-admin-dashboard-nav-bar></x-admin-dashboard-nav-bar>
    <p>This is views/admin/admin_export_database/index.blade.php.</p>
    <h1 class="text-red-700 text-2xl">Export Database Page</h1>

    @if(session('success'))
        <div class="alert alert-success">
            {{ session('success') }}
        </div>
    @endif

    @if(session('error'))
        <div class="alert alert-danger">
            {{ session('error') }}
        </div>
    @endif

    <form action="{{ route('admin_export_database.index') }}" method="GET">
        @csrf

        <div class="space-y-12">
            <div class="border-b border-gray-900/10 pb-12">
                <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
                    <label for="database_name">Database Name</label>
                    <div class="mt-2">
                        <div
                            class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                            <input type="text" name="database_name" id="database_name"
                                   class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                   required>
                        </div>

                        @error('database_name')
                        <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                        @enderror
                    </div>
                </div>

                <div class="mx-auto mt-6">
                    <x-primary-button>Export Database to Storage</x-primary-button>
                </div>
            </div>
        </div>
    </form>

    <form action="{{ route('admin_export_database.index') }}" method="GET">
        @csrf

        <div class="space-y-12">
            <div class="border-b border-gray-900/10 pb-12">
                <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
                    <label for="database_name">Database Name</label>
                    <div class="mt-2">
                        <div
                            class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                            <input type="text" name="database_name" id="database_name"
                                   class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                   required>
                        </div>

                        @error('database_name')
                        <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                        @enderror
                    </div>
                </div>

                <div class="mx-auto mt-6">
                    <x-primary-button>Save Database to Local File</x-primary-button>
                </div>
            </div>
        </div>
    </form>
</x-layout>
