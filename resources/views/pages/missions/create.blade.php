<x-app-layout>
    @section('title', 'Create Mission')

    @section('content_header')
        <h1>Create Mission</h1>
    @stop

    @section('content')
        <form action="{{ route('missions.store') }}" method="POST">
            @csrf
            @include('pages.missions.form')
            <div class="col-12 text-right">
            <button type="submit" class="btn btn-success">Save</button>
            </div>
        </form>
    @stop
</x-app-layout>