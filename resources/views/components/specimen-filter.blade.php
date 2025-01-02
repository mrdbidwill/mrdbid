<div class="p-4 bg-white shadow-md rounded-md">
    <form method="GET" action="{{ route('specimens.filter') }}">
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
            <!-- Month Filter -->
            <div>
                <label for="month" class="block text-sm font-medium text-gray-700">Month Found</label>
                <select id="month" name="month" class="w-full mt-1 rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500">
                    <option value="">All Months</option>
                    @foreach(['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'] as $month)
                        <option value="{{ $month }}" {{ request('month') == $month ? 'selected' : '' }}>{{ $month }}</option>
                    @endforeach
                </select>
            </div>

            <!-- Year Filter -->
            <div>
                <label for="year" class="block text-sm font-medium text-gray-700">Year Found</label>
                <input type="number" id="year" name="year" value="{{ request('year') }}" placeholder="e.g. 2023"
                       class="w-full mt-1 rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500">
            </div>

            <!-- State Filter -->
            <div>
                <label for="state" class="block text-sm font-medium text-gray-700">State</label>
                <select id="state" name="state" class="w-full mt-1 rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500">
                    <option value="">All States</option>
                    @foreach($states as $state)
                        <option value="{{ $state->name }}" {{ request('state') == $state->name ? 'selected' : '' }}>{{ $state->name }}</option>
                    @endforeach
                </select>
            </div>

            <!-- Country Filter -->
            <div>
                <label for="country" class="block text-sm font-medium text-gray-700">Country</label>
                <select id="country" name="country" class="w-full mt-1 rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500">
                    <option value="">All Countries</option>
                    @foreach($countries as $country)
                        <option value="{{ $country->name }}" {{ request('country') == $country->name ? 'selected' : '' }}>{{ $country->name }}</option>
                    @endforeach
                </select>
            </div>
        </div>

        <!-- Submit Button -->
        <div class="mt-4 text-right">
            <button type="submit"
                    class="px-4 py-2 bg-blue-600 text-white text-sm rounded-md shadow-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
                Apply Filters
            </button>
        </div>
    </form>
</div>
