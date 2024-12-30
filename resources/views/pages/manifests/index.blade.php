<x-app-layout>
    @section('title', 'Manifest')

    @section('content_header')
        <h1>Manifest</h1>
    @stop

    @section('content')
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Mission List</h3>
            </div>
            <div class="card-body">
                <table id="manifest-table" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Code</th>
                            <th>Branch</th>
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
            $(function() {
                $('#manifest-table').DataTable({
                    processing: true,
                    serverSide: false,
                    ordering: false,
                    ajax: '{{ route('manifests.data') }}',
                    columns: [{
                            data: 'id',
                            name: 'id'
                        },
                        {
                            data: 'code',
                            name: 'code'
                        },
                        {
                            data: 'to_branch_id',
                            name: 'to_branch_id'
                        },
                        {
                            data: 'status_id',
                            name: 'status_id'
                        },
                        {
                            data: 'type',
                            name: 'type'
                        },
                        {
                            data: 'due_date',
                            name: 'due_date'
                        },
                        {
                            data: null,
                            name: 'action',
                            orderable: false,
                            searchable: false,
                            className: 'text-right',
                            render: function(data, type, row) {
                                return `                                 
                                    <a href="/manifest/show/${row.id}" class="btn btn-sm btn-success">View</a>                                   
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
