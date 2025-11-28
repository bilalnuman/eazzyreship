

@push('css')
    <style>
        .select2-container .select2-selection--single {
            height: calc(2.3rem + 2px);
            /* Tamaño acorde con Bootstrap */
            padding: 0.375rem 0.75rem;
            /* Ajuste interno */
            font-size: 1rem;
            line-height: 1.5;
            border: 1px solid #ced4da;
            /* Borde Bootstrap */
            border-radius: 0.375rem;
            /* Borde redondeado */
        }

        .select2-container--bootstrap-5 .select2-selection--multiple {
            height: auto;
            /* Soporta múltiples líneas */
            border: 1px solid #ced4da;
            border-radius: 0.375rem;
        }

        .select2-container--bootstrap-5 .select2-selection__rendered {
            padding: 0.375rem;
            /* Espaciado interno */
        }

        .select2-container--bootstrap-5 .select2-selection__arrow {
            top: 50%;
            transform: translateY(-50%);
        }
        
        .camera-options {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }
        
        .camera-options button {
            flex: 1;
        }
        
        #cameraContainer2 {
            margin-top: 15px;
        }
        
        #cameraContainer2 video {
            width: 100%;
            max-width: 300px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        
        .capture-actions {
            margin-top: 10px;
            display: flex;
            gap: 10px;
        }
        
        #photoPreview {
            max-width: 100%;
            margin-top: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
    </style>
@endpush
<div class="form-group mb-4">
    <label>Shipment Type</label><br>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="type" id="type" value="1"
            {{ old('type', $shipment->type ?? '1') == '1' ? 'checked' : '' }} required>
        <label class="form-check-label" for="typeAir">Air (2 days delivery) </label>
    </div>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="type" id="type" value="2"
            {{ old('type', $shipment->type ?? '1') == '2' ? 'checked' : '' }} required>
        <label class="form-check-label" for="typeOcean">Sea (7 days delivery) </label>
    </div>
    @error('type')
        <span class="invalid-feedback d-block">{{ $message }}</span>
    @enderror
</div>

<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label for="from_branch_id">From Branch</label>
            <select name="from_branch_id" id="from_branch_id"
                class="form-control @error('from_branch_id') is-invalid @enderror" required>
                <!--option value="">Select a branch</option-->
                @foreach ($branches0 as $id => $name)
                    <option value="{{ $id }}"
                        {{ old('from_branch_id', $shipment->from_branch_id ?? '6') == $id ? 'selected' : '' }}>
                        {{ $name }}
                    </option>
                @endforeach
            </select>
            @error('from_branch_id')
                <span class="invalid-feedback">{{ $message }}</span>
            @enderror
        </div>
    </div>

    <div class="col-md-6">
        <div class="form-group">
            <label for="mission_id">Manifest</label>
            <select name="mission_id" id="mission_id" class="form-control @error('mission_id') is-invalid @enderror"
                required>
                <option value="">Select a Manifest</option>
                @foreach ($missions as $id => $code)
                    <option value="{{ $id }}"
                        {{ old('mission_id', $shipment->mission_id ?? '') == $id ? 'selected' : '' }}>
                        {{ $code }}
                    </option>
                @endforeach
            </select>
            @error('mission_id')
                <span class="invalid-feedback">{{ $message }}</span>
            @enderror
        </div>
    </div>
<input type="hidden"
       name="client_email"
       id="client_email"
       value="{{ old('client_email', $shipment->client->email ?? '') }}">
    <div class="col-md-6">
        <div class="form-group">
            <label for="client_id">Customer/sender</label>
            <select name="client_id" id="client_id"
                class="form-control select2 @error('client_id') is-invalid @enderror">
                <option value="">Select a client</option>
               
                @foreach ($clients as $client)
                    <option value="{{ $client->id }}"
                        {{ old('client_id', $shipment->client_id ?? '') == $client->id ? 'selected' : '' }}
                        data-mobilec="{{ $client->mobile }}"
                        @foreach ($client->addresses as $var)
                        data-addressc="{{ $var->address }}" @endforeach
                        data-branchc="{{ $client->branch_id }}"
                        data-email="{{ $client->email }}"
                        >
                        {{ $client->name }}</option>
                @endforeach
            </select>
            @error('client_id')
                <span class="invalid-feedback">{{ $message }}</span>
            @enderror
        </div>
    </div>

    <div class="col-md-6">
        <div class="form-group">
            <label for="responsible_mobile">Customer phone</label>
            <input type="text" name="responsible_mobile" id="responsible_mobile" class="form-control"
                value="{{ old('responsible_mobile', $shipment->client->mobile ?? '') }}" readonly>
        </div>
    </div>

    <div class="col-12">
        <div class="form-group">
            <label for="responsible_address">Customer Address</label>
            <input type="text" name="responsible_address" id="responsible_address"
                class="form-control @error('responsible_address') is-invalid @enderror"
                value="{{ old('responsible_address', $client_address->address ?? '') }}" readonly>
            @error('responsible_address')
                <span class="invalid-feedback">{{ $message }}</span>
            @enderror
        </div>
    </div>
</div>

<!--div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label for="to_branch_id">To Branch</label>
            <select name="to_branch_id" id="to_branch_id"
                class="form-control @/error('to_branch_id') is-invalid @/enderror" required>
                <option value="">Select a branch</option>
                @/foreach ($branches as $id => $name)
                    <option value="{/{ $id }}"
                        {/{ old('to_branch_id', $shipment->to_branch_id ?? '') == $id ? 'selected' : '' }} >
                        {/{ $name }}
                    </option>
                @/endforeach
            </select>
            @/error('to_branch_id')
                <span class="invalid-feedback">{/{ $message }}</span>
            @/enderror
        </div>
    </div>
</div-->

<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label for="to_branch_id">To Branch</label>
            <select name="to_branch_id" id="to_branch_id"
                class="form-control @error('to_branch_id') is-invalid @enderror" required>
                <option value="">Select a branch</option>
                @foreach ($branches as $branch)
                    <option value="{{ $branch->id }}"
                        {{ old('to_branch_id', $shipment->to_branch_id ?? '') == $branch->id ? 'selected' : '' }}
                        data-address="{{ $branch->address }}" data-mobile="{{ $branch->responsible_mobile }}">
                        {{ $branch->name }}
                    </option>
                @endforeach
            </select>
            @error('to_branch_id')
                <span class="invalid-feedback">{{ $message }}</span>
            @enderror
        </div>
    </div>
</div>

<div class="row">
    <!--div class="col-md-6">
        <div class="form-group">
            <label for="receiver_name">Receiver Name</label>

            <select name="receiver_name" id="receiver_name"
                class="form-control @/error('receiver_name') is-invalid @/enderror">
                <option value="">Select Receiver</option>
                @/foreach ($receivers as $receiver)
                    <option value="{/{ $receiver->id }}"
                        {/{ old('receiver_name', $shipment->receiver_name ?? '') == $receiver->id ? 'selected' : '' }}>
                        {/{ $receiver->name }}
                    </option>
                @/endforeach
            </select>

            @/error('receiver_name')
                <span class="invalid-feedback">{/{ $message }}</span>
            @/enderror
        </div>
    </div-->

    <div class="col-md-6">
        <div class="form-group">
            <label for="receiver_mobile">Branch phone</label>
            <input type="text" name="receiver_mobile" id="receiver_mobile" class="form-control"
                value="{{ old('receiver_mobile', $shipment->receiver_mobile ?? '') }}" readonly>
        </div>
    </div>

    <div class="col-md-6">
        <div class="form-group">
            <label for="receiver_address">Branch Address</label>
            <input type="text" name="receiver_address" id="receiver_address"
                class="form-control @error('receiver_address') is-invalid @enderror"
                value="{{ old('receiver_address', $shipment->receiver_address ?? '') }}" readonly>
            @error('receiver_address')
                <span class="invalid-feedback">{{ $message }}</span>
            @enderror
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label for="order_id">Order ID</label>
            <input type="text" name="order_id" id="order_id"
                class="form-control @error('order_id') is-invalid @enderror"
                value="{{ old('order_id', $shipment->order_id ?? '') }}">
            @error('order_id')
                <span class="invalid-feedback">{{ $message }}</span>
            @enderror
        </div>
    </div>

    <div class="col-md-3">
        <div class="form-group">
            <div class="form-group md-3">
                <label for="carrier">Carrier / Shipper</label>
                <input type="text" name="carrier" id="carrier" class="form-control"
                    value="{{ old('carrier', $shipment->carrier ?? '') }}">
            </div>
        </div>
        @error('carrier_doc')
            <span class="invalid-feedback">{{ $message }}</span>
        @enderror
    </div>

   


    <div class="col-md-8">
    <div class="form-group">
        <label for="attachments_before_shipping">Shipper Document</label>
        
        <!-- Hidden main input field -->
        <input type="file" 
               name="attachments_before_shipping[]" 
               id="attachments_before_shipping"
               accept=".jpg,.jpeg,.png,.pdf"
               class="form-control d-none @error('attachments_before_shipping') is-invalid @enderror" 
               multiple>
        
        <!-- Custom buttons -->
        <div class="d-flex flex-wrap gap-2 mt-2">
            <button type="button" id="openCameraBtn" class="btn btn-primary">
                <i class="fas fa-camera"></i> Open Camera
            </button>
            <button type="button" id="chooseFileBtn" class="btn btn-info ml-2">
                <i class="fas fa-folder-open"></i> Choose Files
            </button>
        </div>
        
        <small class="form-text text-muted mt-2">
            You can upload files (.jpg, .jpeg, .png, .pdf).
        </small>

        @error('attachments_before_shipping')
            <span class="invalid-feedback">{{ $message }}</span>
        @enderror
    </div>

    <!-- Preview for captured or selected files -->
    <div id="previewContainer" class="mt-3"></div>

    @if (isset($shipment->attachments) && $shipment->attachments->isNotEmpty())
        <h3>Attached files:</h3>
        <div class="container">
            <div class="row">
                @foreach ($shipment->attachments as $attachment)
                    <div class="col-6 col-sm-4 col-md-2 text-center mb-4">
                        @if (Str::endsWith($attachment->file_path, ['.jpg', '.jpeg', '.png']))
                            <img src="{{ Storage::disk('s3')->url($attachment->file_path) }}" 
                                 alt="Attachment"
                                 class="img-fluid" style="max-width: 100px;">
                        @elseif (Str::endsWith($attachment->file_path, ['.pdf']))
                            <a href="{{ Storage::disk('s3')->url($attachment->file_path) }}" 
                               target="_blank" class="d-block">View PDF</a>
                        @endif
                        <a href="#" class="btn btn-warning btn-sm remove-attachment mt-2"
                           data-id="{{ $attachment->id }}">
                           <i class="fas fa-trash"></i>
                        </a>
                    </div>
                @endforeach
            </div>
        </div>
    @endif
</div>

<!-- JavaScript -->
<script>
document.addEventListener('DOMContentLoaded', function () {
    const fileInput = document.getElementById('attachments_before_shipping');
    const openCameraBtn = document.getElementById('openCameraBtn');
    const chooseFileBtn = document.getElementById('chooseFileBtn');
    const previewContainer = document.getElementById('previewContainer');

    // 📸 Open Camera functionality
    openCameraBtn.addEventListener('click', function () {
        // Recreate input with capture attribute for camera
        const cameraInput = document.createElement('input');
        cameraInput.type = 'file';
        cameraInput.accept = 'image/*';
        cameraInput.capture = 'environment'; // opens back camera
        cameraInput.multiple = true;

        cameraInput.addEventListener('change', function (e) {
            handleFilePreview(e.target.files);
        });

        cameraInput.click();
    });

    // 📂 Choose Files functionality
    chooseFileBtn.addEventListener('click', function () {
        fileInput.click();
    });

    // File preview handler
    fileInput.addEventListener('change', function (e) {
        handleFilePreview(e.target.files);
    });

    function handleFilePreview(files) {
        previewContainer.innerHTML = "";
        Array.from(files).forEach(file => {
            if (file.type.startsWith("image/")) {
                const img = document.createElement("img");
                img.src = URL.createObjectURL(file);
                img.className = "img-fluid m-2";
                img.style.maxWidth = "100px";
                previewContainer.appendChild(img);
            } else if (file.type === "application/pdf") {
                const link = document.createElement("a");
                link.href = URL.createObjectURL(file);
                link.target = "_blank";
                link.textContent = "View PDF";
                link.className = "d-block m-2";
                previewContainer.appendChild(link);
            }
        });
    }
});
</script>


    <div class="col-md-8">
        <div class="form-group">
            <label for="attachments_before_shipping">Attachments</label>
            <input type="file" name="attachments_before_shipping[]" id="attachments_before_shipping"
                accept=".jpg,.jpeg,.png,.pdf"
                class="form-control @error('attachments_before_shipping') is-invalid @enderror" multiple>
            <small class="form-text text-muted">You can upload files (.jpg, .jpeg, .png, .pdf).</small>
            @error('attachments_before_shipping')
                <span class="invalid-feedback">{{ $message }}</span>
            @enderror
        </div>

        @if (isset($shipment->attachments) && $shipment->attachments->isNotEmpty())
            <h3>Attached files:</h3>
            <div class="container">
                <div class="row">
                    @foreach ($shipment->attachments as $attachment)
                        <div class="col-6 col-sm-4 col-md-2 text-center mb-4">
                            @if (Str::endsWith($attachment->file_path, ['.jpg', '.jpeg', '.png']))
                                <img src="{{ Storage::disk('s3')->url($attachment->file_path) }}" alt="Attachment"
                                    class="img-fluid" style="max-width: 100px;">
                            @elseif (Str::endsWith($attachment->file_path, ['.pdf']))
                                <a href="{{ Storage::disk('s3')->url($attachment->file_path) }}" target="_blank"
                                    class="d-block">View PDF</a>
                            @endif
                            <a href="#" class="btn btn-warning btn-sm remove-attachment mt-2"
                                data-id="{{ $attachment->id }}"><i class="fas fa-trash"></i></a>
                        </div>
                    @endforeach
                </div>
            </div>
        @endif

    </div>
    <div class="col-md-4">
        <div class="form-group">
            <label for="capturedImages">webcam</label><br />

            <button type="button" id="openCameraButton">Open camera</button>
            <button type="button" id="closeCameraButton" style="display: none;">Close camera</button>

            <div id="cameraContainer" style="display: none;">
                <video id="video" width="320" height="240" autoplay></video>
                <button type="button" id="captureButton">Capture</button>
            </div>
            <!-- Container for captured images -->
            <div id="capturedImagesContainer"></div>
            <!-- Hidden field for storing multiple captured images -->
            <input type="hidden" id="capturedImages" name="capturedImages">
        </div>
    </div>
</div>

<hr><br>

<div class="row" id="packagesContainer">
    @if (isset($package_shipments) && count($package_shipments) > 0)
        <!-- Loop to show existing packages when editing -->
        @foreach ($package_shipments as $index => $package)
            @include('pages.shipments.form-package')
        @endforeach
    @else
        @include('pages.shipments.form-package', ['index' => 0])
    @endif
</div>

<div class="text-left">
    <button type="button" id="addPackageBtn" class="btn btn-primary">Add Package</button>
</div>

<hr><br>

<div class="row">
    <div class="col-md-4">
        <div class="form-group">
            <label for="tax">Tax & Duty (%):</label>
            <input type="number" name="tax" id="tax" class="form-control" step="0.01" min="0"
                value="{{ old('tax', $shipment->tax ?? '0.00') }}">
        </div>
    </div>
    <div class="col-md-4">
        <div class="form-group">
            <label for="insurance">Insurance (%)</label>
            <input type="number" name="insurance" id="insurance" class="form-control" step="0.01"
                min="0" value="{{ old('insurance', $shipment->insurance ?? '0.00') }}">
        </div>
    </div>
    <div class="col-md-4">
        <div class="form-group">
            <label for="discount">Discount (%)</label>
            <input type="number" name="discount" id="discount" class="form-control" step="0.01"
                min="0" value="{{ old('discount', $shipment->discount ?? '0.00') }}">
        </div>
    </div>

    <div class="col-md-3">
        <div class="form-group">
            <label for="hazmat">Hazmat</label>
            <input type="number" name="hazmat"
                id="hazmat" class="form-control" step="0.01" min="0" value="{{ old('hazmat', $shipment->hazmat?? '0') }}">
        </div>
    </div>

    <div class="col-md-3">
        <div class="form-group">
            <label for="imo">Imo</label>
            <input type="number" name="imo" id="imo"
                class="form-control" step="0.01" min="0" value="{{ old('imo', $shipment->imo ?? '0') }}">
        </div>
    </div>

    <div class="col-md-3">
        <div class="form-group">
            <label for="handling">Handling</label>
            <input type="number" name="handling"
                id="handling" class="form-control" step="0.01" min="0"
                value="{{ old('handling', $shipment->handling ?? '0') }}">
        </div>
    </div>

    <div class="col-md-3">
        <div class="form-group">
            <label for="sed">Sed</label>
            <input type="number" name="sed"
                id="sed" class="form-control" step="0.01" min="0"
                value="{{ old('sed', $shipment->sed ?? '0') }}">
        </div>
    </div>

    <div class="col-md-6">
        <div class="form-group">
            <label for="shipping_cost">Shipping Cost:</label>
            <input type="number" name="shipping_cost" id="shipping_cost" class="form-control" step="0.01"
                min="0" value="{{ old('shipping_cost', $shipment->shipping_cost ?? '0.00') }}">
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label for="return_cost">Delivery Cost:</label>
            <input type="number" name="return_cost" id="return_cost" class="form-control" step="0.01"
                min="0" value="{{ old('return_cost', $shipment->return_cost ?? '0.00') }}">
        </div>
    </div>
</div>

<hr><br>

<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label for="amount_to_be_collected">Amount to be Collected</label>
            <input type="number" name="amount_to_be_collected" id="amount_to_be_collected" class="form-control"
                step="0.01" min="0.00"
                value="{{ old('amount_to_be_collected', $shipment->amount_to_be_collected ?? '0.00') }}">
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label for="total_weight">Total Weight</label>
            <input type="number" name="total_weight" id="total_weight" class="form-control" step="0.01"
                min="0.0" value="{{ old('total_weight', $shipment->total_weight ?? '0.00') }}">
            <span name="volumetric_weight" id="volumetric_weight"></span>
        </div>
    </div>
</div>
<hr><br>

@push('js')
    <script>
        function calcTotalWeight() {
            function roundUpToNearestTenth(value) {
                return Math.ceil(value * 10) / 10;
            }
            // Selector to get all package rows
            let packageItems = $('.package-item');

            let totalVolumetricWeight = 0;
            let sumWeight = 0;
            let sumValue = 0;

            packageItems.each(function() {
                // Inside each row, select the necessary inputs
                let qty = parseInt($(this).find('input[name*="[qty]"]').val()) || 1;
                let weight = parseFloat($(this).find('input[name*="[weight]"]').val()) || 0;
                let length = parseFloat($(this).find('input[name*="[length]"]').val()) || 0;
                let width = parseFloat($(this).find('input[name*="[width]"]').val()) || 0;
                let height = parseFloat($(this).find('input[name*="[height]"]').val()) || 0;
                let value = parseFloat($(this).find('input[name*="[value]"]').val()) || 0;

                // Volumetric weight calculation
                let volumetricWeight = (length * width * height) / 139;
                totalVolumetricWeight += volumetricWeight * qty;

                sumValue += value * qty;
                // Sum real weight adjusted by quantity
                sumWeight += weight * qty;
            });

            console.log("Volumetric Weight: ", totalVolumetricWeight.toFixed(2));
            console.log("Total Weight: ", sumWeight.toFixed(2));
            console.log("Total Value: ", sumValue.toFixed(2));

            // Show calculated values in respective fields
            // Show Volumetric Weight in the span
            $('#volumetric_weight').text('volumetric weight: ' + totalVolumetricWeight.toFixed(2))
            //$('#volumetric_weight').val(totalVolumetricWeight.toFixed(2));
            $('#total_weight').val(sumWeight.toFixed(2));

            // Get shipment type
            let shipmentType = $('input[name="type"]:checked').val();
            let totalCost = 0;

            if (shipmentType === '1') {
                // Air shipments: $5 per pound (greater of real and volumetric weight)
                totalCost = Math.max(sumWeight, totalVolumetricWeight) * 5;
            } else if (shipmentType === '2') {
                // Sea shipments
                let weightToUse = Math.max(4, totalVolumetricWeight);
                //let weightToUse = Math.ceil(totalVolumetricWeight);
                if (weightToUse <= 12) {
                    totalCost = (weightToUse / 4) * 4;
                } else {
                    let costUpTo12 = (12 / 4) * 4;
                    let additionalWeight = weightToUse - 12;
                    totalCost = costUpTo12 + additionalWeight * 0.5;
                }
            }
            console.log("Total Cost: ", totalCost.toFixed(2));
            totalCost = roundUpToNearestTenth(totalCost);
            // Show calculated total cost in shipping cost field
            $('#shipping_cost').val(totalCost.toFixed(2));

            let tax = parseFloat($('#tax').val()) || 0;
            let insurance = parseFloat($('#insurance').val()) || 0;
            let discount = parseFloat($('#discount').val()) || 0;
            let hazmat = parseFloat($('#hazmat').val()) || 0;
            let imo = parseFloat($('#imo').val()) || 0;
            let handling = parseFloat($('#handling').val()) || 0;
            let sed = parseFloat($('#sed').val()) || 0;
            let returnc = parseFloat($('#return_cost').val()) || 0;
            let shipping = parseFloat($('#shipping_cost').val()) || 0;

            totalCollected = (sumValue * (tax / 100)) 
            + (sumValue * (insurance / 100)) + returnc + (shipping - (shipping * (discount / 100))) + hazmat + imo + handling + sed;
            $('#amount_to_be_collected').val(totalCollected.toFixed(2));

        }
    </script>
    <script>
        $(document).ready(function() {
            // Initialize Select2
            $('.select2').select2();
            const mobileInput = document.getElementById('responsible_mobile');
            const addressInput = document.getElementById('responsible_address');
            const emailInput = document.getElementById('client_email');

            // Handle selection change
            // $('#client_id').on('change', function() {
            //     // Get selected value
            //     const selectedOption = $(this).find(':selected');

            //     // Access custom data
            //     const mobile = selectedOption.data('mobilec');
            //     const branch = selectedOption.data('branchc');
            //     const address = selectedOption.data('addressc');
            //       const email   = selectedOption.data('email');

            //     // Show data in console or use in your logic
            //     mobileInput.value = mobile;
            //     addressInput.value = address;

            //     //console.log('Mobile:', mobile);
            //     //console.log('Branch:', branch);
            //     //console.log('Address:', address);
            // });

            $('#client_id').on('change', function() {
    const selectedOption = $(this).find(':selected');

    const mobile  = selectedOption.data('mobilec');
    const branch  = selectedOption.data('branchc');
    const address = selectedOption.data('addressc');
    const email   = selectedOption.data('email');   // 👈 new

    mobileInput.value  = mobile || '';
    addressInput.value = address || '';
    if (emailInput) {
        emailInput.value = email || '';
    }
});






            // Event to capture additional data when selecting a receiver
            $('#to_branch_id').on('change', function() {
                let selectedOption = $(this).find(':selected');
                let receiverMobile = selectedOption.data('mobile'); // Get mobile
                let receiverAddress = selectedOption.data('address'); // Get address

                // Here you can fill other fields or execute actions with the data
                $('#receiver_mobile').val(receiverMobile);
                $('#receiver_address').val(receiverAddress);
            });

            //search for client field
            $('#client_id').select2({
                placeholder: "Select customer",
                allowClear: true,
                width: '100%' // Adjust width
            });

        });
    </script>
    <script>
        // Initialize intl-tel-input plugin for multiple fields
        const inputs = ["#receiver_mobile", "#responsible_mobile"]; // Input IDs

        inputs.forEach(function(selector) {
            const input = document.querySelector(selector);

            if (input) {
                window.intlTelInput(input, {
                    initialCountry: "sx", // Set default country
                    onlyCountries: ["sx", "mf", "ai", "kn", "bl", "us"], // Allowed countries
                    separateDialCode: false,
                    nationalMode: false, // Show separate area code
                    utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.19/js/utils.js" // For additional formatting
                });
            }
        });
    </script>
  
    <script>
        document.getElementById('addPackageBtn').addEventListener('click', function() {
            const container = document.getElementById('packagesContainer');
            //const lastIndex = container.querySelectorAll('.package-item').length;
            const newPackage = container.firstElementChild.cloneNode(true);
            const packageItems = container.querySelectorAll('.package-item');
            // Get data-index values of existing packages
            const indices = Array.from(packageItems).map(item => {
                return parseInt(item.getAttribute('data-index'), 10);
            });

            // Calculate new index
            const ultimoIndex = indices.length > 0 ? Math.max(...indices) : -1;
            const lastIndex = ultimoIndex + 1;


            // Update field attributes in the new package
            newPackage.dataset.index = lastIndex;
            newPackage.querySelectorAll('input, select').forEach(input => {
                const name = input.name.replace(/\[\d+\]/, `[${lastIndex}]`);
                input.name = name;
                input.id = name.replace(/\\/g, '_');
                input.value = ''; // Clear values
            });

            // Create remove button dynamically
            const removeButton = document.createElement('button');
            removeButton.type = 'button';
            removeButton.className = 'btn btn-danger btn-sm remove-package';
            removeButton.textContent = 'Remove';
            removeButton.setAttribute('data-index', lastIndex);

            // Add button to package
            const removeButtonContainer = document.createElement('div');
            removeButtonContainer.className = 'form-group mb0';
            removeButtonContainer.appendChild(removeButton);
            newPackage.appendChild(removeButtonContainer);

            container.appendChild(newPackage);
        });

        document.getElementById('packagesContainer').addEventListener('click', function(e) {
            if (e.target && e.target.classList.contains('remove-package')) {
                const packageIndex = e.target.getAttribute('data-index');
                const packageGroup = document.querySelector(
                    `.package-item[data-index="${packageIndex}"]`
                );
                if (packageGroup) {
                    packageGroup.parentNode.removeChild(packageGroup);
                }
            }
        });
    </script>
    <script>
        let capturedImagesArray = [];
        let videoStream = null;

        document.getElementById('openCameraButton').addEventListener('click', function() {
            document.getElementById('cameraContainer').style.display = 'block';
            document.getElementById('closeCameraButton').style.display = 'inline-block';

            navigator.mediaDevices.getUserMedia({
                    video: true
                })
                .then(function(stream) {
                    videoStream = stream;
                    document.getElementById('video').srcObject = stream;
                })
                .catch(function(err) {
                    alert("Error accessing camera: " + err.message);
                });
        });

        document.getElementById('captureButton').addEventListener('click', function() {
            const video = document.getElementById('video');
            const canvas = document.createElement('canvas');
            const context = canvas.getContext('2d');

            canvas.width = video.videoWidth;
            canvas.height = video.videoHeight;
            context.drawImage(video, 0, 0, canvas.width, canvas.height);

            const imageData = canvas.toDataURL('image/png');
            capturedImagesArray.push(imageData);
            document.getElementById('capturedImages').value = JSON.stringify(capturedImagesArray);

            const img = document.createElement('img');
            img.src = imageData;
            img.style.width = '100px';
            img.style.margin = '5px';
            document.getElementById('capturedImagesContainer').appendChild(img);

            alert('Image captured.');
        });

        document.getElementById('closeCameraButton').addEventListener('click', function() {
            if (videoStream) {
                let tracks = videoStream.getTracks();
                tracks.forEach(track => track.stop()); // Stop each camera track
                videoStream = null;
            }

            document.getElementById('cameraContainer').style.display = 'none';
            document.getElementById('closeCameraButton').style.display = 'none';
        });
    </script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const startCameraBtn = document.getElementById("startCamera");
            const switchCameraBtn = document.getElementById("switchCamera");
            const captureBtn = document.getElementById("capture");
            const cancelCameraBtn = document.getElementById("cancelCamera");
            const cameraContainer = document.getElementById("cameraContainer2");
            const video = document.getElementById("camera");
            const canvas = document.getElementById("canvas2");
            const photoPreview = document.getElementById("photoPreview");
            const capturedImageInput = document.getElementById("captured_image");
            const fileInput = document.getElementById("carrier_doc");

            let stream = null;
            let currentFacingMode = 'user'; // 'user' for front camera, 'environment' for back

            // Check if device is mobile
            function isMobileDevice() {
                return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
            }

            // Activate camera
            startCameraBtn.addEventListener("click", async () => {
                try {
                    const constraints = {
                        video: {
                            facingMode: currentFacingMode
                        }
                    };
                    
                    stream = await navigator.mediaDevices.getUserMedia(constraints);
                    video.srcObject = stream;
                    cameraContainer.style.display = "block";
                    
                    // Show switch camera button only on mobile devices
                    if (isMobileDevice() && navigator.mediaDevices.enumerateDevices) {
                        switchCameraBtn.style.display = "inline-block";
                    }
                } catch (error) {
                    alert("Error accessing the camera: " + error.message);
                }
            });

            // Switch between front and back camera (mobile only)
            switchCameraBtn.addEventListener("click", async () => {
                if (stream) {
                    stream.getTracks().forEach(track => track.stop());
                }
                
                currentFacingMode = currentFacingMode === 'user' ? 'environment' : 'user';
                
                try {
                    const constraints = {
                        video: {
                            facingMode: currentFacingMode
                        }
                    };
                    
                    stream = await navigator.mediaDevices.getUserMedia(constraints);
                    video.srcObject = stream;
                } catch (error) {
                    alert("Error switching camera: " + error.message);
                }
            });

            // Capture image
            captureBtn.addEventListener("click", () => {
                const context = canvas.getContext("2d");
                canvas.width = video.videoWidth;
                canvas.height = video.videoHeight;
                context.drawImage(video, 0, 0, canvas.width, canvas.height);

                // Convert image to base64
                const imageData = canvas.toDataURL("image/png");

                // Show preview
                photoPreview.src = imageData;
                photoPreview.style.display = "block";

                // Save image in hidden field
                capturedImageInput.value = imageData;

                // Stop camera
                if (stream) {
                    stream.getTracks().forEach(track => track.stop());
                    stream = null;
                }
                cameraContainer.style.display = "none";
                switchCameraBtn.style.display = "none";
            });

            // Cancel camera
            cancelCameraBtn.addEventListener("click", () => {
                if (stream) {
                    stream.getTracks().forEach(track => track.stop());
                    stream = null;
                }
                cameraContainer.style.display = "none";
                switchCameraBtn.style.display = "none";
            });

            // Handle file input change
            fileInput.addEventListener("change", function() {
                // Clear captured image when a file is selected
                capturedImageInput.value = "";
                photoPreview.style.display = "none";
            });
        });
    </script>
@endpush
