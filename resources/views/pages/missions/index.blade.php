<x-app-layout>
    @section('title', 'Missions')

    @section('content_header')
        <h1>Missions</h1>
    @stop

    @section('content')
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Mission List</h3>
                <div class="card-tools">
                    <a href="{{ route('pages.missions.create') }}" class="btn btn-success btn-sm">Create Mission</a>
                </div>
            </div>
            <div class="card-body">
                <table id="missions-table" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Code</th>
                            <th>From Branch</th>
                            <th>To Branch</th>
                            <th>Status</th>
                            <th>Type</th>
                            <th>Due Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    @stop

    @push('js')
        <script>
            let missionsData = @json($missionsData);
            
            $(function() {
                $('#missions-table').DataTable({
                    processing: true,
                    serverSide: false,
                    ordering: false,
                    data: missionsData,
                    columns: [{data: 'id', name: 'id'},
                        {data: 'code',name: 'code'},
                        {data: 'from_branch_id',name: 'from_branch_id'},
                        {data: 'to_branch_id',name: 'to_branch_id'},
                        {data: 'status_id',name: 'status_id'},
                        {data: 'type',name: 'type'},
                        {data: 'due_date',name: 'due_date'},
                        {
                            data: null,
                            name: 'action',
                            orderable: false,
                            searchable: false,
                            className: 'text-right',
                            render: function(data, type, row) {
                                return `
                                    <a href="/manifest/${row.id}" class="btn btn-sm btn-info">View</a>                        
                                    ${row.status_id != 'Close' ? `<a href="/mission/${row.id}/edit" class="btn btn-sm btn-primary">Edit</a>
                                    <a href="/mission/${row.id}/change-status" class="btn btn-sm btn-warning">Close</a>
                                    <!--a href="#" onclick="confirmDelete(${row.id})" class="btn btn-sm btn-danger">Delete</a-->` : 
                                    `<a href="/mission/${row.id}/manifest-report" class="btn btn-sm btn-secondary">PDF</a>`}
                                    
                                `;
                            },
                            className: 'text-right'
                        }
                    ],
                    language: {
                        url: "//cdn.datatables.net/plug-ins/1.13.6/i18n/en-EN.json"
                    }
                });
            });

            function confirmDelete(missionId) {
                Swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = `/mission/${missionId}/delete`;
                    }
                });
            }
        </script>

        @if (($message = Session::get('message')) && ($icon = Session::get('icon')))
            <script>
                Swal.fire({
                    position: "top-end",
                    icon: "{{ $icon }}",
                    title: "{{ $message }}",
                    showConfirmButton: false,
                    timer: 1500
                });
            </script>
        @endif
    @endpush
</x-app-layout>
