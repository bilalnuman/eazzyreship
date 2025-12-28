<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" name="name" id="name" class="form-control"
                value="{{ old('name', $client->name ?? '') }}" @if (auth()->user()->hasRole('user')) readonly @endif>
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" name="email" id="email" class="form-control"
                value="{{ old('email', $client->email ?? '') }}" @if (auth()->user()->hasRole('user')) readonly @endif>
        </div>

    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label for="mobile">Mobile</label>
            <input type="text" name="mobile" id="mobile" class="form-control"
                value="{{ old('mobile', $client->mobile ?? '') }}">
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label for="branch_id">Branch</label>
            <select name="branch_id" id="branch_id" class="form-control @error('branch_id') is-invalid @enderror"
                required>
                <option value="">Select a branch</option>
                @foreach ($branches as $branch)
                    <option value="{{ $branch->id }}"
                        {{ old('branch_id', $client->branch_id ?? '') == $branch->id ? 'selected' : '' }}
                        branch-code="{{ $branch->country->iso2 }}">
                        {{ $branch->name }}
                    </option>
                @endforeach
            </select>
            @if (auth()->user()->hasRole('user'))
                <span>This field will not be updated.</span>
            @endif
            @error('branch_id')
                <span class="invalid-feedback">{{ $message }}</span>
            @enderror
            <input type="hidden" name="branch_code" id="branch_code">
        </div>
    </div>

    <div class="col-md-6">
        <div class="form-group">
            <label for="national_id">National ID / Passport / Drivers license</label>
            <input type="text" name="national_id" id="national_id" class="form-control"
                value="{{ old('national_id', $client->national_id ?? '') }}">
        </div>
    </div>

    <div class="col-md-3">
        <div class="form-group">
            <div class="form-group md-3">
                <label for="picture">Attach Document</label>
                <input type="file" name="picture" id="picture" class="form-control" accept=".jpg,.jpeg,.png,.pdf">
            </div>
        </div>
        @error('picture')
            <span class="invalid-feedback">{{ $message }}</span>
        @enderror
    </div>

    <div class="col-md-3">
        <div class="form-group">

            @if (isset($client->picture))
            <p>Attached File:</p>
            @if (Str::endsWith($client->picture, ['.jpg', '.jpeg', '.png', '.pdf']))
                <img src="{{ Storage::disk('s3')->url($client->picture) }}" alt="Attachment" style="max-width: 200px;">
            @elseif (Str::endsWith($client->picture, ['.pdf']))
                <a href="{{ Storage::disk('s3')->url($client->picture) }}" target="_blank">View PDF</a>
            @endif
        @endif
        </div>
    </div>

</div>

<h4>Address</h4>
<hr>
<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label for="country_id">Country</label>
            <select name="addresses[0][country_id]" id="addresses[0][country_id]" class="form-control" required>
                <option value="">Select Country</option>
                @foreach ($countries as $id => $name)
                    <option value="{{ $id }}"
                        {{ old('addresses.0.country_id', $client->addresses[0]->country_id ?? '') == $id ? 'selected' : '' }}>
                        {{ $name }}
                    </option>
                @endforeach
            </select>
            @error('addresses[0][country_id]')
                <div class="text-danger">{{ $message }}</div>
            @enderror
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label for="state_id">State</label>
            <select name="addresses[0][state_id]" id="addresses[0][state_id]" class="form-control" required>
                <option value="">Select State</option>
                @foreach ($states as $id => $name)
                    <option value="{{ $id }}"
                        {{ old('address.0.state_id', $client->addresses[0]->state_id ?? '') == $id ? 'selected' : '' }}>
                        {{ $name }}
                    </option>
                @endforeach
            </select>
            @error('addresses[0][state_id]')
                <div class="text-danger">{{ $message }}</div>
            @enderror
        </div>
    </div>
</div>

<div class="form-group">
    <label for="address">Address</label>
    <textarea name="addresses[0][address]" id="addresses[0][address]" class="form-control">{{ old('addresses.0.address', $client->addresses[0]->address ?? '') }}</textarea>
</div>

@push('js')
    <script>
        document.getElementById('branch_id').addEventListener('change', function() {
            var selectedOption = this.options[this.selectedIndex];
            var branchCode = selectedOption.getAttribute('branch-code');
            document.getElementById('branch_code').value = branchCode;

            document.addEventListener('DOMContentLoaded', function() {
                const selectElement = document.getElementById('branch_id');
                if (selectElement) {
                    const selectedOption = selectElement.options[selectElement.selectedIndex];
                    if (selectedOption) {
                        branchCode = selectedOption.getAttribute('branch-code');
                        document.getElementById('branch_code').value =
                            branchCode; // Asignar al campo oculto
                    }
                }
            });
        });
    </script>
    <script>
        $(document).ready(function() {
            $('select[name="addresses[0][country_id]"]').on('change', function() {
                let countryId = $(this).val();
                let stateSelect = $('select[name="addresses[0][state_id]"]');

                // Limpia los estados actuales
                stateSelect.empty();
                stateSelect.append('<option value="">Select State</option>');

                if (countryId) {
                    $.ajax({
                        url: `/states/${countryId}`,
                        type: 'GET',
                        success: function(data) {
                            $.each(data, function(id, name) {
                                stateSelect.append(
                                    `<option value="${id}">${name}</option>`);
                            });
                        },
                        error: function() {
                            alert('Error fetching states');
                        }
                    });
                }
            });
        });
    </script>
    <script>
        //Inicializar el plugin intl-tel-input
        const input = document.querySelector("#mobile");

        window.intlTelInput(input, {
            initialCountry: "sx", // Configurar manualmente el país predeterminado (ejemplo: Estados Unidos)
            onlyCountries: ["sx", "mf", "ai", "kn", "bl", "us"], // Opcional: Países preferidos en la lista
            separateDialCode: false,
            nationalMode: false,
            utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.19/js/utils.js" // Para formateo adicional
        });
    </script>
    
@endpush
