<x-app-layout>
    @section('title', 'Edit Shipment')

    @section('content_header')
        <h1>Edit Shipment | {{ $shipment->code }}</h1>
    @stop

    @section('content')
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Edit Shipment</h3>
            </div>
            <div class="card-body">
                <form action="{{ route('shipments.update', $shipment->id) }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('PUT')
                    @include('pages.shipments.form')
                    <div class="row">
                        <div class="col-md-6">
                            <button type='button' class="btn btn-outline-primary" id="calculate-fn">Calculate</button>

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

    @push('js')
        <script>
            $('.remove-attachment').on('click', function() {
                const attachmentId = $(this).data('id');
                const url = `/shipment/{{ $shipment->id }}/attachments/${attachmentId}`;

                $.ajax({
                    url: url,
                    type: 'DELETE',
                    data: {
                        _token: '{{ csrf_token() }}'
                    },
                    success: function(response) {
                        alert(response.message);
                        location.reload(); // O actualiza la lista de archivos dinámicamente
                    },
                    error: function(error) {
                        alert('An error occurred.');
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
</x-app-layout>
