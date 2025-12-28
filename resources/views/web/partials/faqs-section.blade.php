<section id="team" class="team section">
    <div class="banner mt-4">
        <div class="banner-content">
            <h1>FAQS</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">FAQS</li>
                </ol>
            </nav>
        </div>
        <div class="banner-bg"></div>
    </div>
    <div class="container py-5">
        <div class="custom-heading">
            <span class="highlight">FAQS</span>
            <h2>Unlimited Shopping and Shipping Experience</h2>
            <p>Below find answers to our most frequently asked questions. If you do not find an answer for your question, please contact us and we will be glad to assist you.</p>
        </div>

        {{-- FAQS sections starts --}}
        <div class="faq-container mt-5">
            <!-- Search Bar -->
            <div class="row mb-4">
                <div class="col-lg-8 mx-auto">
                    <div class="faq-search-container">
                        <div class="faq-search-box">
                            <div class="input-group">
                                <span class="input-group-text search-icon">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                    </svg>
                                </span>
                                <input type="text" 
                                       class="form-control faq-search-input" 
                                       id="faqSearch" 
                                       placeholder="Search for questions or keywords...">
                                <button class="btn search-clear" id="clearSearch" type="button">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
                                        <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                                    </svg>
                                </button>
                            </div>
                            <div class="search-hint">
                                <small>Type any keyword to find relevant questions</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Search Results Info -->
            <div class="row mb-3" id="searchResultsInfo" style="display: none;">
                <div class="col-lg-8 mx-auto">
                    <div class="alert alert-info search-results-alert">
                        <div class="d-flex justify-content-between align-items-center">
                            <span id="resultsCount">0 results found</span>
                            <button class="btn btn-sm btn-outline-info" id="showAllQuestions">Show All Questions</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- FAQ Accordion -->
            <div class="row">
                <div class="col-lg-10 mx-auto">
                    <div class="faq-accordion" id="faqAccordion">
                        
                        <!-- FAQ Item 1 -->
                        <div class="faq-card" data-keywords="estimate shipping costs calculate rates calculator">
                            <div class="faq-header" id="headingOne">
                                <button class="faq-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    <span class="faq-number">01</span>
                                    <span class="faq-question">How can I estimate shipping costs?</span>
                                    <span class="faq-icon">+</span>
                                </button>
                            </div>
                            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-bs-parent="#faqAccordion">
                                <div class="faq-body">
                                    Please click on calculator page there you can check the shipping rates.
                                </div>
                            </div>
                        </div>
                        
                        <!-- FAQ Item 2 -->
                        <div class="faq-card" data-keywords="insure packages insurance terms conditions">
                            <div class="faq-header" id="headingTwo">
                                <button class="faq-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    <span class="faq-number">02</span>
                                    <span class="faq-question">Can I insure the Packages?</span>
                                    <span class="faq-icon">+</span>
                                </button>
                            </div>
                            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-bs-parent="#faqAccordion">
                                <div class="faq-body">
                                    Yes, for more details please check point #11 in Terms & Conditions section.
                                </div>
                            </div>
                        </div>
                        
                        <!-- FAQ Item 3 -->
                        <div class="faq-card" data-keywords="consolidate packages combine multiple">
                            <div class="faq-header" id="headingThree">
                                <button class="faq-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    <span class="faq-number">03</span>
                                    <span class="faq-question">Can I request consolidation of my packages?</span>
                                    <span class="faq-icon">+</span>
                                </button>
                            </div>
                            <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-bs-parent="#faqAccordion">
                                <div class="faq-body">
                                    Currently we do not consolidate the packages, however when several packages are received at one time those all are entered in the system as one package.
                                </div>
                            </div>
                        </div>
                        
                        <!-- FAQ Item 4 -->
                        <div class="faq-card" data-keywords="countries ship worldwide destination sint maarten islands">
                            <div class="faq-header" id="headingFour">
                                <button class="faq-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                    <span class="faq-number">04</span>
                                    <span class="faq-question">Which countries can you ship to?</span>
                                    <span class="faq-icon">+</span>
                                </button>
                            </div>
                            <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-bs-parent="#faqAccordion">
                                <div class="faq-body">
                                    Currently, we offer our service to Sint Maarten & neighboring islands but by using our prepaid "Direct to door" service we can ship anywhere in the world.
                                </div>
                            </div>
                        </div>
                        
                        <!-- FAQ Item 5 -->
                        <div class="faq-card" data-keywords="deliver home office doorstep delivery address">
                            <div class="faq-header" id="headingFive">
                                <button class="faq-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                    <span class="faq-number">05</span>
                                    <span class="faq-question">Can I have my package delivered to my home/office?</span>
                                    <span class="faq-icon">+</span>
                                </button>
                            </div>
                            <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-bs-parent="#faqAccordion">
                                <div class="faq-body">
                                    Yes, Doorstep deliveries can be arranged by coordinating with the local office in destination city.
                                </div>
                            </div>
                        </div>
                        
                        <!-- FAQ Item 6 -->
                        <div class="faq-card" data-keywords="discounts shipping charges price ocean freight rates">
                            <div class="faq-header" id="headingSix">
                                <button class="faq-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                                    <span class="faq-number">06</span>
                                    <span class="faq-question">Do you offer discounts on shipping charges?</span>
                                    <span class="faq-icon">+</span>
                                </button>
                            </div>
                            <div id="collapseSix" class="collapse" aria-labelledby="headingSix" data-bs-parent="#faqAccordion">
                                <div class="faq-body">
                                    Yes, when you ship bigger packages via ocean freight you will see the prices per lb. go down for more details please check our rates page.
                                </div>
                            </div>
                        </div>
                        
                        <!-- FAQ Item 7 -->
                        <div class="faq-card" data-keywords="create account free registration signup">
                            <div class="faq-header" id="headingSeven">
                                <button class="faq-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
                                    <span class="faq-number">07</span>
                                    <span class="faq-question">Is creating an account free?</span>
                                    <span class="faq-icon">+</span>
                                </button>
                            </div>
                            <div id="collapseSeven" class="collapse" aria-labelledby="headingSeven" data-bs-parent="#faqAccordion">
                                <div class="faq-body">
                                    Yes, it's completely free and will always be free.
                                </div>
                            </div>
                        </div>
                        
                        <!-- FAQ Item 8 -->
                        <div class="faq-card" data-keywords="necessary account required notifications package">
                            <div class="faq-header" id="headingEight">
                                <button class="faq-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
                                    <span class="faq-number">08</span>
                                    <span class="faq-question">Is it necessary to create an account?</span>
                                    <span class="faq-icon">+</span>
                                </button>
                            </div>
                            <div id="collapseEight" class="collapse" aria-labelledby="headingEight" data-bs-parent="#faqAccordion">
                                <div class="faq-body">
                                    Yes, once you have an account, any package received under your name is booked under your account so you will receive package notifications.
                                </div>
                            </div>
                        </div>
                        
                        <!-- FAQ Item 9 -->
                        <div class="faq-card" data-keywords="open inspect packages photos pictures tracking">
                            <div class="faq-header" id="headingNine">
                                <button class="faq-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseNine" aria-expanded="false" aria-controls="collapseNine">
                                    <span class="faq-number">09</span>
                                    <span class="faq-question">Can you open and inspect my packages?</span>
                                    <span class="faq-icon">+</span>
                                </button>
                            </div>
                            <div id="collapseNine" class="collapse" aria-labelledby="headingNine" data-bs-parent="#faqAccordion">
                                <div class="faq-body">
                                    Yes, once you have an account with us, you can send us the request with tracking numbers then we will open your packages and send you pictures of the same. This will be a paid service; charges will be determined depending on the size and type of the package. Charges can be between $5 to $15 per package.
                                </div>
                            </div>
                        </div>
                        
                        <!-- FAQ Item 10 -->
                        <div class="faq-card" data-keywords="return vendor send back refund labels">
                            <div class="faq-header" id="headingTen">
                                <button class="faq-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTen" aria-expanded="false" aria-controls="collapseTen">
                                    <span class="faq-number">10</span>
                                    <span class="faq-question">Can I return the package to the Vendor?</span>
                                    <span class="faq-icon">+</span>
                                </button>
                            </div>
                            <div id="collapseTen" class="collapse" aria-labelledby="headingTen" data-bs-parent="#faqAccordion">
                                <div class="faq-body">
                                    Yes, you can send us the request with tracking numbers that way we will not ship your package and then request your vendor to arrange the pick-up from our warehouse. You can also send us return labels to stick on your package. This will be paid service; charges will be determined depending on the size and type of the package. Charges can be between $5 to $15 per package.
                                </div>
                            </div>
                        </div>
                        
                        <!-- FAQ Item 11 -->
                        <div class="faq-card" data-keywords="pickup warehouse collect authorization person company">
                            <div class="faq-header" id="headingEleven">
                                <button class="faq-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEleven" aria-expanded="false" aria-controls="collapseEleven">
                                    <span class="faq-number">11</span>
                                    <span class="faq-question">Can I request someone to pick up the package from your warehouse?</span>
                                    <span class="faq-icon">+</span>
                                </button>
                            </div>
                            <div id="collapseEleven" class="collapse" aria-labelledby="headingEleven" data-bs-parent="#faqAccordion">
                                <div class="faq-body">
                                    Yes, you can send us the request with tracking numbers / WR ID for the package/s that you want to have picked up and authorization for the person/company who will collect the packages. This will be a paid service; charges will be determined depending on the size and type of the package. Charges can be between $5 to $15 per package.
                                </div>
                            </div>
                        </div>
                        
                        <!-- FAQ Item 12 -->
                        <div class="faq-card" data-keywords="dropoff location miami nearby area delivery">
                            <div class="faq-header" id="headingTwelve">
                                <button class="faq-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwelve" aria-expanded="false" aria-controls="collapseTwelve">
                                    <span class="faq-number">12</span>
                                    <span class="faq-question">Can I have my package drop-off to another location in Miami or a nearby area?</span>
                                    <span class="faq-icon">+</span>
                                </button>
                            </div>
                            <div id="collapseTwelve" class="collapse" aria-labelledby="headingTwelve" data-bs-parent="#faqAccordion">
                                <div class="faq-body">
                                    Yes, you can send us the request with tracking numbers / WR ID for the package/s that you want to drop-off to any other location. For this service we will quote you how much it will cost to drop off to another location once you agree and pre-pay the charges, we will drop off your package.
                                </div>
                            </div>
                        </div>
                        
                        <!-- FAQ Item 13 -->
                        <div class="faq-card" data-keywords="order products worldwide united states usa">
                            <div class="faq-header" id="headingThirteen">
                                <button class="faq-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThirteen" aria-expanded="false" aria-controls="collapseThirteen">
                                    <span class="faq-number">13</span>
                                    <span class="faq-question">From where can I order the products?</span>
                                    <span class="faq-icon">+</span>
                                </button>
                            </div>
                            <div id="collapseThirteen" class="collapse" aria-labelledby="headingThirteen" data-bs-parent="#faqAccordion">
                                <div class="faq-body">
                                    You can order products from any part of the world as far as they are shipped to United States to our warehouse address.
                                </div>
                            </div>
                        </div>
                        
                        <!-- FAQ Item 14 -->
                        <div class="faq-card" data-keywords="batteries hazardous materials perfume paint dangerous ocean freight">
                            <div class="faq-header" id="headingFourteen">
                                <button class="faq-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFourteen" aria-expanded="false" aria-controls="collapseFourteen">
                                    <span class="faq-number">14</span>
                                    <span class="faq-question">Can I order batteries or any hazardous materials?</span>
                                    <span class="faq-icon">+</span>
                                </button>
                            </div>
                            <div id="collapseFourteen" class="collapse" aria-labelledby="headingFourteen" data-bs-parent="#faqAccordion">
                                <div class="faq-body">
                                    Yes, you can order batteries or any hazardous materials like perfumes, paints etc. Such items will only be shipped by ocean freight & you might be charged hazardous material fee.
                                </div>
                            </div>
                        </div>
                        
                        <!-- FAQ Item 15 -->
                        <div class="faq-card" data-keywords="misplaced lost package insurance liability terms">
                            <div class="faq-header" id="headingFifteen">
                                <button class="faq-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFifteen" aria-expanded="false" aria-controls="collapseFifteen">
                                    <span class="faq-number">15</span>
                                    <span class="faq-question">What happens if my package is misplaced/lost?</span>
                                    <span class="faq-icon">+</span>
                                </button>
                            </div>
                            <div id="collapseFifteen" class="collapse" aria-labelledby="headingFifteen" data-bs-parent="#faqAccordion">
                                <div class="faq-body">
                                    Customers have option to buy insurance. If the insurance is not purchased, in that case we only cover the liability that is mentioned in our Terms & Conditions point # Insurance Liability.
                                </div>
                            </div>
                        </div>
                        
                        <!-- FAQ Item 16 -->
                        <div class="faq-card" data-keywords="how long time receive packages delivery days ocean air freight">
                            <div class="faq-header" id="headingSixteen">
                                <button class="faq-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSixteen" aria-expanded="false" aria-controls="collapseSixteen">
                                    <span class="faq-number">16</span>
                                    <span class="faq-question">How long does it take to receive my packages?</span>
                                    <span class="faq-icon">+</span>
                                </button>
                            </div>
                            <div id="collapseSixteen" class="collapse" aria-labelledby="headingSixteen" data-bs-parent="#faqAccordion">
                                <div class="faq-body">
                                    If the packages are requested to ship via ocean freight, then it takes approximately 7-12 days to receive the package depending on which day the package is received in our warehouse. By air it takes approximately 2-5 days.
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        {{-- FAQS sections Ends --}}
        
    </div>
</section>

<style>
    /* FAQ Search Styles */
    .faq-search-container {
        margin-bottom: 25px;
    }
    
    .faq-search-box {
        background: #ffffff;
        border-radius: 12px;
        padding: 20px;
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
        border: 1px solid rgba(185, 133, 77, 0.2);
    }
    
    .input-group-text.search-icon {
        background-color: #ffffff;
        border: 1px solid #b2854d;
        border-right: none;
        border-radius: 8px 0 0 8px;
        color: #b2854d;
        padding: 0.75rem 1rem;
    }
    
    .faq-search-input {
        border: 1px solid #b2854d;
        border-left: none;
        border-right: none;
        padding: 0.75rem;
        font-size: 1rem;
        color: #051242;
        height: auto;
    }
    
    .faq-search-input:focus {
        box-shadow: none;
        border-color: #b2854d;
    }
    
    .faq-search-input::placeholder {
        color: #a8a8a8;
    }
    
    .search-clear {
        background-color: #ffffff;
        border: 1px solid #b2854d;
        border-left: none;
        border-radius: 0 8px 8px 0;
        color: #666;
        padding: 0.75rem 1rem;
        transition: all 0.3s ease;
    }
    
    .search-clear:hover {
        background-color: #f8f9fa;
        color: #d9534f;
    }
    
    .search-hint {
        margin-top: 10px;
        text-align: center;
        color: #888;
        font-size: 0.85rem;
    }
    
    /* Search Results Alert */
    .search-results-alert {
        background-color: rgba(13, 110, 253, 0.1);
        border: 1px solid rgba(13, 110, 253, 0.2);
        border-radius: 8px;
        color: #051242;
        padding: 12px 20px;
    }
    
    /* Highlight search results */
    .highlight-search {
        background-color: rgba(255, 193, 7, 0.3);
        padding: 2px 4px;
        border-radius: 3px;
    }
    
    /* Hidden FAQ items */
    .faq-card.hidden {
        display: none;
    }
    
    /* No results message */
    .no-results {
        text-align: center;
        padding: 40px 20px;
        color: #666;
        display: none;
    }
    
    .no-results.show {
        display: block;
    }
    
    .no-results-icon {
        font-size: 3rem;
        color: #ddd;
        margin-bottom: 20px;
    }

    /* FAQ Section Styles */
    .faq-container {
        margin-top: 40px;
    }
    
    .faq-card {
        background: #ffffff;
        border-radius: 10px;
        margin-bottom: 15px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        border: 1px solid rgba(185, 133, 77, 0.2);
        overflow: hidden;
        transition: all 0.3s ease;
    }
    
    .faq-card:hover {
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.12);
        border-color: rgba(185, 133, 77, 0.4);
    }
    
    .faq-header {
        background: #f8f9fa;
        border-bottom: 1px solid rgba(185, 133, 77, 0.2);
    }
    
    .faq-button {
        width: 100%;
        background: transparent;
        border: none;
        padding: 20px 25px;
        text-align: left;
        font-size: 1.05rem;
        font-weight: 600;
        color: #051242;
        display: flex;
        align-items: center;
        justify-content: space-between;
        cursor: pointer;
        transition: all 0.3s ease;
    }
    
    .faq-button:hover {
        background-color: rgba(255, 165, 0, 0.05);
        color: #b2854d;
    }
    
    .faq-button:focus {
        outline: none;
        box-shadow: none;
    }
    
    .faq-button.collapsed .faq-icon {
        transform: rotate(0deg);
    }
    
    .faq-button .faq-icon {
        font-size: 1.5rem;
        font-weight: 300;
        color: #b2854d;
        transition: transform 0.3s ease;
        transform: rotate(45deg);
    }
    
    .faq-number {
        background: linear-gradient(145deg, #ff6b26, #ffba3b);
        color: white;
        width: 36px;
        height: 36px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
        margin-right: 15px;
        flex-shrink: 0;
    }
    
    .faq-question {
        flex-grow: 1;
        text-align: left;
    }
    
    .faq-body {
        padding: 25px;
        background: #ffffff;
        color: #555;
        line-height: 1.7;
        font-size: 1rem;
        border-top: 1px solid rgba(185, 133, 77, 0.1);
    }
    
    .faq-body::before {
        content: "A:";
        color: #b2854d;
        font-weight: bold;
        margin-right: 8px;
    }
    
    /* Active FAQ item styling */
    .faq-card .collapse.show {
        animation: fadeIn 0.4s ease;
    }
    
    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }
    
    /* Responsive adjustments */
    @media (max-width: 768px) {
        .faq-search-box {
            padding: 15px;
        }
        
        .faq-button {
            padding: 15px 20px;
            font-size: 1rem;
        }
        
        .faq-number {
            width: 32px;
            height: 32px;
            font-size: 0.9rem;
            margin-right: 12px;
        }
        
        .faq-body {
            padding: 20px;
            font-size: 0.95rem;
        }
        
        .faq-search-input {
            font-size: 0.9rem;
        }
    }
    
    @media (max-width: 576px) {
        .faq-button {
            padding: 12px 15px;
            font-size: 0.95rem;
        }
        
        .faq-number {
            width: 28px;
            height: 28px;
            font-size: 0.8rem;
            margin-right: 10px;
        }
        
        .faq-body {
            padding: 15px;
        }
        
        .search-results-alert {
            padding: 10px 15px;
        }
    }

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
            display: none;
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
            padding: 50px;
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
        font-size: 1.5rem;
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
        color: white;
    }
</style>

<script>
    // Add Search Functionality for FAQ
    document.addEventListener('DOMContentLoaded', function() {
        const searchInput = document.getElementById('faqSearch');
        const clearSearchBtn = document.getElementById('clearSearch');
        const searchResultsInfo = document.getElementById('searchResultsInfo');
        const resultsCount = document.getElementById('resultsCount');
        const showAllQuestionsBtn = document.getElementById('showAllQuestions');
        const faqCards = document.querySelectorAll('.faq-card');
        
        // No results message
        const noResultsMessage = document.createElement('div');
        noResultsMessage.className = 'no-results';
        noResultsMessage.innerHTML = `
            <div class="no-results-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                </svg>
            </div>
            <h4>No questions found</h4>
            <p>Try searching with different keywords or browse all questions below.</p>
        `;
        document.querySelector('.faq-accordion').parentElement.appendChild(noResultsMessage);
        
        // Function to perform search
        function performSearch() {
            const searchTerm = searchInput.value.toLowerCase().trim();
            let visibleCount = 0;
            
            if (searchTerm === '') {
                // Show all questions
                faqCards.forEach(card => {
                    card.classList.remove('hidden');
                    // Remove any highlight from previous search
                    const questionElement = card.querySelector('.faq-question');
                    questionElement.innerHTML = questionElement.textContent;
                });
                
                searchResultsInfo.style.display = 'none';
                noResultsMessage.classList.remove('show');
                return;
            }
            
            // Search through questions
            faqCards.forEach(card => {
                const questionElement = card.querySelector('.faq-question');
                const questionText = questionElement.textContent.toLowerCase();
                const keywords = card.getAttribute('data-keywords') || '';
                const answerElement = card.querySelector('.faq-body');
                const answerText = answerElement.textContent.toLowerCase();
                
                // Check if search term matches question, keywords, or answer
                const matches = questionText.includes(searchTerm) || 
                               keywords.includes(searchTerm) || 
                               answerText.includes(searchTerm);
                
                if (matches) {
                    card.classList.remove('hidden');
                    visibleCount++;
                    
                    // Highlight the search term in the question
                    const originalQuestion = questionElement.textContent;
                    const regex = new RegExp(`(${searchTerm})`, 'gi');
                    const highlighted = originalQuestion.replace(regex, '<span class="highlight-search">$1</span>');
                    questionElement.innerHTML = highlighted;
                    
                    // Expand the matching FAQ item
                    const button = card.querySelector('.faq-button');
                    if (button.classList.contains('collapsed')) {
                        button.click();
                    }
                } else {
                    card.classList.add('hidden');
                    
                    // Reset highlight
                    questionElement.innerHTML = questionElement.textContent;
                }
            });
            
            // Update search results info
            if (searchTerm !== '') {
                resultsCount.textContent = `${visibleCount} result${visibleCount !== 1 ? 's' : ''} found for "${searchTerm}"`;
                searchResultsInfo.style.display = 'block';
                
                // Show no results message if no matches
                if (visibleCount === 0) {
                    noResultsMessage.classList.add('show');
                } else {
                    noResultsMessage.classList.remove('show');
                }
            } else {
                searchResultsInfo.style.display = 'none';
                noResultsMessage.classList.remove('show');
            }
        }
        
        // Event listener for search input
        searchInput.addEventListener('input', function() {
            performSearch();
        });
        
        // Clear search button
        clearSearchBtn.addEventListener('click', function() {
            searchInput.value = '';
            performSearch();
            searchInput.focus();
        });
        
        // Show all questions button
        showAllQuestionsBtn.addEventListener('click', function() {
            searchInput.value = '';
            performSearch();
        });
        
        // Add Bootstrap JavaScript functionality for FAQ accordion
        const faqButtons = document.querySelectorAll('.faq-button');
        
        faqButtons.forEach(button => {
            button.addEventListener('click', function() {
                const icon = this.querySelector('.faq-icon');
                const isCollapsed = this.classList.contains('collapsed');
                
                // Update all icons to plus
                document.querySelectorAll('.faq-icon').forEach(icon => {
                    icon.textContent = '+';
                });
                
                // Set current icon to minus if not collapsed
                if (!isCollapsed) {
                    icon.textContent = '+';
                } else {
                    icon.textContent = '-';
                }
            });
        });
        
        // Allow pressing Enter to search (optional)
        searchInput.addEventListener('keyup', function(event) {
            if (event.key === 'Enter') {
                performSearch();
            }
        });
    });
</script>