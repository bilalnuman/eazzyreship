<x-app-layout>

    @section('content')
        <h1>Edit Package</h1>
    
        <form action="{{ route('packages.update', $package->id) }}" method="POST">
            @csrf
            @method('PUT')
            @include('pages.packages.form')
            <div class="col-12 text-right">
            <button type="submit" class="btn btn-success">Update</button>
            </div>
        </form>
    @stop
    
</x-app-layout>
    