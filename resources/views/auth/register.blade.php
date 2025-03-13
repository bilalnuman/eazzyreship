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
<div class="index-page" style="background-color:rgb(243 244 246 / var(--tw-bg-opacity, 1)); padding-top: 80px">
    <header id="header" class="header d-flex align-items-center fixed-top">
        <div class="container-fluid container-xl position-relative d-flex align-items-center">

            <a href="/" class="logo d-flex align-items-center me-auto">
                <!-- Uncomment the line below if you also wish to use an image logo -->
                <!-- <img src="assets/img/logo.png" alt=""> -->
                <h1 class="sitename">EazzyReship</h1>
            </a>

            @if (Route::has('login'))
                <nav id="navmenu" class="navmenu">
                    <ul>
                        <li><a href="{{ url('/') }}">Home</a></li>
                        <li><a href="/tracking">Tracking</a></li>
                        <li><a href="/terms">Terms and conditions</a></li>
                        @auth
                            <li><a href="{{ url('/dashboard') }}">Dashboard</a></li>
                        @else
                            @if (Route::has('register'))
                                <li><a href="{{ route('register') }}" class="active">Register</a></li>
                            @endif
                        @endauth
                        <li class="dropdown"><a href="#"><span>More</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
                            <ul>
                                <li><a href="#buy_for_me">Buy For Me</a></li>
                                <li><a href="/#pricing">Rates</a></li>
                                <li><a href="#services">Services</a></li>
                                <li><a href="#how_it_works">How It Works</a></li>
                                <li><a href="#locations">Locations</a></li>
                                <li><a href="/calculator">Calculator</a></li>
                                <li><a href="#pre_notifications">Pre-Notifications</a></li>
                                <li><a href="#where_to_shop">Where To Shop</a></li>
                                <li><a href="/#contact">Contact Us</a></li>
                                <li><a href="#faqs">FAQS</a></li>
                            </ul>
                        </li>

                        @auth
                        <form action="{{ route('logout') }}" method="POST" class="d-inline">
                            @csrf
                            <button type="submit" class="btn btn-flat btn-getstarted w-100"> Sign out</button>
                        </form>
                        @endauth

                    </ul>
                    <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                </nav>
                @auth

                @else
                    <a class="btn-getstarted" href="{{ route('login') }}" class="active"> Log in</a>
                @endauth
            @endif
        </div>
    </header>
</div>
<x-guest-layout>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
    <form id="exampleForm" method="POST" action="{{ route('register') }}">
        @csrf
        <!-- Name -->
        <div>
            <x-input-label for="name" :value="__('First Name and Last Name')" />
            <x-text-input id="name" class="block mt-1 w-full" type="text" name="name" :value="old('name')"
                required autofocus autocomplete="name" />
            <x-input-error :messages="$errors->get('name')" class="mt-2" />
        </div>

        <!-- Email Address -->
        <div class="mt-4">
            <x-input-label for="email" :value="__('Email')" />
            <x-text-input id="email" class="block mt-1 w-full" type="email" name="email" :value="old('email')"
                required autocomplete="username" oninput="this.value = this.value.toLowerCase()" />
            <x-input-error :messages="$errors->get('email')" class="mt-2" />
        </div>

        <!-- Password -->
        <div class="mt-4">
            <x-input-label for="password" :value="__('Password')" />

            <x-text-input id="password" class="block mt-1 w-full" type="password" name="password" required
                autocomplete="new-password" />

            <x-input-error :messages="$errors->get('password')" class="mt-2" />
        </div>

        <!-- Confirm Password -->
        <div class="mt-4">
            <x-input-label for="password_confirmation" :value="__('Confirm Password')" />

            <x-text-input id="password_confirmation" class="block mt-1 w-full" type="password"
                name="password_confirmation" required autocomplete="new-password" />

            <x-input-error :messages="$errors->get('password_confirmation')" class="mt-2" />
        </div>

        <!-- Phone -->
        <div class="mt-4">
            <x-input-label for="mobile" :value="__('mobile')" />
            <x-text-input id="mobile" class="block mt-1 w-full" type="text" name="mobile" :value="old('mobile')" />
            <x-input-error :messages="$errors->get('mobile')" class="mt-2" />
            <x-text-input type="hidden" id="dialCode" name="dialCode" />
        </div>

        <!-- Country -->
        <div class="mt-4">
            <x-input-label for="branch_id" :value="__('Branch')" />
            <select name="branch_id" id="branch_id"
                class="block mt-1 w-full border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 rounded-md shadow-sm"
                required>
                <option value="" disabled selected>{{ __('Select your country(pick-up only)') }}</option>
                @foreach ($branches as $branch)
                    <option value="{{ $branch->id }}"
                        {{ old('branch_id', $selectedBranchId ?? '') == $branch->id ? 'selected' : '' }}
                        branch-code="{{ $branch->country->iso2 }}">
                        {{ $branch->name }}
                    </option>
                @endforeach
            </select>
            <x-input-error :messages="$errors->get('branch_id')" class="mt-2" />
            <input type="hidden" name="branch_code" id="branch_code">
        </div>
        <br>

        <div class="mt-4">
            <label class="form-check form-check-custom form-check-solid form-check-inline">
                <input class="form-check-input" type="checkbox" name="tnc" id="tnc" value="1"
                    required />
                <span class="form-check-label fw-bold text-gray-700 fs-6">
                    {!! __('I Agree to the') !!}
                    <a href="/terms" target="_blank"
                        class="ms-1 link-primary">{{ __('Terms and Conditions') }}</a>.
                </span>
            </label>
        </div>

        <div class="flex items-center justify-end mt-4">
            <a class="underline text-sm text-gray-600 hover:text-gray-900 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                href="{{ route('login') }}">
                {{ __('Already registered?') }}
            </a>

            <x-primary-button class="ms-4" id="submitButton">
                {{ __('Register') }}
            </x-primary-button>
        </div>
    </form>
    <script>
        document.getElementById('branch_id').addEventListener('change', function() {
            var selectedOption = this.options[this.selectedIndex];
            var branchCode = selectedOption.getAttribute('branch-code');
            document.getElementById('branch_code').value = branchCode;
        });
        // Opcional: Ejecutar al cargar si hay una selección previa
        document.addEventListener('DOMContentLoaded', function() {
            const selectElement = document.getElementById('branch_id');
            if (selectElement) {
                const selectedOption = selectElement.options[selectElement.selectedIndex];
                if (selectedOption) {
                    branchCode = selectedOption.getAttribute('branch-code');
                    document.getElementById('branch_code').value = branchCode; // Asignar al campo oculto
                }
            }
        });
        //Inicializar el plugin intl-tel-input
        const input = document.querySelector("#mobile");
        const hiddenInput = document.querySelector("#dialCode");

        const iti = window.intlTelInput(input, {
            initialCountry: "sx", // Configurar manualmente el país predeterminado (ejemplo: Estados Unidos)
            onlyCountries: ["sx", "mf", "ai", "kn", "bl","bq"], // Opcional: Países preferidos en la lista
            separateDialCode: true,
            nationalMode: true,
            utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.19/js/utils.js" // Para formateo adicional
        });


        function updateFullNumber() {
            let enteredNumber = input.value.trim(); // Número ingresado por el usuario
            let fullNumber = iti.getNumber(); // Obtener número completo (con prefijo)

            // Verificar si el número ingresado ya incluye un código de país
            if (enteredNumber.startsWith("+")) {
                hiddenInput.value = enteredNumber; // Usar directamente el número ingresado
            } else {
                hiddenInput.value = fullNumber; // Usar el número completo generado por intl-tel-input
            }
        }


        input.addEventListener("countrychange", function() {
            //const dialCode = iti.getSelectedCountryData().dialCode; // Obtener el código de área
            //hiddenInput.value = dialCode; // Guardarlo en un campo oculto
            updateFullNumber();
        });

        input.addEventListener("input", function() {
            //const dialCode = iti.getSelectedCountryData().dialCode; // Código de área
            //hiddenInput.value = dialCode; // Asegurarse de que siempre esté actualizado
            updateFullNumber();
        });

    </script>
    <script>
        document.getElementById("exampleForm").addEventListener("submit", function(event) {
            const submitButton = document.getElementById("submitButton");
    
            // Deshabilitar el botón
            submitButton.disabled = true;
    
            // Cambiar el texto o estilo (opcional)
            submitButton.innerText = "Sending...";
            submitButton.style.cursor = "not-allowed";
            
            // Permitir que el formulario se envíe
        });
    </script>
    <style>
        /*para poner full ancho la caja de telefono intenacional*/
        .iti {
            width: 100%;
        }

        .iti__flag-container {
            height: 100%;
        }
    </style>
</x-guest-layout>
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
