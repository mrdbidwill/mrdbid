<x-layout>
    <div class="container">
        <x-dashboard-nav-bar></x-dashboard-nav-bar>

        <div class="flex justify-center items-center h-full">
            <h1 class="text-green-500 text-4xl">Specimen Dashboard</h1>
        </div>

        <h2 class="text-red-500 text-2xl">Your Specimens:</h2>
        <form>
            @php //dd($specimens); @endphp
            @foreach($specimens as $key => $specimen)
                <div class="flex h-full">
                    <label for="specimen-{{ $specimen->id }}"
                           class="cursor-pointer flex w-full h-full p-4 border rounded-lg {{ $key % 2 === 0 ? 'bg-gray-200' : 'bg-white' }}">
                        <input type="radio" id="specimen-{{ $specimen->id }}" name="specimen"
                               value="{{ $specimen->id }}" class="hidden">
                        {{ $specimen['specimen_name'] }} {{ $specimen['comment'] }}</label>
                </div>
            @endforeach
        </form>
    </div>
</x-layout>
