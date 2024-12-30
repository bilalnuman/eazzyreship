<x-app-layout>

    @section('content')
    <div class="container">
        <h1>Shipping Manifest: {{ $mission->code }}</h1>
        <p><strong>Branch:</strong> {{ $mission->to_branch_id }}</p>
        <p><strong>Date:</strong> {{ $mission->due_date }}</p>
    
        <h2>Envios</h2>
        @foreach($mission->shipment as $shipment)
            <div class="card mb-3">
                <div class="card-header">
                    <strong>Envío #{{ $shipment->id }}</strong>
                </div>
                <div class="card-body">
                    <p><strong>Destinatario:</strong> {{ $shipment->receiver->name }}</p>
                    <p><strong>Dirección:</strong> {{ $shipment->client->address }}</p>
    
                    <h4>Packages</h4>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Dimensiones</th>
                                <th>Peso</th>
                                <th>Contenido</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($shipment->packages as $package)
                                <tr>
                                    <td>{{ $package->id }}</td>
                                    <td>{{ $package->dimensions }}</td>
                                    <td>{{ $package->weight }}</td>
                                    <td>{{ $package->content }}</td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        @endforeach

    </div>
    @endsection
    
</x-app-layout>
