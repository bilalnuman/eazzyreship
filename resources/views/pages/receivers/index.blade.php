<x-app-layout>

    @section('title', 'Receivers')

    @section('content_header')
        <h1>Receivers</h1>
    @stop

    @section('content')
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Receivers List</h3>
                <a href="{{ route('pages.receivers.create') }}" class="btn btn-primary float-right">Add New Receiver</a>
            </div>
            <div class="card-body">
                <table id="receivers-table" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Mobile</th>
                            <th>Branch</th>
                            <th>Address</th>
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
                $('#receivers-table').DataTable({
                    processing: true,
                    serverSide: false,
                    ordering: false,
                    ajax: '{{ route('receivers.data') }}',
                    columns: [
                        { data: 'id',name: 'id'},
                        {data: 'name',name: 'name'},
                        {data: 'receiver_mobile', name: 'receiver_mobile'},
                        { data: 'branch_id',name: 'branch_id'},
                        {data: 'receiver_address',name: 'receiver_address'},
                        {
                            data: null,
                            name: 'actions',
                            orderable: false,
                            searchable: false,
                            className: 'text-right', 
                            render: function(data, type, row) {
                                return `
                                <a href="/receiver/${row.id}/edit" class="btn btn-sm btn-primary">Edit</a>
                                <a href="#" onclick="confirmDelete(${row.id})" class="btn btn-sm btn-danger">Delete</a>
                            `;
                            }
                        }
                    ],
                    language: {
                        url: "//cdn.datatables.net/plug-ins/1.13.6/i18n/es-ES.json"
                    }
                });
            });
        </script>
        <script>
            function confirmDelete(receiverId) {
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
                        window.location.href = `/receiver/${receiverId}/delete`;
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
