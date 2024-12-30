<x-app-layout>
    @section('title', 'Add Client')

    @section('content_header')
        <h1>Add Client</h1>
        <h6>Default password for new users: "password"</h6>
    @stop

    @section('content')
        <form action="{{ route('clients.store') }}" method="POST">
            @csrf
            @include('pages.clients.form')
            <div class="col-12 text-right">
            <button type="submit" class="btn btn-success">Save</button>
            </div>
        </form>
    @stop
</x-app-layout>