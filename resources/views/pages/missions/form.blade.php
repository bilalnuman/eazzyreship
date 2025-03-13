<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label for="type">Type</label>
            <select name="type" id="type" class="form-control">
                <option value="1" {{ old('type', $mission->type ?? '') == '1' ? 'selected' : '' }}>Air</option>
                <option value="2" {{ old('type', $mission->type ?? '') == '2' ? 'selected' : '' }}>Ocean</option>
            </select>
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label for="due_date">Due Date</label>
            <input type="date" name="due_date" id="due_date" class="form-control"
                value="{{ old('due_date', $mission->due_date ?? '') }}">
        </div>
    </div>
</div>

<div class="form-group">
    <label for="from_branch_id">From Branch</label>
    <select name="from_branch_id" id="from_branch_id" class="form-control">
        <option value="">-- Select Branch --</option>
        @foreach ($branches0 as $branch)
            <option value="{{ $branch->id }}"
                {{ old('from_branch_id', $mission->from_branch_id ?? '') == $branch->id ? 'selected' : '' }}>
                {{ $branch->name }}</option>
        @endforeach
    </select>
</div>

<div class="form-group">
    <label for="to_branch_id">To Branch</label>
    <select name="to_branch_id" id="to_branch_id" class="form-control">
        <option value="">-- Select Branch --</option>
        @foreach ($branches as $branch)
            <option value="{{ $branch->id }}"
                {{ old('to_branch_id', $mission->to_branch_id ?? '') == $branch->id ? 'selected' : '' }}>
                {{ $branch->name }}</option>
        @endforeach
    </select>
</div>

<input type="hidden" name="user_id" id="user_id" class="form-control" value="{{ auth()->id() }}">
