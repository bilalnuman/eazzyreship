<style>
    #shipments-tracking {
        max-width: 600px;
        margin: 100px auto;

        background: #ffffff;
        border-radius: 15px;
        box-shadow: 4px 4px 4px 5px rgba(0, 0, 0, 0.1);
        padding: 30px;
    }
    .tracking-error p {
        color: #dc3545;
        font-weight: bold;
    }
    .bdaia-mc4wp-form-icon {
        text-align: center;
        margin-bottom: 20px;
    }
    .bdaia-mc4wp-form-icon span svg {
        color: #0dcaf0;
    }
    h2, p.bdaia-mc4wp-bform-p, p.bdaia-mc4wp-bform-p2 {
        text-align: center;
        color: #007b8f;
    }
    .mc4wp-form-fields label {
        font-weight: bold;
        color: #0dcaf0;
    }
    .mc4wp-form-fields input[type="text"] {
        border: 1px solid #0dcaf0;
        border-radius: 5px;
        padding: 10px;
        width: 100%;
        font-size: 16px;
        color: #333;
        margin-bottom: 20px;
    }
    .mc4wp-form-fields input[type="submit"] {
        background-color: #0dcaf0;
        border: none;
        color: #fff;
        padding: 10px 20px;
        font-size: 16px;
        font-weight: bold;
        border-radius: 5px;
        cursor: pointer;
        width: 100%;
    }
    .mc4wp-form-fields input[type="submit"]:hover {
        background-color: #007b8f;
    }
</style>
<section>
    <div id="shipments-tracking">
        <div class="tracking-error">
            <p>
                {{ $error ?? '' }}
            </p>
        </div>

        <div class="bdaia-mc4wp-form-icon">
            <span>
                <svg style="width:auto" height="58px" viewBox="0 0 128 128" xmlns="http://www.w3.org/2000/svg">
                    <path fill="currentColor" d="..."></path>
                </svg>
            </span>
        </div>

        <h2>{{ __('Tracking Shipment') }}</h2>
        <p class="bdaia-mc4wp-bform-p2">
            {{ __('enter your tracking code') }}
        </p>

        <form class="form" onsubmit="return redirectWithId()" method="GET">
            <div class="mc4wp-form-fields">
                <p>
                    <label>
                        {{ __('enter your tracking code') }}
                    </label>
                    <input type="text" id="tracking_id" name="tracking_id" placeholder="{{__('example: VM200001')}}">
                </p>
                <p>
                    <input type="submit" class="btn btn-submit submit" value="{{__('search')}}">
                </p>
            </div>
        </form>
    </div>
    
    <script>
        function redirectWithId() {
            const id = document.getElementById('tracking_id').value;
            if (!id) {
                alert('Please enter a tracking ID');
                return false;
            }
            // Redirigir a la URL con el ID
            window.location.href = `{{ url('tracking/view') }}/${id}`;
            return false; // Evita el envío del formulario
        }
    </script>
</section>