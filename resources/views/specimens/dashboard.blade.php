<x-layout>
    <div class="container">
        <h1>Specimen Dashboard</h1>
        <nav>
            <ul>
                <li><a href="{{ route('specimens.create') }}">Add Specimen</a></li>
                <li><a href="{{ route('specimen_cluster.index') }}">Manage Clusters</a></li>
                <li><a href="{{ route('specimen_group.index') }}">Manage Groups</a></li>
                <li><a href="{{ route('specimen_compare.index') }}">Compare Specimens</a></li>
            </ul>
        </nav>
        <h2>Your Specimens</h2>
        <form>
            @php //dd($specimens); @endphp
            @foreach($specimens as $specimen)
                <div>
                    <input type="radio" id="specimen-{{ $specimen->id }}" name="specimen" value="{{ $specimen->id }}">
                    <label
                        for="specimen-{{ $specimen->id }}">{{ $specimen['specimen_name'] }} {{ $specimen['comment'] }}</label>
                </div>
            @endforeach
        </form>
    </div>
</x-layout>
