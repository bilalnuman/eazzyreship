@extends('adminlte::page')

@section('title', config('app.name', 'test'))
    @section('content')
        <main>
            {{ $slot }}
        </main>
    @stop

    @push('css')
        {{-- <link rel="stylesheet" href="/css/admin_custom.css"> --}}
        <style>
            .swal2-popup {
                font-size: 14px;
                /* Cambia el tamaño de todo el contenido */
            }
            /*para poner full ancho la caja de telefono intenacional*/
            .iti {
                width: 100%;
            }
        
            .iti__flag-container {
                height: 100%;
            }
        </style>
    @endpush

    @push('js')
        <script>
            console.log("Hi, I'm using the Laravel-AdminLTE package!");
        </script>
    @endpush
