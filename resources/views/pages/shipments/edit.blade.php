<x-app-layout>
    @section('title', 'Edit Shipment')

    @section('content_header')
        <h1>Edit Shipment</h1>
    @stop

    @section('content')
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Edit Shipment</h3>
            </div>
            <div class="card-body">
                <form action="{{ route('shipments.update', $shipment->id) }}" method="POST">
                    @csrf
                    @method('PUT')
                    @include('pages.shipments.form')
                    <div class="row">
                        <div class="col-md-6">
                            <a href="#" class="btn btn-outline-primary"
                                onclick="calcTotalWeight(); return false;">Calculate</a>

                        </div>
                        <div class="col-md-6 text-right">
                            <button type="submit" class="btn btn-secondary">Discard</button>
                            <button type="submit" class="btn btn-info">Update Shipment</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    @stop
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
</x-app-layout>
