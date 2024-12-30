<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>EazzyReship</title>
    <meta name="description" content="">
    <meta name="keywords" content="">

    <!-- Favicons -->
    <!--link href="" rel="icon"-->
    <link href="{{ asset('web/img/apple-touch-icon.png') }}" rel="apple-touch-icon">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap"
        rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="{{ asset('web/vendor/bootstrap/css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('web/vendor/bootstrap-icons/bootstrap-icons.css') }}" rel="stylesheet">
    <link href="{{ asset('web/vendor/aos/aos.css') }}" rel="stylesheet">
    <link href="{{ asset('web/vendor/glightbox/css/glightbox.min.css') }}" rel="stylesheet">
    <link href="{{ asset('web/vendor/swiper/swiper-bundle.min.css') }}" rel="stylesheet">

    <!-- Main CSS File -->
    <link href="{{ asset('web/css/main.css') }}" rel="stylesheet">

    <style>
        .footer-advantages {
            background-color: #212529;
            /* Oscuro pero no negro */
            color: #f8f9fa;
            /* Blanco suave */
            font-family: 'Arial', sans-serif;
        }

        .footer-advantages .advantage-item {
            padding: 15px;
            border-radius: 8px;
            background-color: #2c2f33;
            /* Contraste sutil */
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .footer-advantages .advantage-item:hover {
            transform: translateY(-10px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
        }

        .footer-advantages .advantage-image img {
            max-width: 80px;
            height: auto;
        }

        .footer-advantages .advantage-service {
            font-size: 1.1rem;
            font-weight: 600;
            margin: 10px 0;
            color: #ffc107;
            /* Color acento */
        }

        .footer-advantages .advantage-description {
            font-size: 0.9rem;
            line-height: 1.6;
        }
    </style>
</head>

<body class="index-page" style="background-color:#212529">

    <header id="header" class="header d-flex align-items-center fixed-top">
        <div class="container-fluid container-xl position-relative d-flex align-items-center">

            <a href="index.html" class="logo d-flex align-items-center me-auto">
                <!-- Uncomment the line below if you also wish to use an image logo -->
                <!-- <img src="assets/img/logo.png" alt=""> -->
                <h1 class="sitename">EazzyReship</h1>
            </a>
            @if (Route::has('login'))
                <nav id="navmenu" class="navmenu">
                    <ul>
                        <li><a href="{{ url('/') }}" class="active">Home</a></li>

                        <li><a href="/tracking">Tracking</a></li>
                        <li><a href="/terms">Terms and conditions</a></li>
                        @auth
                            <li><a href="{{ url('/dashboard') }}">Dashboard</a></li>
                        @else
                            @if (Route::has('register'))
                                <li><a href="{{ route('register') }}">Register</a></li>
                            @endif
                        @endauth
                    </ul>
                    <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                </nav>
                @auth
                    <form action="{{ route('logout') }}" method="POST" class="d-inline">
                        @csrf
                        <button type="submit" class="btn btn-default btn-flat float-right cta-btn">Sign out</button>
                    </form>
                @else
                <a class="cta-btn" href="{{route('login') }}">Log in</a>
                @endauth
            @endif
        </div>
    </header>

    <main class="main">
        @include('web.partials.sections');

    </main>
    @include('web.partials.footer');

    <!-- Scroll Top -->
    <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i
            class="bi bi-arrow-up-short"></i></a>

    <!-- Preloader -->
    <div id="preloader"></div>

    <!-- Vendor JS Files -->
    <script src="{{ asset('web/vendor/bootstrap/js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('web/vendor/php-email-form/validate.js') }}"></script>
    <script src="{{ asset('web/vendor/aos/aos.js') }}"></script>
    <script src="{{ asset('web/vendor/glightbox/js/glightbox.min.js') }}"></script>
    <script src="{{ asset('web/vendor/purecounter/purecounter_vanilla.js') }}"></script>
    <script src="{{ asset('web/vendor/swiper/swiper-bundle.min.js') }}"></script>
    <script src="{{ asset('web/vendor/imagesloaded/imagesloaded.pkgd.min.js') }}"></script>
    <script src="{{ asset('web/vendor/isotope-layout/isotope.pkgd.min.js') }}"></script>

    <!-- Main JS File -->
    <script src="{{ asset('web/js/main.js') }}"></script>
</body>

</html>
