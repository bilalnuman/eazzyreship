<x-app-layout>
    @section('content_header')
        <h1>Dashboard</h1>
    @stop
    @if (Auth::user()->hasRole('admin'))
        @include('web.partials.dash-admin')
    @endif
    @if (Auth::user()->hasRole('user'))
        @include('web.partials.dash-client');
    @endif
</x-app-layout>
