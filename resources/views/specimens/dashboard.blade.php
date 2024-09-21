<x-layout>
    <div class="container">
        <x-dashboard-nav-bar></x-dashboard-nav-bar>

        <div class="flex justify-center items-center h-full">
            <h1 class="text-green-500 text-4xl">Specimen Dashboard</h1>
        </div>

        <h2 class="text-red-500 text-2xl">Your Specimens:</h2>
        @php //dd($specimens); @endphp
        @foreach($specimens as $key => $specimen)
            <div class="flex h-full">
                <a href="{{ url('specimens/'.$specimen['id'].'/edit') }}"
                   class="cursor-pointer flex w-full h-full p-4 border rounded-lg">{{ $specimen['specimen_name'] }} {{ $specimen['comment'] }}</a>
            </div>
        @endforeach
    </div>
</x-layout>
