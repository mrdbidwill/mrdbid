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
                    @foreach ($this_clusters as $clusterSpecimen)
                        <tr>
                            <td>{{ $clusterSpecimen->cluster->id }}</td>
                            <td>{{ $clusterSpecimen->cluster->name }}</td>
                            <td>{{ $clusterSpecimen->cluster->description }}</td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
