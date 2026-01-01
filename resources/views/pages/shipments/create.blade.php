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
                <form action="{{ route('shipments.store') }}" method="POST" id="shipments_form" enctype="multipart/form-data">
                    @csrf
                    @include('pages.shipments.form')

                    <div class="row">
                        <div class="col-md-6">
                            <button type="button" class="btn btn-outline-primary" id="calculate-fn">Calculate</button>

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
    @push('js')

   
    @if (($message = Session::get('message')) && ($icon = Session::get('icon')))
            <script>
                Swal.fire({
                    position: "top-end",
                    icon: "{{ $icon }}",
                    title: "{{ $message }}",
                    showConfirmButton: false,
                    timer: 6500
                });
            </script>
        @endif
    @endpush
</x-app-layout>
