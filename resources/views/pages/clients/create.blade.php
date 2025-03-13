<x-app-layout>
    @section('title', 'Add Client')

    @section('content_header')
        <h1>Add Client</h1>
        <h6>Default password for new users: "password"</h6>
    @stop

    @section('content')
        <form action="{{ route('clients.store') }}" method="POST" enctype="multipart/form-data">
            @csrf
            @include('pages.clients.form')
            <div class="col-12 text-right">
            <button type="submit" class="btn btn-success">Save</button>
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