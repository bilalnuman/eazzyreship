<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        api: __DIR__.'/../routes/api.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
        $middleware
        ->trustProxies('*') // Confía en todos los proxies
        ->trustHosts(['eazzyreship.com'])
        ->trustHosts(['www.eazzyreship.com']); // Define los hosts confiables
    })
    ->withExceptions(function (Exceptions $exceptions) {
        //
    })->create();
