<x-app-layout>
    @section('title', 'Edit Client')

    @section('content_header')
        <h1>Edit Client</h1>
        <h6>name, email and branch will not be updated</h6>
    @stop

    @section('content')
        <form action="{{ route('clients.update', $client->id) }}" method="POST">
            @csrf
            @method('PUT')
            @include('pages.clients.form', ['client' => $client])
            <div class="col-12 text-right">
            <button type="submit" class="btn btn-primary">Update</button>
            </div>
        </form>
    @stop
</x-app-layout>