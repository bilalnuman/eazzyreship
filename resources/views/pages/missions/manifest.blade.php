<x-app-layout>
    <div class="container mt-4">
        <h1>Mission Details</h1>
        @section('content')
            <!-- Datos de la misión -->
            <br>
            <div class="card mb-4">
                <div class="card-body">
                    <h3>{{ $mission->id }}</h3>
                    <p>Status: {{ $mission->status_id == 1 ? 'active' : 'closed' }}</p>
                    <p>Code: {{ $mission->code }}</p>
                    <p>Date: {{ $mission->due_date }}</p>
                    <p>From: {{ $mission->fromBranch->name }}</p>
                    <p>To: {{ $mission->toBranch->name }}</p>
                </div>
            </div>

            <!-- Lista de envíos asignados -->
            <h2>Assigned Shipments</h2>
            <table id="missions-table" class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Code</th>
                        <th>Client</th>
                        <th>To Branch</th>
                        <th>Receiver</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
            </table>

            <!-- Lista de envíos disponibles para asignar -->
            @if ($mission->status_id == 1)
                <br>
                <h2>Add Shipments</h2>
                <form action="{{ route('missions.add-shipments', $mission->id) }}" method="POST">
                    @csrf
                    <div class="form-group">
                        <label for="shipments">Available Shipments:</label>
                        <select name="shipment_ids[]" id="shipments" class="form-control" multiple>
                            
                            @foreach ($availableShipments as $shipment)
                                <option value="{{ $shipment['id'] }}">
                                    {{ $shipment['code'] }},
                                    client name: {{ $shipment['client_id'] }},
                                    from: {{ $shipment['from_branch_id'] }},
                                    to: {{ $shipment['to_branch_id'] }},
                                    receiver name: {{ $shipment['receiver_name'] }},
                                    total weight: {{ $shipment['total_weight'] }}
                                </option>
                            @endforeach
                            
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary mt-2">Add Shipments</button>
                </form>
                <br>
            @endif
        </div>
    @stop

    @push('js')
        <script>
            let missionsData = @json($shipmentsData);
            let status = @json($mission->status_id);
            let mission = @json($mission->id);
            $(function() {
                $('#missions-table').DataTable({
                    processing: true,
                    serverSide: false,
                    ordering: false,
                    data: missionsData,
                    columns: [{
                            data: 'id',
                            name: 'id'
                        },
                        {
                            data: 'code',
                            name: 'code'
                        },
                        {
                            data: 'client',
                            name: 'client'
                        },
                        {
                            data: 'to_branch',
                            name: 'to_branch'
                        },
                        {
                            data: 'receiver',
                            name: 'receiver'
                        },
                        {
                            data: 'status',
                            name: 'status'
                        },
                        {
                            data: null,
                            name: 'action',
                            orderable: false,
                            searchable: false,
                            className: 'text-right',
                            render: function(data, type, row) {
                                return `
                                    <a href="/shipment/show/${row.id}" class="btn btn-sm btn-primary">View</a>                        
                                    ${status != '0' ? `<a href="#" onclick="confirmDelete(${row.id},${mission})" class="btn btn-sm btn-danger">Delete</a>` : ''}
                                    
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

            function confirmDelete(shipmentId, missionId) {
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
                        window.location.href = `/mission/${missionId}/remove-shipment/${shipmentId}`;
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
