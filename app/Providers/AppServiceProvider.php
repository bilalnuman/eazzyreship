<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Schema; // 👈 Add this line

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        // 👇 Add this line to fix MySQL key length error
        Schema::defaultStringLength(191);

        if (env('FORCE_HTTPS', false)) {
            URL::forceScheme('https');
            $host = request()->getHost();
            if (!str_starts_with($host, 'www.')) {
                $redirectUrl = 'https://www.' . $host . request()->getRequestUri();
                header('Location: ' . $redirectUrl, true, 301);
                exit();
            }
        }
    }
}
