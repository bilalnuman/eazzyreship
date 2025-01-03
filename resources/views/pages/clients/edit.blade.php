<x-app-layout>
    @section('title', 'Edit Client')

    @section('content_header')
        <h1>Edit Client</h1>
        <h6>name, email and branch will not be updated</h6>
    @stop

    @section('content')
    
        <form action="{{ auth()->user()->hasRole('user') ? route('dashboard.updateclient') : route('clients.update', $client->id) }}"  method="POST">
            @csrf
            @method('PUT')
            @include('pages.clients.form', ['client' => $client])
            <div class="col-12 text-right">
            <button type="submit" class="btn btn-primary">Update</button>
            </div>
        </form>
    @stop
    @push('js')
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