<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label for="seller_id">Seller</label>
            <input type="text" name="seller_id" id="seller_id" class="form-control"
                value="{{ old('seller_id', $payment['seller_id'] ?? '') }}" required>
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label for="shipment_code">Shipment</label>
            <input type="text" name="shipment_code" id="shipment_code" class="form-control"
                value="{{ old('shipment_code', $payment['shipment_id'] ?? '') }}" required>

        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label for="payment_method">Payment Method</label>
            <select name="payment_method" id="payment_method" class="form-control" required>
                <option value="">Select payment method</option>
                @foreach ($methods as $id => $name)
                    <option value="{{ $name }}"
                        {{ old('payment_method', $payment['payment_method'] ?? '') == $name ? 'selected' : '' }}>
                        {{ $name }}
                    </option>
                @endforeach
            </select>
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label for="txn_code">Transaction Code</label>
            <input type="text" name="txn_code" id="txn_code" class="form-control"
                value="{{ old('txn_code', $payment['txn_code'] ?? '') }}">
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label for="payment_details">Payment Obs</label>
            <textarea name="payment_details" id="payment_details" class="form-control">{{ old('payment_details', $payment['payment_details'] ?? '') }}</textarea>
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label for="amount">Amount</label>
            <input type="number" name="amount" id="amount" class="form-control" step="0.01"
                value="{{ old('amount', $payment['amount'] ?? '') }}" required>
        </div>
    </div>
</div>
<div>
    <input type="hidden" name="payment_date" id="payment_date" value="{{ now()->format('Y-m-d H:i') }}">
    <input type="hidden" name="shipment_id" id="shipment_id" value="{{ $payment['id'] }}">
</div>
