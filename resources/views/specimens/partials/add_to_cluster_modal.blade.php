<!-- Add to Cluster Modal -->
<div class="modal fade" id="addToClusterModal" tabindex="-1" aria-labelledby="addToClusterModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form method="POST" action="{{ route('specimens.addToCluster', $specimen->id) }}">
            @csrf
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addToClusterModalLabel">Add Specimen to Cluster</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <label for="cluster_id" class="form-label">Select a Cluster:</label>
                    <select name="cluster_id" id="cluster_id" class="form-control" required>
                        <option value="" disabled selected>Select Cluster</option>
                        @foreach ($clusters as $cluster)
                            <option value="{{ $cluster->id }}">{{ $cluster->name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Add to Cluster</button>
                </div>
            </div>
        </form>
    </div>
</div>
