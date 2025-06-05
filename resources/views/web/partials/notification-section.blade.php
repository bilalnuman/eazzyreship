<section id="team" class="team section">

    {{-- banner section --}}

    <div class="banner mt-4">
        <div class="banner-content">
            <h1>Pre Notifications</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Pre Notifications</li>
                </ol>
            </nav>
        </div>
        <div class="banner-bg"></div>
    </div>
    <div class="container py-5">
        <div class="custom-heading">
            <span class="highlight">Pre Notification</span>
            <h2>Submit Package Information</h2>
            <p>Please upload the Invoice for your Package to prevent any delays.</p>
        </div>


        <div class="form-container w-100">
            <form>
            <h2 class="text-white text-center">Please Upload your Information</h2>

                <div class="row py-4">
                    <div class="col-md-6 mb-4">
                        <div class="form-group">
                            <label>Your Full Name</label>
                            <input type="text" class="form-control" placeholder="Enter your full name">
                        </div>
                    </div>

                    <div class="col-md-6 mb-4">
                        <div class="form-group">
                            <label>Customer ID</label>
                            <input type="text" class="form-control" placeholder="Enter EazzyReship Customer Id">
                        </div>
                    </div>

                    <div class="col-md-6 mb-4">
                        <div class="form-group">
                            <label>Vendor Tracking ID</label>
                            <input type="text" class="form-control" placeholder="Enter Vendor Tracking ID">
                        </div>
                    </div>

                    <div class="col-md-6 mb-4">
                        <div class="form-group">
                            <label>EazzyReship WR ID</label>
                            <input type="text" class="form-control" placeholder="Enter EazzyReship Tracking ID">
                        </div>
                    </div>

                    <div class="col-md-6 mb-4">
                        <div class="form-group">
                            <label>Select Category</label>
                            <select class="custom-select form-control">
                                <option selected disabled>- Select a category -</option>
                                <option>Electronics</option>
                                <option>Clothing</option>
                                <option>Accessories</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-6 mb-4">
                        <div class="form-group">
                            <label>Upload Invoice</label>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input form-control" id="customFile">
                                
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12 mb-4">
                        <div class="form-group">
                            <label>Shipping Changes</label><br>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="shippingChange" value="no" checked>
                                <label class="form-check-label">No</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="shippingChange" value="yes">
                                <label class="form-check-label">Yes</label>
                            </div>

                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="shippingChange" value="no" checked>
                                <label class="form-check-label">Online Purchase</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="shippingChange" value="yes">
                                <label class="form-check-label">Drop Off</label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Additional Comments</label>
                        <textarea class="form-control" rows="3" placeholder="Write any shipping changes or notes..."></textarea>
                    </div>
                </div>
                <div class="form-group text-center mt-4">
                    <button type="submit" class="btn submit-btn btn-lg btn-block">Submit</button>
                </div>
            </form>
        </div>
    </div>
</section>


<style>

.form-container {
            background: #051242;
            /* border: 2px solid #FCA702; */
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
            animation: fadeIn 1s ease-in-out;
        }
        .form-group label {
            font-weight: bold;
            color: #FCA702;
        }
        .form-control, .custom-select {
            background: #DFE0E5;
            color: #051242;
            border: none;
            border-radius: 8px;
        }
        .form-control:focus, .custom-select:focus {
            box-shadow: 0 0 10px #FCA702;
        }
        .submit-btn {
            background: #FCA702;
            color: #051242;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            transition: background 0.3s ease, transform 0.2s;
        }
        .submit-btn:hover {
            background: #DFE0E5;
            color: #051242;
            transform: scale(1.05);
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    /* body { font-family: Arial, sans-serif; text-align: center; background: #f0f0f5; margin: 0; padding: 20px; } */
    /* .container { max-width: 1200px; margin: auto; } */
    .brand-container { display: flex; flex-wrap: wrap; justify-content: center; margin-top: 30px; gap: 15px; }
    .brand-item { 
        width: 120px; 
        height: 120px; 
        display: flex; 
        align-items: center; 
        justify-content: center; 
        border-radius: 15px; 
        /* background: linear-gradient(145deg, #ffffff, #d1d9e6); */
        box-shadow: 5px 5px 10px #bebebe, -5px -5px 15px #ffffff;
        transition: all 0.3s ease-in-out; 
        position: relative; 
        overflow: hidden;
        border: 1px solid #051242;
    }
    .brand-item img { max-width: 80%; max-height: 80%; transition: transform 0.3s; }
    .brand-item::before {
        content: "";
        position: absolute;
        top: 0; 
        left: 0; 
        width: 100%; 
        height: 100%;
        background: rgba(0, 0, 0, 0.1);
        opacity: 0;
        transition: opacity 0.3s;
    }
    .brand-name {
        position: absolute;
        bottom: -30px;
        width: 100%;
        text-align: center;
        background: #001f54b0;
        color: #fff;
        font-size: 14px;
        padding: 5px 0;
        opacity: 0;
        transition: bottom 0.3s, opacity 0.3s;
    }
    .brand-item:hover::before { opacity: 1; }
    .brand-item:hover img { transform: scale(1.1); }
    .brand-item:hover .brand-name { bottom: 0; opacity: 1; }
    @media (max-width: 768px) { .brand-item { width: 90px; height: 90px; }

    .banner-bg {
        display: none
    }
}

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
        margin: 50px 0;
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
</style>