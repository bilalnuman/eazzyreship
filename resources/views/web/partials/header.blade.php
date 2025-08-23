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
                    <li><a href="{{ url('/') }}" class="{{ request()->is('/') ? 'active' : '' }}">Home</a></li>
                    <li><a href="{{ url('/tracking') }}" class="{{ request()->is('tracking') ? 'active' : '' }}">Tracking</a></li>
                    <li><a href="{{ url('/terms') }}" class="{{ request()->is('terms') ? 'active' : '' }}">Terms and conditions</a></li>
                    @auth
                        <li><a href="{{ url('/dashboard') }}" class="{{ request()->is('dashboard') ? 'active' : '' }}">Dashboard</a></li>
                    @else
                        @if (Route::has('register'))
                            <li><a href="{{ route('register') }}" class="{{ request()->is('register') ? 'active' : '' }}">Register</a></li>
                        @endif
                    @endauth
                    <li class="dropdown"><a href="#"><span>More</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
                        <ul>
                            <li><a href="/buy-for-me">Buy For Me</a></li>
                            <li><a href="#pricing">Rates</a></li>
                            <li><a href="/services">Services</a></li>
                            <li><a href="#how_it_works">How It Works</a></li>
                            <li><a href="#locations">Locations</a></li>
                            <li><a href="/calculator">Calculator</a></li>
                            <li><a href="/notification">Pre-Notifications</a></li>
                            <li><a href="/where-to-buy">Where To Shop</a></li>
                            <li><a href="#contact">Contact Us</a></li>
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
                <a class="btn-getstarted" href="{{ route('login') }}"> Log in</a>
            @endauth
        @endif
    </div>
</header>