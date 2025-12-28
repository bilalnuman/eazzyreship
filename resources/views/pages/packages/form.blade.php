<div class="form-group">
    <label for="name">Package Name</label>
    <input type="text" name="name" id="name" class="form-control @error('name') is-invalid @enderror" value="{{ old('name', $package->name ?? '') }}" required>
    @error('name')
        <span class="invalid-feedback">{{ $message }}</span>
    @enderror
</div>

<div class="form-group">
    <label for="cost">Cost</label>
    <input type="number" name="cost" id="cost" class="form-control @error('cost') is-invalid @enderror" value="{{ old('cost', $package->cost ?? 1) }}" step="0.10" required>
    @error('cost')
        <span class="invalid-feedback">{{ $message }}</span>
    @enderror
</div>
