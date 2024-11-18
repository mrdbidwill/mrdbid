<form action="{{ url('/compare') }}" method="POST">
    @csrf
    <label for="specimen_ids">Select Specimens:</label>
    <select name="specimen_ids[]" id="specimen_ids" multiple>
        @foreach($specimens as $specimen)
            <option value="{{ $specimen->id }}">{{ $specimen->name }}</option>
        @endforeach
    </select>
    <button type="submit">Compare</button>
</form>
