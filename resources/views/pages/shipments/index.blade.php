<x-app-layout>
    @section('title', 'Shipments')

    @section('content_header')
        <h1>Shipments</h1>
    @stop

    @section('content')
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">All Shipments List</h3>
                <a href="{{ route('pages.shipments.create') }}" class="btn btn-primary float-right">Add New Shipement</a>
            </div>
            <div class="card-body">
                <table id="shipments-table" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Attachments</th>
                            <th>Code</th>
                            <th>Status</th>
                            <th>Customer</th>
                            <th>To Branch</th>
                            <th>Manifest</th>
                            <th>Shipper</th>   
                            <th>Vendor Tracking</th>
                            <th>Package Type</th>
                            <th>Total Cost</th>
                            <th>Shipment Received</th>
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
                $('#shipments-table').DataTable({
                    processing: true,
                    serverSide: false,
                    ordering: false,
                    ajax: '{{ route('shipments.data') }}',
                    columns: [
                        {
                            data: null,
                            name: 'attachments',
                            orderable: true,
                            searchable: true,
                            render: function(data, type, row) {
                                return `
                                <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                                    <a href="/shipment/attachments/${row.id}" class="btn btn-primary"><i class="fas fa-eye"></i></a>
                                </div>`;
                            }
                        },
                        
                        {data: 'code',name: 'code'},
                        {data: 'status_id',name: 'status_id'},
                        {data: 'client_id',name: 'client_id'},
                        {data: 'to_branch_id',name: 'to_branch'},
                        {data: 'mission_id',name: 'mission_id'},
                        {data: 'carrier',name: 'carrier'},
                        {data: 'barcode',name: 'barcode'},
                        {data: 'type',name: 'type'},
                        {data: 'total_cost',name: 'total_cost'},
                        {data: 'created_at',name: 'create_at'},
                        {
                            data: null,
                            name: 'action',
                            orderable: true,
                            searchable: true,
                            className: 'text-right',
                            render: function(data, type, row) {
                                console.log(data,'data data')
                                return `
                                <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                                    <a href="/shipment/show/${row.id}" class="btn btn-primary"><i class="fas fa-eye"></i></a>
                                    <a href="/shipment/${row.id}/edit" class="btn btn-warning"><i class="fas fa-pen"></i></a>
                                    ${row.paid != 1 ? `<a href="/payment/create/${row.id}" class="btn btn-success"><i class="fas fa-credit-card"></i></a>                    
                                    <a href="#" onclick="confirmDelete(${row.id})" class="btn btn-danger"><i class="fas fa-trash"></i></a>` : ''}
                                    
                                    
                                </div>`;
                            }
                        },
                        
                    ],
                    language: {
                        url: "//cdn.datatables.net/plug-ins/1.13.6/i18n/en-EN.json",
                    },
                    scrollX: true,
                });
            });
        </script>
        <script>
            function confirmDelete(shipmentId) {
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
                        window.location.href = `/shipment/${shipmentId}/delete`;
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
