<!-- Hero Section -->
<section id="hero" class="hero section dark-background">

    <div id="hero-carousel" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="5000">

        <div class="carousel-item active">
            <img src="{{ asset('web/img/bg-hero4.jpg') }}" alt="">
            <div class="carousel-container">
                <h2>Welcome to Multi<br></h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
                    et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                    aliquip ex ea commodo consequat.</p>
                <a href="#featured-services" class="btn-get-started">Get Started</a>
            </div>
        </div><!-- End Carousel Item -->

        <div class="carousel-item">
            <img src="{{ asset('web/img/bg-hero5.jpg') }}" alt="">
            <div class="carousel-container">
                <h2>At vero eos et accusamus</h2>
                <p>Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime
                    placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem
                    quibusdam et aut officiis debitis aut.</p>
                <a href="#featured-services" class="btn-get-started">Get Started</a>
            </div>
        </div><!-- End Carousel Item -->

        <div class="carousel-item">
            <img src="{{ asset('web/img/bg-hero3.jpg') }}" alt="">
            <div class="carousel-container">
                <h2>Temporibus autem quibusdam</h2>
                <p>Beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit
                    aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt omnis iste
                    natus error sit voluptatem accusantium.</p>
                <a href="#featured-services" class="btn-get-started">Get Started</a>
            </div>
        </div><!-- End Carousel Item -->

        <a class="carousel-control-prev" href="#hero-carousel" role="button" data-bs-slide="prev">
            <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
        </a>

        <a class="carousel-control-next" href="#hero-carousel" role="button" data-bs-slide="next">
            <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
        </a>

        <ol class="carousel-indicators"></ol>

    </div>
    <!-- Sección Informativa en 3 Columnas Centradas con Estilos Mejorados -->
    <div class="text-white py-5 text-center custom-info-section">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-md-4 mb-2">
                    <h3 class="fw-bold">Start Saving Today!</h3>
                </div>
                <div class="col-md-4 mb-2">
                    <h3>Get your free U.S. address!</h3>
                </div>
                <div class="col-md-4">
                    <a href="#" class="btn btn-info btn-lg custom-btn">Sign Up Free</a>
                </div>
            </div>
        </div>
    </div>

</section><!-- /Hero Section -->


<!-- Team Section -->
<section id="team" class="team section">

    <!-- Section Title -->
    <div class="container section-title" data-aos="fade-up">
        <h2>Steps</h2>
        <p>THREE SIMPLE STEPS</p>
    </div><!-- End Section Title -->

<!-- Instrucciones Paso a Paso -->
<div class="container py-5" data-aos="fade-up" data-aos-delay="100">
    <div class="row text-center">
        <div class="col-md-4">
            <img src="{{ asset('web/img/team/step1.svg') }}" alt="Step 1" class="mb-3">
            <h5>1. Sign up and get your EazzyReship U.S. Address</h5>
            <p><br/>This will be your own personal address in the USA. No signup or setup fees.</p>
        </div>
        <div class="col-md-4">
            <img src="{{ asset('web/img/team/step2.svg') }}" alt="Step 2" class="mb-3">
            <h5>2. Shop in any Online Store and ship it to your new EazzyReship U.S. Address</h5>
            <p><br/>Use your example U.S. address as your delivery address at checkout.</p>
        </div>
        <div class="col-md-4">
            <img src="{{ asset('web/img/team/step3.svg') }}" alt="Step 3" class="mb-3">
            <h5>3. Combine your packages and save money</h5>
            <p><br/>Shop on multiple websites, combine the packages into one box and save up to 80% on shipping.</p>
        </div>
    </div>
</div>

</section><!-- /Team Section -->

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
                <a href="#" class="buy-btn">Buy Now</a>
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
                <a href="#" class="buy-btn">Buy Now</a>
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
        <p>NEED HELP? CONTACT US</p>
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
