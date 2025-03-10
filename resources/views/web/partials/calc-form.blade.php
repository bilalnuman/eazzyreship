    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .calculator-container {
            max-width: 800px;
            margin: 70px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 0.6s ease-out forwards;
        }
        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .calculator-header {
            text-align: center;
            padding-bottom: 10px;
            border-bottom: 2px solid #00bcd4;
            color:#068b9cc7;
        }
        h1 {
            text-align: center;
            color: #087a89f6;
        }
        .form-control {
            transition: all 0.3s ease;
        }
        .form-control:focus {
            border-color: #00bcd4;
            box-shadow: 0 0 8px rgba(0, 188, 212, 0.5);
        }
        .btn-primary {
            background: #00bcd4;
            border: none;
            transition: all 0.3s ease-in-out;
            position: relative;
            overflow: hidden;
        }
        .btn-primary:hover {
            background: #0097a7;
        }
        .btn-primary:active {
            transform: scale(0.98);
        }
        .mt-3{
            color: #7e8992;
        }
        #cost-result {
            display: none;
        }
    </style>
<section>
    <div class="container">
        <div class="calculator-container p-4">
            <div class="calculator-header">
                <h1>Cost Calculator</h1>
                <p>Estimate your shipping cost quickly and easily.</p>
            </div>

            <div class="mt-3">
                <label for="service" class="form-label">Select the service you want to use</label>
                <select id="service" class="form-select">
                    <option value="ocean">Ocean Service to the Branch (7-12 Days)</option>
                    <option value="air">Air Service To Branch (2-4 Days)</option>
                    <option value="fedex">Fedex Dock-To-Door (2-4 Days Prepaid Services)</option>
                    <option value="dhl">DHL Dock-To-Door (2-4 Days Prepaid Services)</option>
                </select>
            </div>

            <div class="mt-3">
                <label for="destination" class="form-label">Where do you want to ship your package?</label>
                <select id="destination" class="form-select">
                    <option value="st_maarten">St Maarten</option>
                    <option value="aruba">Aruba</option>
                    <option value="curacao">Curacao</option>
                </select>
            </div>

            <div class="mt-3">
                <label class="form-label">Enter the dimensions of your package (in)</label>
                <div class="row g-2">
                    <div class="col-4">
                        <input type="number" id="length" class="form-control" placeholder="Length" min="0" step="0.1">
                    </div>
                    <div class="col-4">
                        <input type="number" id="width" class="form-control" placeholder="Width" min="0">
                    </div>
                    <div class="col-4">
                        <input type="number" id="height" class="form-control" placeholder="Height" min="0">
                    </div>
                </div>
            </div>

            <div class="mt-3">
                <label class="form-label">Enter the weight of your package (lbs)</label>
                <input type="number" id="weight" class="form-control" placeholder="Weight" min="0">
            </div>

            <button class="btn btn-primary w-100 mt-4" onclick="calculateCost()">Calculate Cost</button>
            
            <div id="cost-result" class="card mt-4 p-3">
                <div class="card-body">
                    <h4 class="card-title text-center">Shipment Cost Estimate</h4>
                    <p class="card-text text-center" id="cost-text">Total Cost: $0.00</p>
                </div>
            </div>

            <p class="text-muted text-center mt-2">
                * Air shipments are calculated based on actual weight or dimensional weight, whichever is higher.<br>
                * Ocean shipments are calculated based on dimensional weight.
            </p>
        </div>
    </div>
</section>

<script>
    function calculateCost() {
        let service = document.getElementById("service").value;
        let destination = document.getElementById("destination").value;
        let length = parseFloat(document.getElementById("length").value) || 0;
        let width = parseFloat(document.getElementById("width").value) || 0;
        let height = parseFloat(document.getElementById("height").value) || 0;
        let weight = parseFloat(document.getElementById("weight").value) || 0;

        let volume = (length * width * height) / 166;
        let chargeableWeight = Math.max(volume, weight);
        
        let baseRate = {
            "ocean": 10,
            "air": 20,
            "fedex": 25,
            "dhl": 30
        };

        let destinationRate = {
            "st_maarten": 1.0,
            "aruba": 1.2,
            "curacao": 1.5
        };

        let cost = chargeableWeight * baseRate[service] * destinationRate[destination];
        let costResult = document.getElementById("cost-result");
        let costText = document.getElementById("cost-text");

        costText.innerHTML = `Total Cost: USD $${cost.toFixed(2)}<br>Transit Time: 5 - 10 days<br>Carrier: FedEx Economy`;
        costResult.style.display = "block";
    }
</script>

