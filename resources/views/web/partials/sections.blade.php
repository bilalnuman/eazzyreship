
<!-- Hero Start -->
<div class="container-fluid py-5 hero-header position-relative overflow-hidden" style="background: linear-gradient(135deg, #011864, #626e04); box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);">
    <div class="container-fluid py-5 position-relative px-5" style="z-index: 2;">
        <div class="row align-items-center pt-5">
            <div class="col-md-12 col-lg-5 text-white">
                <div id="hero-content" class="content-container">
                    <h4 class="mb-4 fw-bold" style="font-size: 2rem; text-shadow: 2px 2px 5px rgba(0,0,0,0.2);">Buy online from any US store We'll <span style="color: #ffcc00;">EazzyReship</span> it to you</h4>
                    <p class="mb-4 fs-6" style="text-shadow: 1px 1px 5px rgba(0,0,0,0.2);">Buy Products Worldwide, Ship them to <strong>EazzyReship</strong> address <br> and We'll Ship Them to You.</p>
                    <a href="#" class="btn btn-lg btn-warning px-4 py-2 rounded-pill text-dark fw-bold shadow-lg" style="border: 2px solid white;">Get Started</a>
                </div>
            </div>
            <div class="col-md-12 col-lg-7">
                <div id="carouselId" class="carousel slide position-relative rounded shadow-lg" data-bs-ride="carousel" style="border-radius: 20px; overflow: hidden;">
                    <div class="carousel-inner" role="listbox">
                        <div class="carousel-item active rounded" data-title="International Package Forwarding Service" data-desc="Getting started is easy! Simply sign up, get your US-based address and start shopping. Don't know where to buy">
                            <img src="{{ asset('web/img/bg-hero10.jpg') }}" class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide" style="object-fit: cover;">
                        </div>
                        <div class="carousel-item rounded" data-title="We offer fast, reliable and efficient package." data-desc="Buy Products Worldwide, Ship them to EazzyReship address and We'll Ship Them to You.">
                            <img src="{{ asset('web/img/bg-hero11.jpg') }}" class="img-fluid w-100 h-100 rounded" alt="Second slide" style="object-fit: cover;">
                        </div>
                        {{-- <div class="carousel-item rounded" data-title="Shop in any Online Store and ship it to your new EazzyReship U.S. Address" data-desc="Use your example U.S. address as your delivery address at checkout.">
                            <img src="{{ asset('web/img/bg-hero8.jpg') }}" class="img-fluid w-100 h-100 rounded" alt="Third slide" style="object-fit: cover;">
                        </div> --}}
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon p-3 rounded-circle" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                        <span class="carousel-control-next-icon p-3 rounded-circle" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="position-absolute top-0 start-0 w-100 h-100" style="background: url('{{ asset('web/img/hero-bg-pattern.png') }}') no-repeat center center / cover; opacity: 0.2;"></div>
</div>
<!-- Hero End -->


<!-- Steps Section -->
<section id="steps" class="team section py-5 bg-white">

    <!-- Section Title -->
    <div class="container section-title" data-aos="fade-up">
        <h2 class="fw-bold display-5 text-gradient">Steps</h2>
        <div class="subtitle"><span>SIMPLE STEPS</span></div>
    </div><!-- End Section Title -->

    <!-- Step-by-Step Instructions -->
    <div class="container py-5" data-aos="fade-up" data-aos-delay="100">
        <div class="row text-center g-4">
            <div class="col-md-4">
                <div class="step-card p-4 shadow-lg rounded-3d">
                    <img src="{{ asset('web/img/team/step1.svg') }}" alt="Step 1" class="mb-3 step-icon">
                    <h5 class="fw-bold">1. Sign up and get your EazzyReship U.S. Address</h5>
                    <p>This will be your own personal address in the USA. No signup or setup fees.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="step-card p-4 shadow-lg rounded-3d">
                    <img src="{{ asset('web/img/team/step2.svg') }}" alt="Step 2" class="mb-3 step-icon">
                    <h5 class="fw-bold">2. Shop in any Online Store and ship it to your new EazzyReship U.S. Address</h5>
                    <p>Use your EazzyReship U.S. address as your delivery address at checkout.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="step-card p-4 shadow-lg rounded-3d">
                    <img src="{{ asset('web/img/team/step3.svg') }}" alt="Step 3" class="mb-3 step-icon">
                    <h5 class="fw-bold">3. Combine your packages and save money</h5>
                    <p>Shop on multiple websites, combine the packages into one box and save up to 80% on shipping.</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- /Team Section -->

    <!-- Pricing Section -->
    <section id="pricing" class="pricing section">

        <!-- Section Title -->
        <div class="container section-title" data-aos="fade-up">
          <h2>Our Rates</h2>
          <div><span>Check Our</span> <span class="description-title">Rates</span></div>
        </div><!-- End Section Title -->
  
        <div class="container">
  
          <div class="row gy-4">
  
            <div class="col-lg-4" data-aos="zoom-in" data-aos-delay="100">
              <div class="pricing-item">
                <h3>Ocean Shipping (SXM)</h3>
                <!--h4><sup>$</sup>0<span> / month</span></h4-->
                <ul>
                  <li><i class="bi bi-check"></i> <span>1 - 4 lb  -- $4.00</span></li>
                  <li><i class="bi bi-check"></i> <span>4.1 - 8 lb --                       $8.00</span></li>
                  <li><i class="bi bi-check"></i> <span>8.1 - 12 lb --                    $12.00</span></li>
                  <li><i class="bi bi-check"></i> <span>12.1 - 50 (Each lb)  --          $0.50</span></li>
                  <li><i class="bi bi-check"></i> <span>50.1 lb & above each lb --  $0.39</span></li>
                </ul>
                <a href="#" class="buy-btn">Learn More</a>
              </div>
            </div><!-- End Pricing Item -->
  
            <div class="col-lg-4" data-aos="zoom-in" data-aos-delay="200">
              <div class="pricing-item">
                <h3>Ocean Shipping (other islands)</h3>
                <!--h4><sup>$</sup>29<span> / month</span></h4-->
                <ul>
                    <li><i class="bi bi-check"></i> <span>1 - 4 lb  -- $5.00</span></li>
                    <li><i class="bi bi-check"></i> <span>4.1 - 8 lb --                       $9.00</span></li>
                    <li><i class="bi bi-check"></i> <span>8.1 - 12 lb --                    $13.00</span></li>
                    <li><i class="bi bi-check"></i> <span>12.1 - 50 (Each lb)  --          $0.55</span></li>
                    <li><i class="bi bi-check"></i> <span>50.1 lb & above each lb --  $0.44</span></li>
                </ul>
                <p><h7>Shipping conditions:
                    Ocean shipping charges are calculated based on Volumetric Weight.</h7></p>
                <a href="#" class="buy-btn">Learn More</a>
              </div>
            </div><!-- End Pricing Item -->
  
            <div class="col-lg-4" data-aos="zoom-in" data-aos-delay="300">
              <div class="pricing-item">
                <h3>Air Shipping (SXM)</h3>
                <!--h4><sup>$</sup>49<span> / month</span></h4-->
                <ul>
                    <li><i class="bi bi-check"></i> <span>1 lb & above (Each lb)  --          $5.00</span></li>
                </ul>
                <h3>Air Shipping (other islands)</h3>
                <ul>
                    <li><i class="bi bi-check"></i> <span>1 lb & above (Each lb) --          $6.00</span></li>
                </ul>
                <p><h7>Shipping conditions:
                    Air shipping charges are calculated based on real or volumetric weight, whichever is higher</h7></p>
                <a href="#" class="buy-btn">Learn More</a>
              </div>
            </div><!-- End Pricing Item -->
  
          </div>
        </div>

        <div class="container" style="padding-top: 30px">
          <div class="row gy-4">
  
            <div class="col-lg-4" data-aos="zoom-in" data-aos-delay="100">
              <div class="pricing-item">
                <h3>Insurance</h3>
                <!--h4><sup>$</sup>0<span> / month</span></h4-->
                <ul>
                  <li><i class=""></i> <span>All packages received are automatically insured, free of charge, for a value of up to $50.00. Customers can buy additional insurance at a rate of 1.25% of the package’s invoice value. package coverage is subject to evaluation based on the facts collected in each case.</span></li>
                </ul>
                <a href="#" class="buy-btn">Learn More</a>
              </div>
            </div><!-- End Pricing Item -->
  
            <div class="col-lg-4" data-aos="zoom-in" data-aos-delay="200">
              <div class="pricing-item">
                <h3>Local Delivery</h3>
                <!--h4><sup>$</sup>29<span> / month</span></h4-->
                <ul>
                    <li><i class=""></i> <span>Doorstep deliveries can be arranged by coordinating with the local office in destination city.</span></li>
                </ul>
                <a href="#" class="buy-btn">Learn More</a>
              </div>
            </div><!-- End Pricing Item -->
  
            <div class="col-lg-4" data-aos="zoom-in" data-aos-delay="300">
              <div class="pricing-item">
                <h3>Customs clearance</h3>
                <!--h4><sup>$</sup>49<span> / month</span></h4-->
                <ul>
                    <li><i class=""></i> <span>Currently we do not provide Customs clearance service, we deliver your packages to the destination port customers have to clear their packages themselves</span></li>
                </ul>
                <a href="#" class="buy-btn">Learn More</a>
              </div>
            </div><!-- End Pricing Item -->
  
          </div>
  
        </div>
  
      </section><!-- /Pricing Section -->

<!-- Contact Section -->
<section id="contact" class="contact section">

    <!-- Section Title -->
    <div class="container section-title" data-aos="fade-up">
        <h2>Contact</h2>
        <div><span>NEED HELP? CONTACT US</span></div>
    </div><!-- End Section Title -->

    <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="row gy-4">
            <div class="col-lg-6 ">
                <div class="row gy-4">

                    <div class="col-lg-12">
                        <div class="info-item d-flex flex-column justify-content-center align-items-center"
                            data-aos="fade-up" data-aos-delay="200">
                            <i class="bi bi-geo-alt"></i>
                            <h3>Address</h3>
                            <p>8069 NW 67th Street, Miami FL 33166</p>
                        </div>
                    </div><!-- End Info Item -->

                    <div class="col-md-6">
                        <div class="info-item d-flex flex-column justify-content-center align-items-center"
                            data-aos="fade-up" data-aos-delay="300">
                            <div class="d-flex flex-row justify-content-center align-items-center">
                                <a href="tel:+17868246549" aria-label="Llamar por teléfono">
                                    <i class="bi bi-telephone"></i>
                                </a>
                                <a href="https://wa.me/17868246549" target="_blank" rel="noopener noreferrer">
                                    <i class="bi bi-whatsapp ms-2"></i>
                                </a>
                            </div>
                            <h3>Call Us</h3>
                            <p>+1 (786) 824-6549</p>
                        </div>
                    </div><!-- End Info Item -->

                    <div class="col-md-6">
                        <div class="info-item d-flex flex-column justify-content-center align-items-center"
                            data-aos="fade-up" data-aos-delay="400">
                            <i class="bi bi-envelope"></i>
                            <h3>Email Us</h3>
                            <p>info@eazzyreship.com</p>
                        </div>
                    </div><!-- End Info Item -->

                </div>
            </div>

            <div class="col-lg-6">
                <form class="php-email-form" data-aos="fade-up" data-aos-delay="500" id="contactForm">
                    @csrf
                    <div class="row gy-4">

                        <div class="col-md-6">
                            <input type="text" name="name" class="form-control" placeholder="Your Name"
                                required="">
                        </div>

                        <div class="col-md-6 ">
                            <input type="email" class="form-control" name="email" placeholder="Your Email"
                                required="">
                        </div>

                        <div class="col-md-12">
                            <input type="text" class="form-control" name="subject" placeholder="Subject"
                                required="">
                        </div>

                        <div class="col-md-12">
                            <textarea class="form-control" name="message" rows="4" placeholder="Message" required=""></textarea>
                        </div>

                        <div class="col-md-12 text-center">
                            <div id="formMessage"></div><br />
                            <!--div class="loading">Loading</div>
                            <div class="error-message"></div>
                            <div class="sent-message" id="formMessage">Your message has been sent. Thank you!</div-->
                            <button type="submit">Send Message</button>

                        </div>

                    </div>
                </form>
            </div><!-- End Contact Form -->
        </div>

    </div>
</section><!-- /Contact Section -->


<style>
    .step-card {
        transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        border-top: 2px solid #ffcc00;
    }
    .step-card:hover {
        transform: translateY(-10px);
        box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.15);
    }
</style>