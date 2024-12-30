<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" name="name" id="name" class="form-control"
                value="{{ old('name', $branch->name ?? '') }}" required maxlength="255">
            @error('name')
                <div class="text-danger">{{ $message }}</div>
            @enderror
        </div>
    </div>
    <div class="col-md-6">
        <label for="responsible_mobile">Mobile</label>
        <div class="form-group">
            <input type="tel" name="responsible_mobile" id="responsible_mobile" class="form-control"
                value="{{ old('responsible_mobile', $branch->responsible_mobile ?? '') }}">
        </div>
    </div>
</div>
<div class="row">

    <div class="col-md-6">
        <div class="form-group">
            <label for="country_id">Country</label>
            <select name="country_id" id="country_id" class="form-control" required>
                <option value="">Select Country</option>
                @foreach ($countries as $id => $name)
                    <option value="{{ $id }}"
                        {{ old('country_id', $branch->country_id ?? '') == $id ? 'selected' : '' }}>
                        {{ $name }}
                    </option>
                @endforeach
            </select>
            @error('country_id')
                <div class="text-danger">{{ $message }}</div>
            @enderror
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label for="state_id">State</label>
            <select name="state_id" id="state_id" class="form-control" required>
                <option value="">Select State</option>
                @foreach ($states as $id => $name)
                    <option value="{{ $id }}"
                        {{ old('state_id', $branch->state_id ?? '') == $id ? 'selected' : '' }}>
                        {{ $name }}
                    </option>
                @endforeach
            </select>
            @error('state_id')
                <div class="text-danger">{{ $message }}</div>
            @enderror
        </div>
    </div>
</div>

<div class="form-group">
    <label for="email">Email</label>
    <input type="email" name="email" id="email" class="form-control"
        value="{{ old('email', $branch->email ?? '') }}" required maxlength="255">
    @error('email')
        <div class="text-danger">{{ $message }}</div>
    @enderror
</div>

<div class="form-group">
    <label for="address">Address</label>
    <input type="text" name="address" id="address" class="form-control"
        value="{{ old('address', $branch->address ?? '') }}" required maxlength="255">
    @error('address')
        <div class="text-danger">{{ $message }}</div>
    @enderror
</div>

@push('js')
    <script>
        $(document).ready(function() {
            $('#country_id').on('change', function() {
                let countryId = $(this).val();
                let stateSelect = $('#state_id');

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
        const input = document.querySelector("#responsible_mobile");

        window.intlTelInput(input, {
            initialCountry: "sx", // Configurar manualmente el país predeterminado (ejemplo: Estados Unidos)
            onlyCountries: ["sx", "mf", "ai", "kn", "bl", "us"], // Opcional: Países preferidos en la lista
            separateDialCode: false,
            nationalMode: false,
            utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.19/js/utils.js" // Para formateo adicional
        });
    </script>
@endpush

