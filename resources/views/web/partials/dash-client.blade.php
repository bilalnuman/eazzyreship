@section('content')
    <section>
        <div class="row">
            <!-- Wallet Card -->
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card bg-light">
                            <div class="card-body">
                                <a href="#" class="text-decoration-none">
                                    <h5 class="font-weight-bold">{{ __('This is your air shipment address:') }}</h5>
                                    <p class="font-weight-bold text-success mt-2"></p>
                                    <p class="text-danger text-dark mt-3">{{'EazzyReship / (your name here)'}}<br>
                                        {{ '8069 NW 67th St' }}<br>{{ 'Suite: # ' }}{{ $client->code }}{{'-A'}}<br>{{ 'Miami FL 33166' }}<br>{{ 'USA' }}<br>{{ '+1 (786) 824-6549' }}
                                    </p>
                                    <p class="font-weight-bold text-dark text-success mt-3"></p>

                                    <div style="width: 100%; height: 1px; background-color: #3f4254; margin-top: 9px;">
                                    </div>
                                </a>

                                <p class="m-0 text-dark text-xs"><br>
                                    {{ __('If you have any questions, feel free to contact us at ') }}<a href="/#contact">info@eazzyreship.com</a> 
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card bg-light">
                            <div class="card-body">
                                <a href="#" class="text-decoration-none">
                                    <h5 class="font-weight-bold">{{ __('This is your ocean shipment address:') }}</h5>
                                    <p class="font-weight-bold text-success mt-2"></p>
                                    <p class="text-danger text-dark mt-3">{{'EazzyReship / (your name here)'}}<br>
                                        {{ '8069 NW 67th St' }}<br>{{ 'Suite: # ' }}{{ $client->code }}{{'-O'}}<br>{{ 'Miami FL 33166' }}<br>{{ 'USA' }}<br>{{ '+1 (786) 824-6549' }}
                                    </p>
                                    <p class="font-weight-bold text-dark text-success mt-3"></p>

                                    <div style="width: 100%; height: 1px; background-color: #3f4254; margin-top: 9px;">
                                    </div>
                                </a>

                                <p class="m-0 text-dark text-xs"><br>
                                    <br/>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
                    <a href="#" class="small-box-footer">
                        {{ __('total info') }}</i>
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
                    <a href="#" class="small-box-footer">
                        {{ __('total info') }}</i>
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
                    <a href="#" class="small-box-footer">
                        {{ __('total info') }}</i>
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
                    <a href="#" class="small-box-footer">
                        {{ __('total info') }}</i>
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
                        <th>From Branch</th>
                        <th>To Branch</th>
                        <th>Actions</th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
@stop

@push('js')
    <script>
        let id = {{ $client->id }};
        $(function() {
            $('#shipments-table').DataTable({
                processing: true,
                serverSide: false,
                ordering: false,
                ajax: '{{ route('dashboard.data', $client->id) }}',
                columns: [{
                        data: 'id',
                        name: 'id'
                    },
                    {
                        data: 'code',
                        name: 'code'
                    },
                    {
                        data: 'status_id',
                        name: 'status_id'
                    },
                    {
                        data: 'from_branch_id',
                        name: 'from_branch'
                    },
                    {
                        data: 'to_branch_id',
                        name: 'to_branch'
                    },
                    {
                        data: null,
                        name: 'action',
                        orderable: true,
                        searchable: true,
                        className: 'text-right',
                        render: function(data, type, row) {
                            return `
                    <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                        <a href="/dashboard/show/${row.id}" class="btn btn-primary"><i class="fas fa-eye"></i></a>                              
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
