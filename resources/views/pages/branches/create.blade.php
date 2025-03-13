<x-app-layout>

    @section('content')
        <h1>Create Branch</h1>

        <form action="{{ route('branches.store') }}" method="POST">
            @csrf
            @include('pages.branches.form')

            <div class="col-12 text-right">
                <button type="submit" class="btn btn-success">Save</button>
            </div>
        </form>
    @stop

</x-app-layout>
