<x-app-layout>
    @section('title', 'Clients')

    @section('content_header')
        <h1>Clients</h1>
    @stop

    @section('content')
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Client List</h3>
                <div class="card-tools">
                    <a href="{{ route('pages.clients.create') }}" class="btn btn-success btn-sm">Add Client</a>
                </div>
            </div>
            <div class="card-body">
                <table id="clients-table" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Branch</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    @stop

    @push('js')
        <script>
            $(function() {
                $('#clients-table').DataTable({
                    processing: true,
                    serverSide: false,
                    ordering: false,
                    ajax: '{{ route('clients.data') }}',
                    columns: [{data: 'id',name: 'id'},
                        {data: 'name',name: 'name'},
                        {data: 'email', name: 'enail'},
                        {data: 'mobile',name: 'mobile' },
                        {data: 'branch_id',name: 'branch_id'},
                        {
                            data: null,
                            name: 'action',
                            orderable: true,
                            searchable: true,
                            className: 'text-right',
                            render: function(data, type, row) {
                                return `
                                <a href="/client/${row.id}/edit" class="btn btn-sm btn-primary">Edit</a>
                                <!--a href="#" onclick="confirmDelete(${row.id})" class="btn btn-sm btn-danger">Delete</a-->
                            `;
                            },
                            className: 'text-right'
                        }
                    ],
                    language: {
                        url: "//cdn.datatables.net/plug-ins/1.13.6/i18n/es-ES.json"
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
                        window.location.href = `/client/${missionId}/delete`;
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
