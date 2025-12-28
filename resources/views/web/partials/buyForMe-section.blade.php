<section id="team" class="team section">
    <div class="banner mt-4">
        <div class="banner-content">
            <h1>Buy For Me</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Buy for me</li>
                </ol>
            </nav>
        </div>
        <div class="banner-bg"></div>
    </div>
    <div class="container py-5">
        <div class="custom-heading">
            <span class="highlight">Buy for me</span>
            <h2>Unlimited Shopping and Shipping Experience</h2>
            <p>We buy for you, We deliver to you, We take care of all.</p>
        </div>


        <h4 class="py-3">How <a href="">Buy For Me</a> Works   <i class="fa-solid fa-arrow-left"></i></h4>

       

        <div class="custom-heading mt-4">
            <h2>We buy & ship to you</h2>
            <p>EazyReship provides convenient and reliable online shopping services. We buy products for you and deliver to your door. You don’t need to worry about paying high shipping fees.</p>
        </div>

        <div class="row justify-content-center py-5" data-aos="fade-up" data-aos-delay="100">
            <div class="col-md-4 col-lg-3 mb-5">
                <div class="service-card">
                    <img src="{{asset('web/img/services/s1.png')}}" alt="Tax Free US Address">
                    <h5 class="service-title">Find Your Item</h5>
                    <p>Find your item on any website worldwide.</p>
                </div>
            </div>
            <div class="col-md-4 col-lg-3 mb-5">
                <div class="service-card" >
                    <img src="{{asset('web/img/services/s22.png')}}" alt="Package Merge">
                    <h5 class="service-title">Copy & Paste Item Link</h5>
                    <p>Copy & Paste the Product URL link from any website you like.</p>
                </div>
            </div>
            <div class="col-md-4 col-lg-3 mb-5">
                <div class="service-card">
                    <img src="{{asset('web/img/services/s33.png')}}" alt="Package Inspection">
                    <h5 class="service-title">Submit</h5>
                    <p>Enter the quantity, size, and color of your items and submit the order.</p>
                </div>
            </div>
            <div class="col-md-4 col-lg-3 mb-5">
                <div class="service-card">
                    <img src="{{asset('web/img/services/s444.png')}}" alt="Package Return">
                    <h5 class="service-title">Order Confirmation</h5>
                    <p>EazyReship team will contact you and confirm the order details & total cost.</p>
                </div>
            </div>
            <div class="col-md-4 col-lg-3 mb-5">
                <div class="service-card">
                    <img src="{{asset('web/img/services/s555.png')}}" alt="Buy For Me">
                    <h5 class="service-title">Order Payment</h5>
                    <p>Once the order is confirmed, make the payment online or via cash.</p>
                </div>
            </div>
            <div class="col-md-4 col-lg-3 mb-5">
                <div class="service-card">
                    <img src="{{asset('web/img/services/s66.png')}}" alt="Buy For Me">
                    <h5 class="service-title">Order Processing</h5>
                    <p>After payment, we will place and process the order on your behalf.</p>
                </div>
            </div>
            <div class="col-md-4 col-lg-3 mb-5">
                <div class="service-card">
                    <img src="{{asset('web/img/services/s77.png')}}" alt="Buy For Me">
                    <h5 class="service-title">Order Shipping</h5>
                    <p>Once the order reaches our warehouse, we will contact you for shipping.</p>
                </div>
            </div>
            <div class="col-md-4 col-lg-3 mb-5">
                <div class="service-card">
                    <img src="{{asset('web/img/services/s8888.png')}}" alt="Buy For Me">
                    <h5 class="service-title">Receive Your Order</h5>
                    <p>Once shipped, you will receive the order as per your instructions.</p>
                </div>
            </div>

            
            {{-- <div class="text-center mt-4">
                <button id="load-more" class="load-more-btn">Load More</button>
            </div> --}}
        </div>

        <div class="input-container">
            <input type="text" class="styled-input" placeholder="Copy & Paste Your Product Link: https://www.amazon.com">
        </div>


        {{-- form  --}}

        <div class="order-form mt-4">
            {{-- <span class="close-btn">&times;</span> --}}
            
            <div class="amazon-logo">
                <img src="https://upload.wikimedia.org/wikipedia/commons/a/a9/Amazon_logo.svg" alt="Amazon">
                www.amazon.com
            </div>
            
            <div class="row align-items-center mt-2">
                <div class="col-md-3">
                    <div class="product-image">
                        <img id="productImg" src="{{asset('web/img/services/s77.png')}}" alt="Product Image">
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="flex-grow-1 ml-3">
                        <div class="form-group">
                            <label>Product Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" placeholder="Enter Product Name">
                        </div>
                    </div>
                </div>
            </div>
        
            <div class="form-row">
                <div class="form-group">
                    <label>Price <span class="text-danger">*</span></label>
                    <div class="d-flex align-items-center">
                        <span class="price-symbol">$</span>
                        <input type="text" class="form-control ml-2" placeholder="0.00">
                    </div>
                </div>
                <div class="form-group">
                    <label>Quantity</label>
                    <input type="number" class="form-control" value="1">
                </div>
            </div>
        
            <div class="form-group">
                <label>Product Link</label>
                <a href="https://www.amazon.com/dp/B08D..." class="d-block text-primary">https://www.amazon.com/dp/B08D...</a>
            </div>
        
            <div class="form-row">
                <div class="form-group">
                    <label>Color</label>
                    <input type="text" class="form-control">
                </div>
                <div class="form-group">
                    <label>Size</label>
                    <input type="text" class="form-control">
                </div>
                <div class="form-group">
                    <label>Special Notes</label>
                    <input type="text" class="form-control">
                </div>
            </div>
        
            <div class="form-group">
                <label>EazyReship Customer ID:</label>
                <input type="text" class="form-control">
            </div>
        
            <div class="mt-4 d-flex justify-content-center">
                <button class="submit-btn">Submit</button>
            </div>
        </div>

        <div class="payment-box">
            <h5>Payment details:</h5>
            <p>Once you get the order confirmation number from the EazyReship team, you can make the payment using the links below or pay cash at any of our branches listed in the locations section.</p>
            <p class="important-text">Please make sure you mention the order confirmation number in payment notes.</p>
            <a href="https://buy.stripe.com/3Eu3gJ6m1lRkcZ7s" target="_blank">https://buy.stripe.com/3Eu3gJ6m1lRkcZ7s</a>
            <a href="https://www.paypal.com/EazyReship/pay" target="_blank">https://www.paypal.com/EazyReship/pay</a>
        </div>
        
    </div>
</section>

<style>

    /* payment style */

    .payment-box {
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: 40px auto;
        }
        .payment-box h5 {
            font-weight: bold;
            color: #333;
        }
        .payment-box p {
            font-size: 14px;
            color: #555;
            margin-bottom: 10px;
        }
        .payment-box .important-text {
            font-weight: bold;
            color: #d9534f;
            text-transform: uppercase;
        }
        .payment-box a {
            display: block;
            font-size: 14px;
            color: #007bff;
            text-decoration: none;
            margin-bottom: 5px;
            word-break: break-all;
        }
        .payment-box a:hover {
            text-decoration: underline;
        }

    /* form style */

    
    .order-form {
            width: 100%;
            /* max-width: 700px; */
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            border: 2px solid #c9a76a;
            position: relative;
        }

        .close-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 18px;
            color: red;
            cursor: pointer;
        }

        .form-group label {
            font-weight: bold;
            font-size: 14px;
        }

        .form-control {
            border: 1px solid #c9a76a;
            border-radius: 5px;
            padding: 8px;
            font-size: 14px;
        }

        .form-control:focus {
            border-color: #b2854d;
            box-shadow: 0 0 5px rgba(185, 133, 77, 0.5);
        }

        .submit-btn {
            background-color: #FFA500;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            transition: 0.3s ease;
            
        }

        .submit-btn:hover {
            background-color: #d8641c;
        }

        .price-symbol {
            font-size: 18px;
            font-weight: bold;
            color: #c96a2b;
        }

        .amazon-logo {
            display: flex;
            align-items: center;
            font-size: 14px;
            color: #0073b1;
            font-weight: bold;
        }

        .amazon-logo img {
            width: 50px;
            height: auto;
            margin-right: 10px;
        }
        .product-image img {
            width: 70px;
            height: 70px;
            object-fit: cover;
            border-radius: 5px;
        }

        .product-image {
            width: 80px;
            height: 80px;
            border: 1px solid #ccc;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f8f9fa;
            font-size: 12px;
            color: #999;
        }

        .form-row {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .form-row .form-group {
            flex: 1;
            min-width: 120px;
        }

        /* Responsive */
        @media (max-width: 576px) {
            .form-row {
                flex-direction: column;
            }

            .product-image {
                width: 100%;
                height: 100px;
            }
        }
        @media (max-width: 768px) { 

.banner-bg {
    display: none
}
        }
    /* input field design */
    
    .input-container {
            width: 100%;
            position: relative;
        }

        .styled-input {
            width: 100%;
            padding: 12px 20px;
            font-size: 1rem;
            color: #7a7a7a;
            border: 2px solid #b2854d;
            border-radius: 8px;
            background: #ffffff;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .styled-input:focus {
            border-color: #b2854d;
            box-shadow: 0 0 8px rgba(185, 133, 77, 0.6);
            outline: none;
        }

        .styled-input::placeholder {
            color: #a8a8a8;
            font-size: 1rem;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .styled-input {
                font-size: 0.9rem;
                padding: 12px 15px;
            }
        }

    /* banner style */

    

    .banner {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 80px;
        background: #DFE0E5;
        position: relative;
        /* border-radius: 15px; */
        overflow: hidden;
    }
    .banner-content {
        max-width: 50%;
        z-index: 1;
    }
    .banner-content h1 {
        font-size: 3rem;
        font-weight: bold;
        color: #051242;
    }
    .banner-content p {
        color: #555;
    }
    .breadcrumb {
        background: transparent;
        padding: 0;
    }
    .breadcrumb-item a {
        color: #051242;
    }
    .breadcrumb .active {
        color: #FCA702;
    }
    .banner-bg {
        position: absolute;
        right: 0;
        top: 0;
        height: 100%;
        width: 50%;
        background-position: 50%;
        background: url('{{asset('web/img/brands/banner2.jpg')}}') no-repeat center/cover !important;
        object-fit: contain;
    }
    @media (max-width: 768px) {
        .banner {
            flex-direction: column;
            text-align: center;
        }
        .banner-content, .banner-bg {
            max-width: 100%;
        }
        .banner-content {
            text-align: center;
        }
        .banner-bg {
            height: 200px;
            width: 100%;
        }
        .banner {
            padding: 50px
        }
        .breadcrumb {
            display: flex;
            justify-content: center;
            margin-top: 1rem;
        }
    }

    /* heading */

    .custom-heading {
        text-align: center;
    }
    .custom-heading .highlight {
        color: #FFA500;
        font-weight: bold;
        display: inline-block;
        position: relative;
        font-size: 1.5rem
    }
    .custom-heading .highlight::before {
        content: "";
        width: 50px;
        height: 2px;
        background: #FFA500;
        position: absolute;
        left: -60px;
        top: 50%;
        transform: translateY(-50%);
    }
    .custom-heading h2 {
        color: #001F54;
        font-weight: bold;
        font-size: 2.4rem; 
        margin-top: 10px;
    }


    
    .service-card {
        text-align: center;
        padding: 20px;
        border: none;
        border-radius: 20px;
        background: linear-gradient(145deg, #6a11cb, #2575fc);
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        transition: all 0.3s ease;
        height: 100%;
        position: relative;
        overflow: hidden;
        cursor: pointer;
        transform: perspective(1000px) rotateY(0deg);
    }

    .service-card:hover {
        transform: perspective(1000px) rotateY(10deg) translateY(-10px);
        box-shadow: 0 15px 40px rgba(0, 0, 0, 0.5);
    }

    .service-card-inner {
        background: linear-gradient(145deg, #ffffff, #f3f3f3);
        padding: 20px;
        border-radius: 15px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;
    }

    .service-card:hover .service-card-inner {
        transform: scale(1.05);
    }

    .service-card img {
        max-width: 160px;
        margin-bottom: 20px;
        /* border-radius: 50%; */
        /* border: 3px solid #6a11cb; */
        /* box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2); */
        transition: transform 0.3s ease;
    }

    .service-card:hover img {
        transform: rotate(10deg) scale(1.1);
    }

    .service-title {
        font-weight: bold;
        color: #ffffff;
        margin-bottom: 15px;
        font-size: 1.4rem;
        text-transform: uppercase;
        letter-spacing: 1px;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
    }
    .service-card p {
        color: white
    }
</style>
