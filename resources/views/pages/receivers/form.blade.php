<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" name="name" id="name" class="form-control"
                value="{{ old('name', $receiver->name ?? '') }}" required>
        </div>
    </div>

    <div class="col-md-6">
        <label for="receiver_mobile">Mobile</label>
        <div class="form-group">
            <input type="tel" name="receiver_mobile" id="receiver_mobile" class="form-control"
                value="{{ old('receiver_mobile', $receiver->receiver_mobile ?? '') }}" required>
        </div>
    </div>
</div>

<div class="form-group">
    <label for="branch_id">Branch</label>
    <select name="branch_id" id="branch_id" class="form-control" required>
        <option value="">Select Branch</option>
        @foreach ($branches as $branch)
            <option value="{{ $branch->id }}"
                {{ old('branch_id', $receiver->branch_id ?? '') == $branch->id ? 'selected' : '' }}>{{ $branch->name }}
            </option>
        @endforeach
    </select>
</div>
<div class="form-group">
    <label for="receiver_address">Address</label>
    <textarea name="receiver_address" id="receiver_address" class="form-control">{{ old('receiver_address', $receiver->receiver_address ?? '') }}</textarea>
</div>

@push('js')
    <script>
        //Inicializar el plugin intl-tel-input
        const input = document.querySelector("#receiver_mobile");

        window.intlTelInput(input, {
            initialCountry: "sx", // Configurar manualmente el país predeterminado (ejemplo: Estados Unidos)
            onlyCountries: ["sx", "mf", "ai", "kn", "bl", "us"], // Opcional: Países preferidos en la lista
            separateDialCode: false,
            nationalMode: false,
            utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.19/js/utils.js" // Para formateo adicional
        });
    </script>
@endpush