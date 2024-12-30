<x-app-layout>
    @section('title', 'Create Receiver')

    @section('content_header')
        <h1>Create Receiver</h1>
    @stop

    @section('content')
        <form action="{{ route('receivers.store') }}" method="POST">
            @csrf
            @include('pages.receivers.form')

            <div class="col-12 text-right">
                <button type="submit" class="btn btn-success">Save</button>
            </div>
        </form>
    @stop

</x-app-layout>
