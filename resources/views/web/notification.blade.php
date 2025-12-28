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
    <link href="{{ asset('web/css/main2.css') }}" rel="stylesheet">

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

<body class="index-page">

    @include('web.partials.header')

    <main class="main">
        @include('web.partials.notification-section');
    </main>
    
    <footer id="footer" class="footer py-5 text-white position-relative overflow-hidden">
        <div class="container footer-top">
            <div class="row text-center justify-content-center">
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="advantage-item p-4 shadow-3d rounded-3d text-center">
                        <div class="advantage-image mb-3">
                            <img src="{{asset('web/img/pricing.svg') }}" alt="Pricing" width="80" />
                        </div>
                        <h5 class="advantage-service">Competitive Pricing</h5>
                        <p class="advantage-description">We offer the best competitive prices to save you on shipping rates.</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="advantage-item p-4 shadow-3d rounded-3d text-center">
                        <div class="advantage-image mb-3">
                            <img src="{{asset('web/img/delivery.svg')}}" alt="Delivery" width="80" />
                        </div>
                        <h5 class="advantage-service">International Delivery</h5>
                        <p class="advantage-description">We offer one of the best shipping solutions for international shipping.</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="advantage-item p-4 shadow-3d rounded-3d text-center">
                        <div class="advantage-image mb-3">
                            <img src="{{asset('web/img/payment.svg')}}" alt="Payment" width="80" />
                        </div>
                        <h5 class="advantage-service">Secure Payment Methods</h5>
                        <p class="advantage-description">Pay with peace of mind with our Safe Pay systems.</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="advantage-item p-4 shadow-3d rounded-3d text-center">
                        <div class="advantage-image mb-3">
                            <img src="{{asset('web/img/safety.svg')}}" alt="Safety" width="80" />
                        </div>
                        <h5 class="advantage-service">Shop Safely</h5>
                        <p class="advantage-description">Shop with us knowing that we are protecting your account around the clock.</p>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="container text-center mt-4">
            <p class="mb-2">© <span>Copyright</span> <strong class="px-1 sitename">EazzyReship</strong> <span>All Rights Reserved</span></p>
            <div class="credits">
                Designed by <a href="#" class="text-decoration-none">Emptech N.V.</a>
            </div>
        </div>
    </footer>
    
    <style>
        .footer {
            background: linear-gradient(135deg, #121212, #1f1f1f);
            box-shadow: 0 0 30px rgba(255, 255, 255, 0.1);
            padding-bottom: 60px;
            position: relative;
            overflow: hidden;
        }
        .advantage-item {
            background: rgba(255, 255, 255, 0.15);
            border-radius: 25px;
            transition: all 0.4s ease-in-out;
            position: relative;
            overflow: hidden;
            transform: perspective(1000px) rotateX(0deg) rotateY(0deg);
        }
        .advantage-image img {
            border: 2px solid #ffa600c2;
            border-radius: 50%;
        }
        .advantage-service {
            color: #FFA500;
        }
        .advantage-item:hover {
            transform: perspective(1000px) rotateX(5deg) rotateY(-5deg) scale(1.05);
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 15px 30px rgba(255, 255, 255, 0.3);
        }
        .shadow-3d {
            box-shadow: inset 5px 5px 15px rgba(0, 0, 0, 0.4), inset -5px -5px 15px rgba(255, 255, 255, 0.1), 5px 5px 20px rgba(0, 0, 0, 0.3);
        }
        .rounded-3d {
            border-radius: 30px;
        }
        .credits a {
            color: #EC57D6;
            font-weight: bold;
            transition: color 0.3s ease;
        }
        .credits a:hover {
            color: #E6A81B;
        }
    </style>

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
    <script src="{{ asset('web/js/main2.js') }}"></script>
</body>

</html>
