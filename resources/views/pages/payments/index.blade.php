<x-app-layout>
    @section('title', 'Payments')

    @section('content_header')
        <h1>Payments</h1>
    @stop

    @section('content')
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Payments List</h3>
            </div>
            <div class="card-body">
                <table id="payments-table" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Seller</th>
                            <th>Shipment</th>
                            <th>Amount</th>
                            <th>Payment Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    @stop

    @push('js')
        <script>
            $(function () {
                $('#payments-table').DataTable({
                    processing: true,
                    serverSide: false,
                    ordering: false,
                    ajax: '{{ route('payments.data') }}',
                    columns: [
                        { data: 'id', name: 'id' },
                        { data: 'user.name', name: 'user.name' },
                        { data: 'shipment.code', name: 'shipment.code',render: function (data, type, row) {return `<a href="/shipment/show/${row.shipment_id}" class="text-primary">${data}</a>`;} },
                        { data: 'amount', name: 'amount' },
                        { data: 'payment_date', name: 'payment_date' },
                        {
                            data: null,
                            name: 'action',
                            orderable: false,
                            searchable: false,
                            className: 'text-right',
                            render: function (data, type, row) {
                                return `
                                    <a href="/payment/${row.id}/edit" class="btn btn-sm btn-primary">Edit</a>
                                    <!--a href="#" onclick="confirmDelete(${row.id})" class="btn btn-sm btn-danger">Delete</a-->
                                `;
                            }
                        }
                    ],
                    language: {
                        url: "//cdn.datatables.net/plug-ins/1.13.6/i18n/en-EN.json"
                    }
                });
            });

            function confirmDelete(paymentId) {
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
                        window.location.href = `/payment/${paymentId}/delete`;
                    }
                });
            }
        </script>

        @if(($message = Session::get('message')) && ($icon = Session::get('icon')))
        <script>
            Swal.fire({
                position: "top-end",
                icon: "{{$icon}}",
                title: "{{$message}}",
                showConfirmButton: false,
                timer: 1500
            });
        </script>
        @endif
    @endpush

</x-app-layout>
