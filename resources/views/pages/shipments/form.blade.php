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
                <option value="">Select a branch</option>
                @foreach ($branches as $id => $name)
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
            <label for="mission_id">Mission</label>
            <select name="mission_id" id="mission_id" class="form-control @error('mission_id') is-invalid @enderror"
                required>
                <option value="">Select a Mission</option>
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

    <div class="col-md-6">
        <div class="form-group">
            <label for="client_id">Customer/sender</label>
            <select name="client_id" id="client_id" class="form-control @error('client_id') is-invalid @enderror">
                <option value="">Select a client</option>
                @foreach ($clients as $client)
                    <option value="{{ $client->id }}"
                        {{ old('client_id', $shipment->client_id ?? '') == $client->id ? 'selected' : '' }}
                        data-mobile="{{ $client->mobile }}" data-address="{{ $client->address }}"
                        data-branch="{{ $client->branch_id }}">
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
                value="{{ old('responsible_mobile', $shipment->client->mobile ?? '') }}">
        </div>
    </div>

    <div class="col-12">
        <div class="form-group">
            <label for="responsible_address">Customer Address</label>
            <input type="text" name="responsible_address" id="responsible_address"
                class="form-control @error('responsible_address') is-invalid @enderror"
                value="{{ old('responsible_address', $shipment->client->address ?? '') }}">
            @error('responsible_address')
                <span class="invalid-feedback">{{ $message }}</span>
            @enderror
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label for="to_branch_id">To Branch</label>
            <select name="to_branch_id" id="to_branch_id"
                class="form-control @error('to_branch_id') is-invalid @enderror" required>
                <option value="">Select a branch</option>
                @foreach ($branches as $id => $name)
                    <option value="{{ $id }}"
                        {{ old('to_branch_id', $shipment->to_branch_id ?? '') == $id ? 'selected' : '' }}>
                        {{ $name }}
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
    <div class="col-md-6">
        <div class="form-group">
            <label for="receiver_name">Receiver Name</label>

            <select name="receiver_name" id="receiver_name"
                class="form-control @error('receiver_name') is-invalid @enderror">
                <option value="">Select Receiver</option>
                @foreach ($receivers as $receiver)
                    <option value="{{ $receiver->id }}"
                        {{ old('receiver_name', $shipment->receiver_name ?? '') == $receiver->id ? 'selected' : '' }}>
                        {{ $receiver->name }}
                    </option>
                @endforeach
            </select>

            @error('receiver_name')
                <span class="invalid-feedback">{{ $message }}</span>
            @enderror
        </div>
    </div>

    <div class="col-md-6">
        <div class="form-group">
            <label for="receiver_mobile">Receiver phone</label>
            <input type="text" name="receiver_mobile" id="receiver_mobile" class="form-control"
                value="{{ old('receiver_mobile', $shipment->receiver_mobile ?? '') }}">
        </div>
    </div>

    <div class="col-12">
        <div class="form-group">
            <label for="receiver_address">Receiver Address</label>
            <input type="text" name="receiver_address" id="receiver_address"
                class="form-control @error('receiver_address') is-invalid @enderror"
                value="{{ old('receiver_address', $shipment->receiver_address ?? '') }}">
            @error('receiver_address')
                <span class="invalid-feedback">{{ $message }}</span>
            @enderror
        </div>
    </div>

    <div class="col-md-6">
        <div class="form-group">
            <label for="order_id">Shipment Order ID (Barcode)</label>
            <input type="text" name="order_id" id="order_id"
                class="form-control @error('order_id') is-invalid @enderror"
                value="{{ old('order_id', $shipment->order_id ?? '') }}">
            @error('order_id')
                <span class="invalid-feedback">{{ $message }}</span>
            @enderror
        </div>
    </div>

    <div class="col-12">
        <div class="form-group">
            <label for="attachments">Attachments</label>
            <input type="file" name="attachments[]" id="attachments"
                class="form-control @error('attachments') is-invalid @enderror" multiple>
            <small class="form-text text-muted">You can upload multiple files (e.g., images,
                documents).</small>
            @error('attachments')
                <span class="invalid-feedback">{{ $message }}</span>
            @enderror
        </div>
    </div>
</div>

<hr><br>

<div class="row" id="packagesContainer">
    @if (isset($package_shipments) && count($package_shipments) > 0)
        <!-- Loop para mostrar los paquetes existentes al editar -->
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
    <div class="col-md-6">
        <div class="form-group">
            <label for="tax">Tax & Duty:</label>
            <input type="number" name="tax" id="tax" class="form-control" step="1" min="0"
                value="{{ old('tax', $shipment->tax ?? '0') }}">
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label for="insurance">Insurance:</label>
            <input type="number" name="insurance" id="insurance" class="form-control" step="1"
                min="0" value="{{ old('insurance', $shipment->insurance ?? '0') }}">
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label for="shipping_cost">Shipping Cost:</label>
            <input type="number" name="shipping_cost" id="shipping_cost" class="form-control" step="0.10"
                min="1" value="{{ old('shipping_cost', $shipment->shipping_cost ?? '0.00') }}">
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label for="return_cost">Return Cost:</label>
            <input type="number" name="return_cost" id="return_cost" class="form-control" step="0.10"
                min="1" value="{{ old('return_cost', $shipment->return_cost ?? '0.00') }}">
        </div>
    </div>
</div>

<hr><br>

<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label for="amount_to_be_collected">Amount to be Collected</label>
            <input type="number" name="amount_to_be_collected" id="amount_to_be_collected" class="form-control" step="0.10"
                min="1" value="{{ old('amount_to_be_collected', $shipment->amount_to_be_collected ?? '0.00') }}">
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label for="total_weight">Total Weight</label>
            <input type="number" name="total_weight" id="total_weight" class="form-control" step="0.10"
                min="0.5" value="{{ old('total_weight', $shipment->total_weight ?? '0.00') }}">
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
            // Selector para obtener todas las filas de paquetes
            let packageItems = $('.package-item');

            let totalVolumetricWeight = 0;
            let sumWeight = 0;

            packageItems.each(function() {
                // Dentro de cada fila, seleccionamos los inputs necesarios
                let qty = parseInt($(this).find('input[name*="[qty]"]').val()) || 1;
                let weight = parseFloat($(this).find('input[name*="[weight]"]').val()) || 0;
                let length = parseFloat($(this).find('input[name*="[length]"]').val()) || 0;
                let width = parseFloat($(this).find('input[name*="[width]"]').val()) || 0;
                let height = parseFloat($(this).find('input[name*="[height]"]').val()) || 0;

                // Cálculo del peso volumétrico
                let volumetricWeight = (length * width * height) / 139;
                totalVolumetricWeight += volumetricWeight * qty;

                // Sumar el peso real ajustado por cantidad
                sumWeight += weight * qty;
            });

            console.log("Volumetric Weight: ", totalVolumetricWeight.toFixed(2));
            console.log("Total Weight: ", sumWeight.toFixed(2));

            // Mostrar los valores calculados en los campos respectivos
            // Mostrar Volumetric Weight en el span
            $('#volumetric_weight').text('volumetric weight: ' + totalVolumetricWeight.toFixed(2))
            //$('#volumetric_weight').val(totalVolumetricWeight.toFixed(2));
            $('#total_weight').val(sumWeight.toFixed(2));

            // Obtener el tipo de envío
            let shipmentType = $('input[name="type"]:checked').val();
            let totalCost = 0;

            if (shipmentType === '1') {
                // Envíos aéreos: $5 por libra (peso mayor entre real y volumétrico)
                totalCost = Math.max(sumWeight, totalVolumetricWeight) * 5;
            } else if (shipmentType === '2') {
                // Envíos marítimos
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
            // Mostrar el costo total calculado en el campo de costo de envío
            $('#shipping_cost').val(totalCost.toFixed(2));

            let tax = parseFloat($('#tax').val()) || 0;
            let insurance = parseFloat($('#insurance').val()) || 0;
            let returnc = parseFloat($('#return_cost').val()) || 0;
            let shipping = parseFloat($('#shipping_cost').val()) || 0;
            totalCollected = tax + insurance + returnc + shipping;
            $('#amount_to_be_collected').val(totalCollected.toFixed(2));


        }
    </script>
    <script>
        $(document).ready(function() {
            $('#to_branch_id').on('change', function() {
                let branchId = $(this).val();
                let stateSelect = $('#receiver_name');

                // Limpia los receptores actuales
                stateSelect.empty();
                stateSelect.append('<option value="">Select Receiver</option>');

                if (branchId) {
                    $.ajax({
                        url: `/receiver/${branchId}`,
                        type: 'GET',
                        success: function(response) {
                            // Asegúrate de acceder al array "data" del JSON devuelto
                            $.each(response.data, function(index, receiver) {
                                stateSelect.append(
                                    `<option value="${receiver.id}" 
                                     data-mobile="${receiver.receiver_mobile}" 
                                     data-address="${receiver.receiver_address}">
                                ${receiver.name}
                            </option>`
                                );
                            });
                        },
                        error: function() {
                            alert('Error fetching branch');
                        }
                    });
                }
            });

            // Evento para capturar datos adicionales al seleccionar un receptor
            $('#receiver_name').on('change', function() {
                let selectedOption = $(this).find(':selected');
                let receiverMobile = selectedOption.data('mobile'); // Obtiene el móvil
                let receiverAddress = selectedOption.data('address'); // Obtiene la dirección

                // Aquí puedes llenar otros campos o ejecutar acciones con los datos
                $('#receiver_mobile').val(receiverMobile);
                $('#receiver_address').val(receiverAddress);
            });
        });
    </script>
    <script>
        // Inicializar el plugin intl-tel-input para múltiples campos
        const inputs = ["#receiver_mobile", "#responsible_mobile"]; // IDs de los inputs

        inputs.forEach(function(selector) {
            const input = document.querySelector(selector);

            if (input) {
                window.intlTelInput(input, {
                    initialCountry: "sx", // Configurar el país predeterminado
                    onlyCountries: ["sx", "mf", "ai", "kn", "bl", "us"], // Países permitidos
                    separateDialCode: false,
                    nationalMode: false, // Mostrar código de área separado
                    utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.19/js/utils.js" // Para formateo adicional
                });
            }
        });
    </script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const clientSelect = document.getElementById('client_id');
            const mobileInput = document.getElementById('responsible_mobile');
            const addressInput = document.getElementById('responsible_address');
            const branchSelect = document.getElementById('to_branch_id');

            const receiverSelect = document.getElementById('receiver_name');
            const receiverMobile = document.getElementById('receiver_mobile');
            const receiverAddress = document.getElementById('receiver_address');


            clientSelect.addEventListener('change', function() {
                const selectedOption = clientSelect.options[clientSelect.selectedIndex];

                // Si no hay selección válida, limpiar todo
                if (!selectedOption.value) {
                    mobileInput.value = '';
                    addressInput.value = '';
                    branchSelect.value = '';
                    receiverSelect.innerHTML = '<option value="">Select Receiver</option>';
                    receiverMobile.value = '';
                    receiverAddress.value = '';
                    return;
                }

                // Obtener datos del cliente desde los atributos del <option>
                const mobile = selectedOption.getAttribute('data-mobile') || '';
                const address = selectedOption.getAttribute('data-address') || '';
                const branchId = selectedOption.getAttribute('data-branch') || '';

                // Asignar valores a los campos
                mobileInput.value = mobile;
                addressInput.value = address;

                if (branchId) {
                    branchSelect.value = branchId; // Seleccionar la opción que coincide con branchId
                    $('#to_branch_id').trigger('change');
                } else {
                    branchSelect.value = ''; // Restablecer a la opción predeterminada si no hay branchId
                    $('#to_branch_id').trigger('change');
                }
            });
        });
    </script>
    <script>
        /*document.addEventListener('DOMContentLoaded', function() {
                                const shippingDateInput = document.getElementById('shipping_date');

                                if (!shippingDateInput.value) {
                                    // Obtener la fecha actual en formato YYYY-MM-DD
                                    const today = new Date();
                                    const year = today.getFullYear();
                                    const month = String(today.getMonth() + 1).padStart(2, '0'); // Mes en formato 2 dígitos
                                    const day = String(today.getDate()).padStart(2, '0'); // Día en formato 2 dígitos

                                    // Establecer el valor del campo con la fecha actual
                                    shippingDateInput.value = `${year}-${month}-${day}`;
                                }
                            });*/
    </script>
    <script>
        document.getElementById('addPackageBtn').addEventListener('click', function() {
            const container = document.getElementById('packagesContainer');
            //const lastIndex = container.querySelectorAll('.package-item').length;
            const newPackage = container.firstElementChild.cloneNode(true);
            const packageItems = container.querySelectorAll('.package-item');
            // Obtener los valores de data-index de los paquetes existentes
            const indices = Array.from(packageItems).map(item => {
                return parseInt(item.getAttribute('data-index'), 10);
            });

            // Calcular el nuevo índice
            const ultimoIndex = indices.length > 0 ? Math.max(...indices) : -1;
            const lastIndex = ultimoIndex + 1;


            // Actualiza los atributos de los campos en el nuevo paquete
            newPackage.dataset.index = lastIndex;
            newPackage.querySelectorAll('input, select').forEach(input => {
                const name = input.name.replace(/\[\d+\]/, `[${lastIndex}]`);
                input.name = name;
                input.id = name.replace(/\\/g, '_');
                input.value = ''; // Limpia los valores
            });

            // Crear el botón de eliminación dinámicamente
            const removeButton = document.createElement('button');
            removeButton.type = 'button';
            removeButton.className = 'btn btn-danger btn-sm remove-package';
            removeButton.textContent = 'Remove';
            removeButton.setAttribute('data-index', lastIndex);

            // Añadir el botón al paquete
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
@endpush
