<!-- Hero Section -->
<section id="hero" class="hero section dark-background">

    <img src="{{ asset('web/img/bg-hero2.jpg') }}" alt="" data-aos="fade-in">

    <div class="container d-flex flex-column align-items-center">
        <h2 data-aos="fade-up" data-aos-delay="100">PLAN. LAUNCH. GROW.</h2>
        <p data-aos="fade-up" data-aos-delay="200">We are team of talented designers making websites with
            Bootstrap</p>
        <div class="d-flex mt-4" data-aos="fade-up" data-aos-delay="300">
            <a href="#contact" class="btn-get-started">Get Started</a>
            <a href="#"
                class="glightbox btn-watch-video d-flex align-items-center"><i
                    class="bi bi-play-circle"></i><span>Watch Video</span></a>
        </div>
    </div>

</section><!-- /Hero Section -->

<!-- Team Section -->
<section id="team" class="team section light-background">

    <!-- Section Title -->
    <div class="container section-title" data-aos="fade-up">
        <h2>Team</h2>
        <p>CHECK OUR TEAM</p>
    </div><!-- End Section Title -->

    <div class="container">

        <div class="row gy-5">

            <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="100">
                <div class="member">
                    <div class="pic"><img src="assets/img/team/team-1.jpg" class="img-fluid" alt="">
                    </div>
                    <div class="member-info">
                        <h4>Walter White</h4>
                        <span>Chief Executive Officer</span>
                        <div class="social">
                            <a href=""><i class="bi bi-twitter-x"></i></a>
                            <a href=""><i class="bi bi-facebook"></i></a>
                            <a href=""><i class="bi bi-instagram"></i></a>
                            <a href=""><i class="bi bi-linkedin"></i></a>
                        </div>
                    </div>
                </div>
            </div><!-- End Team Member -->

            <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
                <div class="member">
                    <div class="pic"><img src="assets/img/team/team-2.jpg" class="img-fluid" alt="">
                    </div>
                    <div class="member-info">
                        <h4>Sarah Jhonson</h4>
                        <span>Product Manager</span>
                        <div class="social">
                            <a href=""><i class="bi bi-twitter-x"></i></a>
                            <a href=""><i class="bi bi-facebook"></i></a>
                            <a href=""><i class="bi bi-instagram"></i></a>
                            <a href=""><i class="bi bi-linkedin"></i></a>
                        </div>
                    </div>
                </div>
            </div><!-- End Team Member -->

            <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
                <div class="member">
                    <div class="pic"><img src="assets/img/team/team-3.jpg" class="img-fluid" alt="">
                    </div>
                    <div class="member-info">
                        <h4>William Anderson</h4>
                        <span>CTO</span>
                        <div class="social">
                            <a href=""><i class="bi bi-twitter-x"></i></a>
                            <a href=""><i class="bi bi-facebook"></i></a>
                            <a href=""><i class="bi bi-instagram"></i></a>
                            <a href=""><i class="bi bi-linkedin"></i></a>
                        </div>
                    </div>
                </div>
            </div><!-- End Team Member -->

        </div>

    </div>

</section><!-- /Team Section -->

<!-- Contact Section -->
<section id="contact" class="contact section">

    <!-- Section Title -->
    <div class="container section-title" data-aos="fade-up">
        <h2>Contact</h2>
        <p>Necessitatibus eius consequatur</p>
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
                            <input type="text" name="name" class="form-control"
                                placeholder="Your Name" required="">
                        </div>

                        <div class="col-md-6 ">
                            <input type="email" class="form-control" name="email"
                                placeholder="Your Email" required="">
                        </div>

                        <div class="col-md-12">
                            <input type="text" class="form-control" name="subject" placeholder="Subject"
                                required="">
                        </div>

                        <div class="col-md-12">
                            <textarea class="form-control" name="message" rows="4" placeholder="Message" required=""></textarea>
                        </div>

                        <div class="col-md-12 text-center">
                            <div class="loading">Loading</div>
                            <div class="error-message1"></div>
                            <div class="sent-message" id="formMessage">Your message has been sent. Thank you!</div>

                            <button type="submit">Send Message</button>
                        </div>

                    </div>
                </form>
            </div><!-- End Contact Form -->
        </div>

    </div>
</section><!-- /Contact Section -->