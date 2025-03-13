@section('content')
    <section>
        <div class="row">
            <!-- All Shipments -->
            <div class="col-lg-3 col-6">
                <div class="small-box bg-info">
                    <div class="inner">
                        <h3>{{ $allShipments ?? '0' }}</h3>
                        <p>{{ __('all Shipments') }}</p>
                    </div>
                    <div class="icon">
                        <i class="fas fa-box-open"></i>
                    </div>
                    <a href="{{ route('pages.shipments.index')}}"
                        class="small-box-footer">
                        {{ __('more info') }} <i class="fas fa-arrow-circle-right"></i>
                    </a>
                </div>
            </div>

            <!-- Saved Shipments -->
            <div class="col-lg-3 col-6">
                <div class="small-box bg-success">
                    <div class="inner">
                        <h3>{{ $savedShipments ?? '0' }}</h3>
                        <p>{{ __('saved shipments') }}</p>
                    </div>
                    <div class="icon">
                        <i class="fas fa-box-open"></i>
                    </div>
                    <a href="{{ route('pages.shipments.index') }}"
                        class="small-box-footer">
                        {{ __('more info') }} <i class="fas fa-arrow-circle-right"></i>
                    </a>
                </div>
            </div>

            <!-- In-Progress Shipments -->
            <div class="col-lg-3 col-6">
                <div class="small-box bg-warning">
                    <div class="inner">
                        <h3>{{ $inprogressShipments ?? '0' }}</h3>
                        <p>{{ __('in progress shipments') }}</p>
                    </div>
                    <div class="icon">
                        <i class="fas fa-box-open"></i>
                    </div>
                    <a href="{{ route('pages.shipments.index') }}"
                        class="small-box-footer">
                        {{ __('more info') }} <i class="fas fa-arrow-circle-right"></i>
                    </a>
                </div>
            </div>

            <!-- Delivered Shipments -->
            <div class="col-lg-3 col-6">
                <div class="small-box bg-danger">
                    <div class="inner">
                        <h3>{{ $deliveredShipments ?? '0' }}</h3>
                        <p>{{ __('delivered shipments') }}</p>
                    </div>
                    <div class="icon">
                        <i class="fas fa-box-open"></i>
                    </div>
                    <a href="{{ route('pages.shipments.index') }}"
                        class="small-box-footer">
                        {{ __('more info') }} <i class="fas fa-arrow-circle-right"></i>
                    </a>
                </div>
            </div>
        </div>
    </section>


    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Last Shipments</h3>
        </div>
        <div class="card-body">
            <table id="shipments-table" class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Code</th>
                        <th>Status</th>
                        <th>Customer</th>
                        <th>Receiver Name</th>
                        <th>From Branch</th>
                        <th>To Branch</th>
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
                columns: [{data: 'id',name: 'id'},
                        {data: 'code',name: 'code'},
                        {data: 'status_id',name: 'status_id'},
                        {data: 'client_id',name: 'client_id'},
                        {data: 'receiver_name',name: 'receiver_name'},
                        {data: 'from_branch_id',name: 'from_branch'},
                        {data: 'to_branch_id',name: 'to_branch'},
                        {data: 'created_at',name: 'created_at'},
                        {
                        data: null,
                        name: 'action',
                        orderable: true,
                        searchable: true,
                        className: 'text-right',
                        render: function(data, type, row) {
                            return `
                                <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                                    <a href="/shipment/show/${row.id}" class="btn btn-primary"><i class="fas fa-eye"></i></a>
                                    <a href="/shipment/${row.id}/edit" class="btn btn-warning"><i class="fas fa-pen"></i></a>
                                    ${row.paid != 1 ? `<a href="/payment/create/${row.id}" class="btn btn-success"><i class="fas fa-credit-card"></i></a>                    
                                    <a href="#" onclick="confirmDelete(${row.id})" class="btn btn-danger"><i class="fas fa-trash"></i></a>` : ''}
                                    
                                    
                                </div>`;
                        }
                    }
                ],
                language: {
                    url: "//cdn.datatables.net/plug-ins/1.13.6/i18n/en-EN.json",
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
