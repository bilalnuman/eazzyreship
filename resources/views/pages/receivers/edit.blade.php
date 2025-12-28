<x-app-layout>
    @section('title', 'Edit Receiver')

    @section('content_header')
        <h1>Edit Receiver</h1>
    @stop

    @section('content')
        <form action="{{ route('receivers.update', $receiver->id) }}" method="POST">
            @csrf
            @method('PUT')
            @include('pages.receivers.form')
            <div class="col-12 text-right">
                <button type="submit" class="btn btn-primary">Update</button>
            </div>
        </form>
    @stop
</x-app-layout>
