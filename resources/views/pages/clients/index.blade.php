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
                    <a href="{{ route('pages.clients.create') }}" class="btn btn-success btn-sm">
                        Add Client
                    </a>
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
                            <th width="160">Actions</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    @stop

    @push('js')
        <script>
            $(function () {
                $('#clients-table').DataTable({
                    processing: true,
                    serverSide: false,
                    ordering: false,
                    ajax: '{{ route('clients.data') }}',
                    columns: [
                        { data: 'id', name: 'id' },
                        { data: 'name', name: 'name' },
                        { data: 'email', name: 'email' },
                        { data: 'mobile', name: 'mobile' },
                        { data: 'branch_id', name: 'branch_id' },
                        {
                            data: null,
                            orderable: false,
                            searchable: false,
                            className: 'text-right',
                            render: function (data, type, row) {
                                return `
                                    <a href="/client/${row.id}/edit"
                                       class="btn btn-sm btn-primary mr-1">
                                        Edit
                                    </a>

                                    <button class="btn btn-sm btn-danger"
                                        onclick="confirmDelete(${row.id})">
                                        Delete
                                    </button>
                                `;
                            }
                        }
                    ],
                    language: {
                        url: "//cdn.datatables.net/plug-ins/1.13.6/i18n/en-EN.json"
                    }
                });
            });

            function confirmDelete(clientId) {
                Swal.fire({
                    title: 'Are you sure?',
                    text: "This client will be permanently deleted!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = `/client/${clientId}/delete`;
                    }
                });
            }
        </script>

        @if (Session::has('message') && Session::has('icon'))
            <script>
                Swal.fire({
                    position: "top-end",
                    icon: "{{ Session::get('icon') }}",
                    title: "{{ Session::get('message') }}",
                    showConfirmButton: false,
                    timer: 1500
                });
            </script>
        @endif
    @endpush
</x-app-layout>
