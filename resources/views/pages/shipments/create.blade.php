<x-app-layout>
    @section('title', 'Create Shipment')

    @section('content_header')
        <h1>Create New Shipment</h1>
    @stop

    @section('content')
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">New Shipment</h3>
            </div>
            <div class="card-body">
                <form action="{{ route('shipments.store') }}" method="POST">
                    @csrf
                    @include('pages.shipments.form')

                    <div class="row">
                        <div class="col-md-6">
                            <a href="#" class="btn btn-outline-primary" onclick="calcTotalWeight(); return false;">Calculate</a>

                        </div>
                        <div class="col-md-6 text-right">
                            <button type="submit" class="btn btn-secondary">Discard</button>
                            <button type="submit" class="btn btn-info">Create Shipment </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    @stop
</x-app-layout>
