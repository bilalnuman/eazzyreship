<x-app-layout>

    @section('content')
        <h1>Create Package</h1>
    
        <form action="{{ route('packages.store') }}" method="POST">
            @csrf
            @include('pages.packages.form')
            <div class="col-12 text-right">
            <button type="submit" class="btn btn-success">Save</button>
            </div>
        </form>
    @stop  
</x-app-layout>
    