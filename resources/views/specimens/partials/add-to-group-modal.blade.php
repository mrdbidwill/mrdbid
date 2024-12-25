<!-- Add to Group Modal -->
<div class="modal fade" id="addToGroupModal" tabindex="-1" aria-labelledby="addToGroupModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form method="POST" action="{{ route('specimens.addToGroup', $specimen->id) }}">
            @csrf
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addToGroupModalLabel">Add Specimen to Group</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <label for="group_id" class="form-label">Select a Group:</label>
                    <select name="group_id" id="group_id" class="form-control" required>
                        <option value="" disabled selected>Select Group</option>
                        @php //dd($all_groups); @endphp
                        @foreach ($all_groups ?? [] as $group)
                            <option value="{{ $group->id }}">{{ $group->name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Add to Group</button>
                </div>
            </div>
        </form>
    </div>
</div>
