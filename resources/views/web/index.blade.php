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
            .hero-header {
            background: linear-gradient(rgba(77, 49, 231, 0.1), rgba(235, 203, 25, 0.308)), url(../img/hero-img.jpg);
            background-position: center center;
            background-repeat: no-repeat;
            background-size: cover;
            transition: background 0.5s ease-in-out;
        }

        .carousel-item {
            position: relative;
        }
        .carousel-item  img {
            width: 100% !important; 
            height: 100% !important; 
        }

        .carousel-control-next,
        .carousel-control-prev {
            width: 48px;
            height: 48px;
            border-radius: 48px;
            border: 1px solid var(--bs-white);
            background: #001F54 !important;
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
        }
    

        .carousel-control-next {
            margin-right: 20px;
        }

        .carousel-control-prev {
            margin-left: 20px;
        }

        .content-container {
            transition: opacity 0.5s ease-in-out;
        }
        .content-container .btn-primary {
            background-color: #001F54;
            border: 2px solid #FFA500;
        }
        .content-container h4 {
            color: #FFA500;
            font-size: 1.5rem !important;
        }

        @media (min-width: 992px) {
            .hero-header {
                /* margin-top: 152px !important; */
            }
        }

        @media (max-width: 720px) {
            .hero-header {
                /* margin-top: 97px !important; */
            }
            .carousel {
                margin-top: 1rem;
            }
        }
    </style>

</head>

<body class="index-page">

    @include('web.partials.header')
  
    <main class="main">
        @include('web.partials.sections')

    </main>
    @include('web.partials.footer')

    <!-- Scroll Top -->
    <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i
            class="bi bi-arrow-up-short"></i></a>

    <!-- Preloader -->
    <div id="preloader"></div>

    <!-- Vendor JS Files -->
    <script src="{{ asset('web/vendor/bootstrap/js/bootstrap.min.js') }}"></script>
    <!--script src="{/{ asset('web/vendor/php-email-form/validate.js') }}"></script-->
    <script src="{{ asset('web/vendor/aos/aos.js') }}"></script>
    <script src="{{ asset('web/vendor/glightbox/js/glightbox.min.js') }}"></script>
    <script src="{{ asset('web/vendor/purecounter/purecounter_vanilla.js') }}"></script>
    <script src="{{ asset('web/vendor/swiper/swiper-bundle.min.js') }}"></script>
    <script src="{{ asset('web/vendor/imagesloaded/imagesloaded.pkgd.min.js') }}"></script>
    <script src="{{ asset('web/vendor/isotope-layout/isotope.pkgd.min.js') }}"></script>

    <!-- Main JS File -->
    <script src="{{ asset('web/js/main2.js') }}"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $(document).ready(function() {
            $('#contactForm').on('submit', function(e) {
                e.preventDefault(); // Evita el envío por defecto
                const formData = $(this).serialize();

                $.ajax({
                    url: '{{ route('contact.store') }}',
                    type: 'POST',
                    data: formData,
                    success: function(response) {
                        $('#formMessage').text(response.success).css('color', 'green');
                        $('#contactForm')[0].reset(); // Limpia el formulario
                    },
                    error: function(xhr) {
                        const errors = xhr.responseJSON.errors;
                        let errorMessage = 'Error: ';
                        for (const key in errors) {
                            errorMessage += errors[key] + ' ';
                        }
                        $('#formMessage').text(errorMessage).css('color', 'red');
                    }
                });
            });
        });


          // Change content dynamically when the slider changes
        $('#carouselId').on('slide.bs.carousel', function (event) {
            var nextSlide = $(event.relatedTarget);
            var newTitle = nextSlide.data('title');
            var newDesc = nextSlide.data('desc');

            $('#hero-content').css('opacity', '0'); // Fade out effect
            setTimeout(function () {
                $('#hero-content h4').text(newTitle);
                $('#hero-content p').text(newDesc);
                $('#hero-content').css('opacity', '1'); // Fade in effect
            }, 500);
        });
    </script>
</body>

</html>
