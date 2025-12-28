<section id="team" class="team section">
    <div class="container py-5 mt-5">
        <h1 class="text-center mb-5 py-3 s-title" data-aos="fade-down" data-aos-delay="100">EazzyReship Services</h1>
        <div class="row justify-content-center" data-aos="fade-up" data-aos-delay="100">
            <div class="col-md-4 col-lg-3 mb-5">
                <div class="service-card">
                    <img src="{{asset('web/img/services/s1.png')}}" alt="Tax Free US Address">
                    <h5 class="service-title">Tax Free US Address</h5>
                    <p>EazzyReship provides a tax-free US address, so you can save on US sales tax on each online purchase.</p>
                </div>
            </div>
            <div class="col-md-4 col-lg-3 mb-5">
                <div class="service-card" >
                    <img src="{{asset('web/img/services/s2.jpg')}}" alt="Package Merge">
                    <h5 class="service-title">Package Merge</h5>
                    <p>We consolidate your packages from different sellers to save more on your shipping cost.</p>
                </div>
            </div>
            <div class="col-md-4 col-lg-3 mb-5">
                <div class="service-card">
                    <img src="{{asset('web/img/services/s3.jpg')}}" alt="Package Inspection">
                    <h5 class="service-title">Package Inspection</h5>
                    <p>On your request, we will open your packages and inspect for any possible damages.</p>
                </div>
            </div>
            <div class="col-md-4 col-lg-3 mb-5">
                <div class="service-card">
                    <img src="{{asset('web/img/services/s44.jpg')}}" alt="Package Return">
                    <h5 class="service-title">Package Return</h5>
                    <p>In case your package is reported damaged, on your request we will return your package to the shipper.</p>
                </div>
            </div>
            <div class="col-md-4 col-lg-3 mb-5">
                <div class="service-card">
                    <img src="{{asset('web/img/services/s55.jpg')}}" alt="Buy For Me">
                    <h5 class="service-title">Buy For Me</h5>
                    <p>We buy products for you and deliver to your door. No worries about high shipping fees or customs charges.</p>
                </div>
            </div>
            <div class="col-md-4 col-lg-3 mb-5">
                <div class="service-card">
                    <img src="{{asset('web/img/services/s6.jpg')}}" alt="Buy For Me">
                    <h5 class="service-title">Label Request</h5>
                    <p>We buy products for you and deliver to your door. No worries about high shipping fees or customs charges.</p>
                </div>
            </div>
            <div class="col-md-4 col-lg-3 mb-5">
                <div class="service-card">
                    <img src="{{asset('web/img/services/s7.jpg')}}" alt="Buy For Me">
                    <h5 class="service-title">Direct To door</h5>
                    <p>We buy products for you and deliver to your door. No worries about high shipping fees or customs charges.</p>
                </div>
            </div>
            <div class="col-md-4 col-lg-3 mb-5">
                <div class="service-card">
                    <img src="{{asset('web/img/services/s88.jpg')}}" alt="Buy For Me">
                    <h5 class="service-title">Local Pickup</h5>
                    <p>We buy products for you and deliver to your door. No worries about high shipping fees or customs charges.</p>
                </div>
            </div>

            <div class="text-center mt-4">
                <button id="load-more" class="load-more-btn">Load More</button>
            </div>
        </div>

        <div class="note-section mt-5" data-aos="fade-up" data-aos-delay="100">
            <h5>Please Note:</h5>
            <ol>
                <li>Buy for me, Label Request & Direct To door these 3 services are pre-paid services and have to be paid by Paypal/credit card or in cash to our Branch office in your city/country.</li>
                <li>Package inspection, Package return, Package Repacking & Package Pictures — these 4 services are post-paid services and there will be fixed charges between $5 - $10 for each package.</li>
                <li>Local Pick-up is a paid service and the charges are calculated based on distance & the pick-up type, weight & dimensions.</li>
            </ol>
        </div>
    </div>
</section>

<style>

.load-more-btn {
        background: #007bff;
        color: #fff;
        border: none;
        padding: 12px 30px;
        font-size: 18px;
        border-radius: 50px;
        box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.2);
        transition: all 0.2s;
        cursor: pointer;
    }
    .load-more-btn:hover {
        background: #0056b3;
        transform: scale(1.05);
    }
    
    .service-card {
        text-align: center;
        padding: 25px;
        border: none;
        border-radius: 20px;
        background: linear-gradient(145deg, #f0f0f0, #ffffff);
        box-shadow: 10px 10px 20px rgba(0, 0, 0, 0.1), -7px -7px 10px #ffffff;
        transition: all 0.3s ease;
        height: 100%;
        position: relative;
        overflow: hidden;
        cursor: pointer;
    }
    .service-card::before {
        content: "";
        position: absolute;
        top: -50%;
        left: -50%;
        width: 200%;
        height: 200%;
        background: rgba(255, 255, 255, 0.05);
        transform: rotate(45deg);
        transition: all 0.5s;
    }
    .service-card:hover::before {
        top: 50%;
        left: 50%;
    }
    .service-card:hover {
        transform: translateY(-10px);
        box-shadow: 15px 15px 30px rgba(0, 0, 0, 0.1), -15px -15px 30px #ffffff;
    }
    .service-card img {
        max-width: 90px;
        margin-bottom: 20px;
        transition: transform 0.3s ease;
    }
    .service-card:hover img {
        transform: scale(1.1) rotate(5deg);
    }
    .service-title {
        font-weight: bold;
        color: #007bff;
        margin-bottom: 15px;
        font-size: 1.2rem;
        text-transform: uppercase;
        letter-spacing: 1px;
        text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
    }
    .s-title {
        font-weight: 700;
        color: #007bff;
        margin-bottom: 15px;
        font-size: 2rem;
    }
    p {
        color: #555;
        font-size: 0.95rem;
        line-height: 1.6;
    }
    .note-section {
        background: linear-gradient(145deg, #ffffff, #e6e6e6);
        border-left: 6px solid #007bff;
        padding: 20px 30px;
        border-radius: 10px;
        box-shadow: 6px 6px 12px #d1d9e6, -6px -6px 12px #ffffff;
        margin: 40px auto;
        transition: transform 0.3s, box-shadow 0.3s;
    }
    .note-section:hover {
        transform: translateY(-5px);
        box-shadow: 8px 8px 16px #d1d9e6, -8px -8px 16px #ffffff;
    }
    .note-section h5 {
        color: #007bff;
        font-weight: bold;
        text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
    }
    .note-section ol {
        margin: 0;
        padding-left: 20px;
    }
    .note-section ol li {
        margin-bottom: 10px;
        line-height: 1.6;
    }
</style>
