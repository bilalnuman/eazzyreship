<x-app-layout>

@section('content')
    <h1>Edit Branch</h1>

    <form action="{{ route('branches.update', $branch->id) }}" method="POST">
        @csrf
        @method('PUT')
        @include('pages.branches.form')
        <div class="col-12 text-right">
        <button type="submit" class="btn btn-primary">Update</button>
        </div>
    </form>
@stop

</x-app-layout>
