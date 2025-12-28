<x-app-layout>
    @section('title', 'Edit Mission')

    @section('content_header')
        <h1>Edit Manifest</h1>
    @stop

    @section('content')
        <form action="{{ route('missions.update', $mission->id) }}" method="POST">
            @csrf
            @method('PUT')
            @include('pages.missions.form', ['mission' => $mission])
            <div class="col-12 text-right">
            <button type="submit" class="btn btn-primary">Update</button>
            </div>
        </form>
    @stop
</x-app-layout>
