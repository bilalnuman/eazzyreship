<x-app-layout>

    @section('content')
        <h1>Edit Payment</h1>
        <form action="{{ route('payments.update', $payment) }}" method="POST">
            @csrf
            @method('PUT')
            @include('pages.payments.form')
            <button type="submit" class="btn btn-primary">Update</button>
        </form>
    @stop

</x-app-layout>
