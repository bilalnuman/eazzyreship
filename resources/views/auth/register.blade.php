<x-guest-layout>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>

    <form method="POST" action="{{ route('register') }}">
        @csrf
        <!-- Name -->
        <div>
            <x-input-label for="name" :value="__('Name')" />
            <x-text-input id="name" class="block mt-1 w-full" type="text" name="name" :value="old('name')" required
                autofocus autocomplete="name" />
            <x-input-error :messages="$errors->get('name')" class="mt-2" />
        </div>

        <!-- Email Address -->
        <div class="mt-4">
            <x-input-label for="email" :value="__('Email')" />
            <x-text-input id="email" class="block mt-1 w-full" type="email" name="email" :value="old('email')"
                required autocomplete="username" />
            <x-input-error :messages="$errors->get('email')" class="mt-2" />
        </div>

        <!-- Password -->
        <div class="mt-4">
            <x-input-label for="password" :value="__('Password')" />

            <x-text-input id="password" class="block mt-1 w-full" type="password" name="password" required
                autocomplete="new-password" />

            <x-input-error :messages="$errors->get('password')" class="mt-2" />
        </div>

        <!-- Confirm Password -->
        <div class="mt-4">
            <x-input-label for="password_confirmation" :value="__('Confirm Password')" />

            <x-text-input id="password_confirmation" class="block mt-1 w-full" type="password"
                name="password_confirmation" required autocomplete="new-password" />

            <x-input-error :messages="$errors->get('password_confirmation')" class="mt-2" />
        </div>

        <!-- Phone -->
        <div class="mt-4">
            <x-input-label for="mobile" :value="__('mobile')" />
            <x-text-input id="mobile" class="block mt-1 w-full" type="text" name="mobile" :value="old('mobile')"/>
            <x-input-error :messages="$errors->get('mobile')" class="mt-2" />

        </div>

        <!-- Country -->
        <div class="mt-4">
            <x-input-label for="branch_id" :value="__('Branch')" />
            <select name="branch_id" id="branch_id"
                class="block mt-1 w-full border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 rounded-md shadow-sm"
                required>
                <option value="" disabled selected>{{ __('Select your country(pick-up only)') }}</option>
                @foreach ($branches as $branch)
                    <option value="{{ $branch->id }}"
                        {{ old('branch_id', $selectedBranchId ?? '') == $branch->id ? 'selected' : '' }}
                        branch-code="{{ $branch->country->iso2 }}">
                        {{ $branch->name }}
                    </option>
                @endforeach
            </select>
            <x-input-error :messages="$errors->get('branch_id')" class="mt-2" />
            <input type="hidden" name="branch_code" id="branch_code">
        </div>
        <br>

        <div class="mt-4">
            <label class="form-check form-check-custom form-check-solid form-check-inline">
                <input class="form-check-input" type="checkbox" name="tnc" id="tnc" value="1" required />
                <span class="form-check-label fw-bold text-gray-700 fs-6">
                    {!! __('I Agree to the') !!} 
                    <a href="{{ route('dashboard') }}" target="_blank" class="ms-1 link-primary">{{ __('Terms and Conditions') }}</a>.
                </span>
            </label>
        </div>        

        <div class="flex items-center justify-end mt-4">
            <a class="underline text-sm text-gray-600 hover:text-gray-900 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                href="{{ route('login') }}">
                {{ __('Already registered?') }}
            </a>

            <x-primary-button class="ms-4">
                {{ __('Register') }}
            </x-primary-button>
        </div>
    </form>


    <script>
        document.getElementById('branch_id').addEventListener('change', function() {
            var selectedOption = this.options[this.selectedIndex];
            var branchCode = selectedOption.getAttribute('branch-code');
            document.getElementById('branch_code').value = branchCode;
        });
        // Opcional: Ejecutar al cargar si hay una selección previa
        document.addEventListener('DOMContentLoaded', function() {
            const selectElement = document.getElementById('branch_id');
            if (selectElement) {
                const selectedOption = selectElement.options[selectElement.selectedIndex];
                if (selectedOption) {
                    branchCode = selectedOption.getAttribute('branch-code');
                    document.getElementById('branch_code').value = branchCode; // Asignar al campo oculto
                }
            }
        });
        //Inicializar el plugin intl-tel-input
        const input = document.querySelector("#mobile");

        window.intlTelInput(input, {
            initialCountry: "sx", // Configurar manualmente el país predeterminado (ejemplo: Estados Unidos)
            onlyCountries: ["sx", "mf", "ai", "kn", "bl"], // Opcional: Países preferidos en la lista
            separateDialCode: false,
            nationalMode: false,
            utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.19/js/utils.js" // Para formateo adicional
        });
    </script>
    <style>
        /*para poner full ancho la caja de telefono intenacional*/
        .iti {
            width: 100%;
        }
    
        .iti__flag-container {
            height: 100%;
        }
    </style>
</x-guest-layout>
