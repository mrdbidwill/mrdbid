<!-- Clusters Modal -->
<div class="modal fade" id="viewClustersModal" tabindex="-1" aria-labelledby="viewClustersModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="viewClustersModalLabel">Specimen Clusters</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Search Filter for Clusters -->
                <label for="searchClusters"></label>
                <input type="text" class="form-control mb-3" id="searchClusters" placeholder="Search Clusters...">

                <!-- Clusters Table -->
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Cluster Name</th>
                        <th>Description</th>
                    </tr>
                    </thead>
                    <tbody>
                    @php // dd($this_clusters); @endphp
                    @foreach ($this_clusters as $cluster)
                    <tr>
                        <td>{{ $cluster->id }}</td>
                        <td>{{ $cluster->cluster_id }}</td>
                        <td>{{ $cluster->specimen_id }}</td>
                    </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
