<div class="row package-item" data-index="{{ $index }}">
    <div class="col-md-3">
        <div class="form-group">
            <label for="packages[{{ $index }}][package_id]">Package Type</label>
            <select name="packages[{{ $index }}][package_id]" id="packages[{{ $index }}][package_id]"
                class="form-control">
                <option value="">Select Type</option>
                @foreach ($packages as $id => $name)
                    <option value="{{ $id }}"
                        {{ old('packages.{$index}.package_id', $package->package_id ?? '') == $id ? 'selected' : '' }}>
                        {{ $name }}
                    </option>
                @endforeach
            </select>
        </div>
    </div>

    <div class="col-md-3">
        <div class="form-group">
            <label for="packages[{{ $index }}][description]">Description</label>
            <input type="text" name="packages[{{ $index }}][description]"
                id="packages[{{ $index }}][description]" class="form-control"
                value="{{ old('packages.{$index}.description', $package->description ?? '') }}">
        </div>
    </div>

    <div class="col-md-3">
        <div class="form-group">
            <label for="packages[{{ $index }}][qty]">Quantity</label>
            <input type="number" name="packages[{{ $index }}][qty]" id="packages[{{ $index }}][qty]"
                class="form-control" step="1" min="1" value="{{ old('packages.{ $index }.qty', $package->qty ?? '') }}">
        </div>
    </div>

    <div class="col-md-3">
        <div class="form-group">
            <label for="packages[{{ $index }}][weight]">Weight</label>
            <input type="number" name="packages[{{ $index }}][weight]"
                id="packages[{{ $index }}][weight]" class="form-control weight-listener" step="0.01" min="0"
                value="{{ old('packages.{ $index }.weight', $package->weight ?? '') }}">
        </div>
    </div>

    <div class="col-md-6 package-group mb-3">
        <div class="d-flex justify-content-between">
            <div class="form-group mr-2">
                <label for="packages[{{ $index }}][length]">Length</label>
                <input type="number" name="packages[{{ $index }}][length]"
                    id="packages[{{ $index }}][length]" class="form-control" step="0.01" min="0"
                    value="{{ old('packages.{ $index }.length', $package->length ?? '') }}">
            </div>
            <div class="form-group mr-2">
                <label for="packages[{{ $index }}][width]">Width</label>
                <input type="number" name="packages[{{ $index }}][width]"
                    id="packages[{{ $index }}][width]" class="form-control" step="0.01" min="0"
                    value="{{ old('packages.{ $index }.width', $package->width ?? '') }}">
            </div>
            <div class="form-group mr-2">
                <label for="packages[{{ $index }}][height]">Height</label>
                <input type="number" name="packages[{{ $index }}][height]"
                    id="packages[{{ $index }}][height]" class="form-control" step="0.01" min="0"
                    value="{{ old('packages.{ $index }.height', $package->height ?? '') }}">
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="form-group">
            <label for="packages[{{ $index }}][notes]">Notes</label>
            <input type="text" name="packages[{{ $index }}][notes]" id="packages[{{ $index }}][notes]"
                class="form-control" value="{{ old('packages.{ $index }.notes', $package->notes ?? '') }}">
        </div>
    </div>

    <div class="col-md-3">
        <div class="form-group">
            <label for="packages[{{ $index }}][value]">Value</label>
            <input type="number" name="packages[{{ $index }}][value]"
                id="packages[{{ $index }}][value]" class="form-control weight-listener" step="0.01" min="0"
                value="{{ old('packages.{ $index }.value', $package->value ?? '') }}" required>
        </div>
    </div>

    @if ($index > 0)
        <div class="form-group mb0">

            <button type="button" class="btn btn-danger btn-sm remove-package" data-index="{{$index}}"
                style="vertical-align: bottom;">Remove</button>
        </div>
    @endif
</div>
