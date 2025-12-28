<x-app-layout>

    @section('content')
        <h1>Create Payment</h1>

        <form action="{{ route('payments.store') }}" method="POST">
            @csrf
            @include('pages.payments.form')
            <div class="col-12 text-right">
                <button type="submit" class="btn btn-primary">Process Payment</button>
            </div>
        </form>
    @stop
    @push('js')
        @if(($message = Session::get('message')) && ($icon = Session::get('icon')))
        <script>
            Swal.fire({
                position: "top-end",
                icon: "{{$icon}}",
                title: "{{$message}}",
                showConfirmButton: false,
                timer: 1500
            });
        </script>
        @endif
    @endpush
</x-app-layout>
