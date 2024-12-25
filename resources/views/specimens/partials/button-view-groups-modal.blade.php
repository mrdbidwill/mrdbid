<!-- Groups Modal -->
<div class="modal fade" id="viewGroupsModal" tabindex="-1" aria-labelledby="viewGroupsModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="viewGroupsModalLabel">Specimen Groups</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Search Filter for Groups -->
                <input type="text" class="form-control mb-3" id="searchGroups" placeholder="Search Groups...">

                <!-- Groups Table -->
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Group Name</th>
                        <th>Description</th>
                    </tr>
                    </thead>
                    <tbody>
                    @php //dd($this_groups); @endphp
                    @foreach ($this_groups as $this_group)
                    <tr>
                        @php // dd($this_group->id); @endphp
                        <td>{{ $this_group->id }}</td>
                        <td>{{ $this_group->group_id }}</td>
                        <td>{{ $this_group->specimen_id }}</td>
                    </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
