@push('css')
<style>
  .select2-container .select2-selection--single {
    height: calc(2.3rem + 2px);
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    line-height: 1.5;
    border: 1px solid #ced4da;
    border-radius: 0.375rem;
  }

  .select2-container--bootstrap-5 .select2-selection--multiple {
    height: auto;
    border: 1px solid #ced4da;
    border-radius: 0.375rem;
  }

  .select2-container--bootstrap-5 .select2-selection__rendered {
    padding: 0.375rem;
  }

  .select2-container--bootstrap-5 .select2-selection__arrow {
    top: 50%;
    transform: translateY(-50%);
  }

  /* Shipper docs preview */
  #shipperDocsPreview .doc-item {
    display: inline-flex;
    flex-direction: column;
    align-items: center;
    margin-right: 10px;
    margin-bottom: 10px;
  }

  #shipperDocsPreview img {
    width: 110px;
    height: 110px;
    object-fit: cover;
    border: 1px solid #ddd;
    border-radius: 6px;
  }

  #shipperDocsPreview .pdf-box {
    width: 110px;
    height: 110px;
    display: flex;
    align-items: center;
    justify-content: center;
    border: 1px solid #ddd;
    border-radius: 6px;
    font-weight: 600;
  }

  /* Desktop camera modal */
  #shipperCameraModal {
    display: none;
    position: fixed;
    inset: 0;
    background: rgba(0, 0, 0, .7);
    z-index: 9999;
    align-items: center;
    justify-content: center;
  }
</style>
@endpush

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
        <!--option value="">Select a branch</option-->
        @foreach ($branches0 as $id => $name)
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
      <label for="mission_id">Manifest</label>
      <select name="mission_id" id="mission_id" class="form-control @error('mission_id') is-invalid @enderror"
        required>
        <option value="">Select a Manifest</option>
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
  <input type="hidden"
    name="client_email"
    id="client_email"
    value="{{ old('client_email', $shipment->client->email ?? '') }}">
  <div class="col-md-6">
    <div class="form-group">
      <label for="client_id">Customer/sender</label>
      <select name="client_id" id="client_id"
        class="form-control select2 @error('client_id') is-invalid @enderror">
        <option value="">Select a client</option>

        @foreach ($clients as $client)
        <option value="{{ $client->id }}"
          {{ old('client_id', $shipment->client_id ?? '') == $client->id ? 'selected' : '' }}
          data-mobilec="{{ $client->mobile }}"
          @foreach ($client->addresses as $var)
          data-addressc="{{ $var->address }}" @endforeach
          data-branchc="{{ $client->branch_id }}"
          data-email="{{ $client->email }}"
          >
          {{ $client->name }}
        </option>
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
        value="{{ old('responsible_mobile', $shipment->client->mobile ?? '') }}" readonly>
    </div>
  </div>

  <div class="col-12">
    <div class="form-group">
      <label for="responsible_address">Customer Address</label>
      <input type="text" name="responsible_address" id="responsible_address"
        class="form-control @error('responsible_address') is-invalid @enderror"
        value="{{ old('responsible_address', $client_address->address ?? '') }}" readonly>
      @error('responsible_address')
      <span class="invalid-feedback">{{ $message }}</span>
      @enderror
    </div>
  </div>
</div>

<!--div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label for="to_branch_id">To Branch</label>
            <select name="to_branch_id" id="to_branch_id"
                class="form-control @/error('to_branch_id') is-invalid @/enderror" required>
                <option value="">Select a branch</option>
                @/foreach ($branches as $id => $name)
                    <option value="{/{ $id }}"
                        {/{ old('to_branch_id', $shipment->to_branch_id ?? '') == $id ? 'selected' : '' }} >
                        {/{ $name }}
                    </option>
                @/endforeach
            </select>
            @/error('to_branch_id')
                <span class="invalid-feedback">{/{ $message }}</span>
            @/enderror
        </div>
    </div>
</div-->

<div class="row">
  <div class="col-md-6">
    <div class="form-group">
      <label for="to_branch_id">To Branch</label>
      <select name="to_branch_id" id="to_branch_id"
        class="form-control @error('to_branch_id') is-invalid @enderror" required>
        <option value="">Select a branch</option>
        @foreach ($branches as $branch)
        <option value="{{ $branch->id }}"
          {{ old('to_branch_id', $shipment->to_branch_id ?? '') == $branch->id ? 'selected' : '' }}
          data-address="{{ $branch->address }}" data-mobile="{{ $branch->responsible_mobile }}">
          {{ $branch->name }}
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
  <!--div class="col-md-6">
        <div class="form-group">
            <label for="receiver_name">Receiver Name</label>

            <select name="receiver_name" id="receiver_name"
                class="form-control @/error('receiver_name') is-invalid @/enderror">
                <option value="">Select Receiver</option>
                @/foreach ($receivers as $receiver)
                    <option value="{/{ $receiver->id }}"
                        {/{ old('receiver_name', $shipment->receiver_name ?? '') == $receiver->id ? 'selected' : '' }}>
                        {/{ $receiver->name }}
                    </option>
                @/endforeach
            </select>

            @/error('receiver_name')
                <span class="invalid-feedback">{/{ $message }}</span>
            @/enderror
        </div>
    </div-->

  <div class="col-md-6">
    <div class="form-group">
      <label for="receiver_mobile">Branch phone</label>
      <input type="text" name="receiver_mobile" id="receiver_mobile" class="form-control"
        value="{{ old('receiver_mobile', $shipment->receiver_mobile ?? '') }}" readonly>
    </div>
  </div>

  <div class="col-md-6">
    <div class="form-group">
      <label for="receiver_address">Branch Address</label>
      <input type="text" name="receiver_address" id="receiver_address"
        class="form-control @error('receiver_address') is-invalid @enderror"
        value="{{ old('receiver_address', $shipment->receiver_address ?? '') }}" readonly>
      @error('receiver_address')
      <span class="invalid-feedback">{{ $message }}</span>
      @enderror
    </div>
  </div>
</div>

<div class="row">
  <div class="col-md-6">
    <div class="form-group">
      <label for="order_id">Order ID</label>
      <input type="text" name="order_id" id="order_id"
        class="form-control @error('order_id') is-invalid @enderror"
        value="{{ old('order_id', $shipment->order_id ?? '') }}">
      @error('order_id')
      <span class="invalid-feedback">{{ $message }}</span>
      @enderror
    </div>
  </div>

  <div class="col-md-3">
    <div class="form-group">
      <div class="form-group md-3">
        <label for="carrier">Carrier / Shipper</label>
        <input type="text" name="carrier" id="carrier" class="form-control"
          value="{{ old('carrier', $shipment->carrier ?? '') }}">
      </div>
    </div>
    @error('carrier_doc')
    <span class="invalid-feedback">{{ $message }}</span>
    @enderror
  </div>




  <div class="col-md-8">
    <div class="form-group">
      <label for="attachments_before_shipping">Shipper Document</label>

      <!-- REAL input for Laravel submit -->
      <input
        type="file"
        name="attachments_before_shipping[]"
        id="attachments_before_shipping"
        accept=".jpg,.jpeg,.png,.pdf"
        class="form-control d-none @error('attachments_before_shipping') is-invalid @enderror"
        multiple />
      <input
        type="file"
        name="capturedImages[]"
        id="capturedImages"
        accept=".jpg,.jpeg,.png,.pdf"
        class="form-control d-none @error('capturedImages') is-invalid @enderror"
        multiple />

      <div class="d-flex flex-wrap gap-2 mt-2">
        <button type="button" id="shipperTakePhotoBtn" class="btn btn-primary mr-2">
          <i class="fas fa-camera"></i> Take Photo
        </button>

        <button type="button" id="shipperAttachFilesBtn" class="btn btn-info">
          <i class="fas fa-paperclip"></i> Attach files
        </button>
      </div>

      <small class="form-text text-muted mt-2">
        You can upload .jpg, .jpeg, .png, .pdf
      </small>

      @error('attachments_before_shipping')
      <span class="invalid-feedback d-block">{{ $message }}</span>
      @enderror
    </div>

    <!-- Preview -->
    <label>Attachments </label>
    <div id="notSelected">(Attachments not selected yet)</div>
    <div id="shipperDocsPreview" class="mt-3"></div>
  </div>

  <!-- Desktop camera modal -->
  <div id="shipperCameraModal">
    <div style="background:#fff; padding:12px; border-radius:10px; width:min(92vw,520px);">
      <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:10px;">
        <strong>Camera</strong>
        <button type="button" id="shipperCloseCameraBtn" class="btn btn-secondary">Close camera</button>
      </div>

      <video id="shipperCameraVideo" autoplay playsinline style="width:100%; border-radius:10px;"></video>

      <div class="mt-2 d-flex gap-2">
        <button type="button" id="shipperCaptureBtn" class="btn btn-primary mr-2">Capture</button>
        <button type="button" id="shipperSwitchBtn" class="btn btn-outline-primary">Switch camera</button>
      </div>
    </div>
  </div>


  @if (isset($shipment->attachments) && $shipment->attachments->isNotEmpty())
  <h3>Attached files:</h3>
  <div class="container">
    <div class="row">
      @foreach ($shipment->attachments as $attachment)
      <div class="col-6 col-sm-4 col-md-2 text-center mb-4">
        @if (Str::endsWith($attachment->file_path, ['.jpg', '.jpeg', '.png']))
        <img src="{{ Storage::disk('s3')->url($attachment->file_path) }}"
          alt="Attachment"
          class="img-fluid" style="max-width: 100px;">
        @elseif (Str::endsWith($attachment->file_path, ['.pdf']))
        <a href="{{ Storage::disk('s3')->url($attachment->file_path) }}"
          target="_blank" class="d-block">View PDF</a>
        @endif
        <a href="#" class="btn btn-warning btn-sm remove-attachment mt-2"
          data-id="{{ $attachment->id }}">
          <i class="fas fa-trash"></i>
        </a>
      </div>
      @endforeach
    </div>
  </div>
  @endif
</div>
<hr><br>

<div class="row" id="packagesContainer">
  @if (isset($package_shipments) && count($package_shipments) > 0)
  <!-- Loop to show existing packages when editing -->
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
  <div class="col-md-4">
    <div class="form-group">
      <label for="tax">Tax & Duty (%):</label>
      <input type="number" name="tax" id="tax" class="form-control" step="0.01" min="0"
        value="{{ old('tax', $shipment->tax ?? '0.00') }}">
    </div>
  </div>
  <div class="col-md-4">
    <div class="form-group">
      <label for="insurance">Insurance (%)</label>
      <input type="number" name="insurance" id="insurance" class="form-control" step="0.01"
        min="0" value="{{ old('insurance', $shipment->insurance ?? '0.00') }}">
    </div>
  </div>
  <div class="col-md-4">
    <div class="form-group">
      <label for="discount">Discount (%)</label>
      <input type="number" name="discount" id="discount" class="form-control" step="0.01"
        min="0" value="{{ old('discount', $shipment->discount ?? '0.00') }}">
    </div>
  </div>

  <div class="col-md-3">
    <div class="form-group">
      <label for="hazmat">Hazmat</label>
      <input type="number" name="hazmat"
        id="hazmat" class="form-control" step="0.01" min="0" value="{{ old('hazmat', $shipment->hazmat?? '0') }}">
    </div>
  </div>

  <div class="col-md-3">
    <div class="form-group">
      <label for="imo">Imo</label>
      <input type="number" name="imo" id="imo"
        class="form-control" step="0.01" min="0" value="{{ old('imo', $shipment->imo ?? '0') }}">
    </div>
  </div>

  <div class="col-md-3">
    <div class="form-group">
      <label for="handling">Handling</label>
      <input type="number" name="handling"
        id="handling" class="form-control" step="0.01" min="0"
        value="{{ old('handling', $shipment->handling ?? '0') }}">
    </div>
  </div>

  <div class="col-md-3">
    <div class="form-group">
      <label for="sed">Sed</label>
      <input type="number" name="sed"
        id="sed" class="form-control" step="0.01" min="0"
        value="{{ old('sed', $shipment->sed ?? '0') }}">
    </div>
  </div>

  <div class="col-md-6">
    <div class="form-group">
      <label for="shipping_cost">Shipping Cost:</label>
      <input type="number" name="shipping_cost" id="shipping_cost" class="form-control" step="0.01"
        min="0" value="{{ old('shipping_cost', $shipment->shipping_cost ?? '0.00') }}">
    </div>
  </div>
  <div class="col-md-6">
    <div class="form-group">
      <label for="return_cost">Delivery Cost:</label>
      <input type="number" name="return_cost" id="return_cost" class="form-control" step="0.01"
        min="0" value="{{ old('return_cost', $shipment->return_cost ?? '0.00') }}">
    </div>
  </div>
</div>

<hr><br>

<div class="row">
  <div class="col-md-6">
    <div class="form-group">
      <label for="amount_to_be_collected">Amount to be Collected</label>
      <input type="number" name="amount_to_be_collected" id="amount_to_be_collected" class="form-control"
        step="0.01" min="0.00"
        value="{{ old('amount_to_be_collected', $shipment->amount_to_be_collected ?? '0.00') }}">
    </div>
  </div>
  <div class="col-md-6">
    <div class="form-group">
      <label for="total_weight">Total Weight</label>
      <input type="number" name="total_weight" id="total_weight" class="form-control" step="0.01"
        min="0.0" value="{{ old('total_weight', $shipment->total_weight ?? '0.00') }}">
      @if(!empty($shipment->total_volumetric))
      <span>
        Total volumetric:
        {{ old('total_weight', number_format($shipment->total_volumetric, 2)) }}
      </span>
      @endif



      <span id="volumetric_weight" class="d-none"></span>
    </div>
  </div>
</div>
<hr><br>

@push('js')
@push('js')
<script>
  (function($) {
    'use strict';

    // -----------------------------
    // Helpers
    // -----------------------------
    function roundUpToNearestTenth(value) {
      return Math.ceil(value * 10) / 10;
    }

    function normalizeIdFromName(name) {
      return name
        .replace(/\[|\]/g, '_')
        .replace(/__+/g, '_')
        .replace(/[^A-Za-z0-9_:-]/g, '_');
    }

    function isMobile() {
      return /Android|iPhone|iPad|iPod/i.test(navigator.userAgent);
    }

    // -----------------------------
    // Weight + Cost Calc
    // -----------------------------
    function calcTotalWeight() {
      var $packageItems = $('.package-item');

      var totalVolumetricWeight = 0;
      var sumWeight = 0;
      var sumValue = 0;

      $packageItems.each(function() {
        var $row = $(this);

        var qty = parseInt($row.find('input[name*="[qty]"]').val(), 10) || 1;
        var weight = parseFloat($row.find('input[name*="[weight]"]').val()) || 0;
        var length = parseFloat($row.find('input[name*="[length]"]').val()) || 0;
        var width = parseFloat($row.find('input[name*="[width]"]').val()) || 0;
        var height = parseFloat($row.find('input[name*="[height]"]').val()) || 0;
        var value = parseFloat($row.find('input[name*="[value]"]').val()) || 0;

        var volumetricWeight = (length * width * height) / 139;

        totalVolumetricWeight += volumetricWeight * qty;
        sumWeight += weight * qty;
        sumValue += value * qty;
      });

      $('#volumetric_weight').text('volumetric weight: ' + totalVolumetricWeight.toFixed(2)).removeClass("d-none");
      $('#total_weight').val(sumWeight.toFixed(2));



      var shipmentType = $('input[name="type"]:checked').val();
      var totalCost = 0;

      if (shipmentType === '1') {
        totalCost = Math.max(sumWeight, totalVolumetricWeight) * 5; // Air
      } else if (shipmentType === '2') {
        var weightToUse = Math.max(4, totalVolumetricWeight); // Sea

        if (weightToUse <= 12) {
          totalCost = (weightToUse / 4) * 4;
        } else {
          totalCost = (12 / 4) * 4 + (weightToUse - 12) * 0.5;
        }
      }

      totalCost = roundUpToNearestTenth(totalCost);
      $('#shipping_cost').val(totalCost.toFixed(2));

      var tax = parseFloat($('#tax').val()) || 0;
      var insurance = parseFloat($('#insurance').val()) || 0;
      var discount = parseFloat($('#discount').val()) || 0;
      var hazmat = parseFloat($('#hazmat').val()) || 0;
      var imo = parseFloat($('#imo').val()) || 0;
      var handling = parseFloat($('#handling').val()) || 0;
      var sed = parseFloat($('#sed').val()) || 0;
      var returnc = parseFloat($('#return_cost').val()) || 0;
      var shipping = parseFloat($('#shipping_cost').val()) || 0;

      var discountedShipping = shipping - (shipping * (discount / 100));

      var totalCollected =
        (sumValue * (tax / 100)) +
        (sumValue * (insurance / 100)) +
        returnc +
        discountedShipping +
        hazmat + imo + handling + sed;

      $('#amount_to_be_collected').val(totalCollected.toFixed(2));
      $("#volumetric_weight").append(`<input type='hidden' class='d-none' name="total_volumetric" value=${totalVolumetricWeight.toFixed(2)}>`)
    }

    // Allow calling from inline if needed
    window.calcTotalWeight = calcTotalWeight;

    // -----------------------------
    // Main
    // -----------------------------
    $(function() {

      // -----------------------------
      // Select2
      // -----------------------------
      if ($.fn.select2) {
        // init all select2 once
        $('.select2').each(function() {
          var $el = $(this);
          if ($el.data('select2')) return;

          // default init
          $el.select2({
            width: '100%'
          });
        });

        // customize client select
        if ($('#client_id').length && !$('#client_id').data('select2')) {
          $('#client_id').select2({
            placeholder: "Select customer",
            allowClear: true,
            width: '100%'
          });
        } else if ($('#client_id').length) {
          // if already inited, just update placeholder if you want:
          // (select2 doesn't easily update placeholder after init; ignoring safely)
        }
      }

      // customer change fill
      $('#client_id').on('change', function() {
        var $opt = $(this).find(':selected');
        $('#responsible_mobile').val($opt.data('mobilec') || '');
        $('#responsible_address').val($opt.data('addressc') || '');
        $('#client_email').val($opt.data('email') || '');
      }).trigger('change');

      // branch change fill
      $('#to_branch_id').on('change', function() {
        var $opt = $(this).find(':selected');
        $('#receiver_mobile').val($opt.data('mobile') || '');
        $('#receiver_address').val($opt.data('address') || '');
      }).trigger('change');


      // -----------------------------
      // intl-tel-input
      // -----------------------------
      ['#receiver_mobile', '#responsible_mobile'].forEach(function(sel) {
        var el = document.querySelector(sel);
        if (!el || !window.intlTelInput) return;

        window.intlTelInput(el, {
          initialCountry: "sx",
          onlyCountries: ["sx", "mf", "ai", "kn", "bl", "us"],
          separateDialCode: false,
          nationalMode: false,
          utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.19/js/utils.js"
        });
      });


      // -----------------------------
      // Packages add/remove
      // -----------------------------
      var $container = $('#packagesContainer');

      function nextPackageIndex() {
        var max = -1;
        $container.find('.package-item').each(function() {
          var idx = parseInt($(this).attr('data-index'), 10);
          if (!isNaN(idx)) max = Math.max(max, idx);
        });
        return max + 1;
      }

      $('#addPackageBtn').on('click', function() {
        if (!$container.length) return;

        var newIndex = nextPackageIndex();
        var $template = $container.find('.package-item').first().clone(false);

        // remove old remove btn if present
        $template.find('.remove-package').closest('.form-group').remove();

        // remove select2 generated UI if any
        $template.find('.select2-container').remove();

        $template.attr('data-index', newIndex);

        $template.find('input, select, textarea').each(function() {
          var $field = $(this);
          var name = $field.attr('name');

          if (name) {
            name = name.replace(/\[\d+\]/, '[' + newIndex + ']');
            $field.attr('name', name);
            $field.attr('id', normalizeIdFromName(name));
          }

          if ($field.is(':checkbox,:radio')) {
            $field.prop('checked', false);
          } else {
            $field.val('');
          }
        });

        // add remove button
        $template.append(
          $('<div/>', {
            class: 'form-group mb0'
          }).append(
            $('<button/>', {
              type: 'button',
              class: 'btn btn-danger btn-sm remove-package',
              'data-index': newIndex,
              text: 'Remove'
            })
          )
        );

        $container.append($template);
        calcTotalWeight();
      });

      $container.on('click', '.remove-package', function() {
        var idx = $(this).data('index');
        $container.find('.package-item[data-index="' + idx + '"]').remove();
        calcTotalWeight();
      });

      // auto recalc
      $(document).on(
        'input change',
        '.package-item input, .package-item select, input[name="type"], #tax,#insurance,#discount,#hazmat,#imo,#handling,#sed,#return_cost',
        function() {
          calcTotalWeight();
        }
      );


      // -----------------------------
      // Shipper Docs + Take Photo (MULTIPLE) -> capturedImages[]
      // -----------------------------
      var $form = $('#shipmentForm');
      if (!$form.length) $form = $('form').first();

      var $attachInput = $('#attachments_before_shipping'); // attach files stored here
      var $capturedInput = $('#capturedImages'); // take photo stored here

      var $takePhotoBtn = $('#shipperTakePhotoBtn');
      var $attachBtn = $('#shipperAttachFilesBtn');

      var $preview = $('#shipperDocsPreview');
      var $notSelected = $('#notSelected');

      var $modal = $('#shipperCameraModal');
      var videoEl = $('#shipperCameraVideo').get(0);

      // store files here
      var shipperDocs = []; // attached (files)
      var capturedPhotos = []; // taken (photos)

      // camera state
      var stream = null;
      var facingMode = 'environment';

      function syncFileInput($input, filesArr) {
        if (!$input.length) return;
        var dt = new DataTransfer();
        filesArr.forEach(function(f) {
          dt.items.add(f);
        });
        $input.get(0).files = dt.files;
      }

      function syncAllInputs() {
        syncFileInput($attachInput, shipperDocs);
        syncFileInput($capturedInput, capturedPhotos);
      }

      function toggleNotSelected() {
        if (!$notSelected.length) return;
        $notSelected.toggle((shipperDocs.length + capturedPhotos.length) === 0);
      }

      function renderPreview() {
        if (!$preview.length) return;

        $preview.empty();

        // merge for UI
        var all = [];
        shipperDocs.forEach(function(file, idx) {
          all.push({
            file: file,
            idx: idx,
            kind: 'attach'
          });
        });
        capturedPhotos.forEach(function(file, idx) {
          all.push({
            file: file,
            idx: idx,
            kind: 'photo'
          });
        });

        all.forEach(function(item) {
          var file = item.file;

          var $wrap = $('<div/>', {
            class: 'doc-item'
          });

          // small label (optional)
          $wrap.append(
            $('<small/>', {
              text: (item.kind === 'photo' ? 'Photo' : 'File')
            })
          );

          if (file.type && file.type.indexOf('image/') === 0) {
            var url = URL.createObjectURL(file);
            var $img = $('<img/>', {
              src: url
            });
            $img.on('load', function() {
              URL.revokeObjectURL(url);
            });
            $wrap.append($img);

          } else if (file.type === 'application/pdf') {
            $wrap.append($('<div/>', {
              class: 'pdf-box',
              text: 'PDF'
            }));

          } else {
            $wrap.append($('<div/>', {
              text: file.name || 'File',
              css: {
                width: '110px',
                wordBreak: 'break-word'
              }
            }));
          }

          // remove
          $wrap.append(
            $('<button/>', {
              type: 'button',
              class: 'btn btn-sm btn-warning mt-2',
              html: '<i class="fas fa-trash"></i>'
            }).on('click', function() {
              if (item.kind === 'photo') capturedPhotos.splice(item.idx, 1);
              else shipperDocs.splice(item.idx, 1);

              syncAllInputs();
              renderPreview();
            })
          );

          $preview.append($wrap);
        });

        toggleNotSelected();
      }

      function addFiles(files, target) {
        (files || []).forEach(function(f) {
          if (target === 'photo') capturedPhotos.push(f);
          else shipperDocs.push(f);
        });

        syncAllInputs();
        renderPreview();
      }

      // open temp input (mobile camera / file picker)
      function openNativeInput(opts) {
        var capture = !!opts.capture;
        var multiple = !!opts.multiple;
        var target = opts.target; // 'photo' or 'attach'

        var $temp = $('<input/>', {
          type: 'file',
          multiple: multiple
        });

        if (capture) {
          $temp.attr('accept', 'image/*').attr('capture', 'environment');
        } else {
          $temp.attr('accept', '.jpg,.jpeg,.png,.pdf');
        }

        $('body').append($temp);

        $temp.on('change', function(e) {
          var files = Array.from(e.target.files || []);
          if (files.length) addFiles(files, target);
          $temp.remove();
        });

        $temp.trigger('click');
      }

      function openModal() {
        $modal.css('display', 'flex');
      }

      async function stopCamera() {
        if (stream) {
          stream.getTracks().forEach(function(t) {
            t.stop();
          });
          stream = null;
        }
        if (videoEl) videoEl.srcObject = null;
      }

      async function startCamera() {
        await stopCamera();

        if (!navigator.mediaDevices || !navigator.mediaDevices.getUserMedia) {
          throw new Error('Camera not supported.');
        }

        stream = await navigator.mediaDevices.getUserMedia({
          video: {
            facingMode: facingMode
          },
          audio: false
        });

        videoEl.srcObject = stream;
      }

      async function closeModal() {
        $modal.hide();
        await stopCamera();
      }

      async function captureToFile() {
        var canvas = document.createElement('canvas');
        var w = videoEl.videoWidth || 1280;
        var h = videoEl.videoHeight || 720;
        canvas.width = w;
        canvas.height = h;

        var ctx = canvas.getContext('2d');
        ctx.drawImage(videoEl, 0, 0, w, h);

        var blob = await new Promise(function(resolve) {
          canvas.toBlob(resolve, 'image/jpeg', 0.9);
        });

        return new File([blob], 'captured-' + Date.now() + '.jpg', {
          type: 'image/jpeg'
        });
      }

      // Take Photo -> capturedImages[]
      $takePhotoBtn.on('click', async function() {
        // mobile => native camera
        if (isMobile()) {
          openNativeInput({
            capture: true,
            multiple: true,
            target: 'photo'
          });
          return;
        }

        // desktop => modal camera
        try {
          openModal();
          await startCamera();
        } catch (e) {
          await closeModal().catch(function() {});
          // fallback to native input
          openNativeInput({
            capture: true,
            multiple: true,
            target: 'photo'
          });
        }
      });

      // Attach files -> attachments_before_shipping[]
      $attachBtn.on('click', function() {
        openNativeInput({
          capture: false,
          multiple: true,
          target: 'attach'
        });
      });

      // modal buttons
      $('#shipperCloseCameraBtn').on('click', function() {
        closeModal();
      });

      $('#shipperCaptureBtn').on('click', async function() {
        try {
          var file = await captureToFile();
          addFiles([file], 'photo'); // ✅ store to capturedImages[]
          await closeModal();
        } catch (e) {
          alert('Capture failed');
        }
      });

      $('#shipperSwitchBtn').on('click', async function() {
        facingMode = (facingMode === 'environment') ? 'user' : 'environment';
        try {
          await startCamera();
        } catch (e) {
          alert('Unable to switch camera on this device/browser.');
        }
      });

      // click outside modal closes
      $modal.on('click', function(e) {
        if (e.target === this) closeModal();
      });

      // ensure inputs are synced on submit
      if ($form.length) {
        $form.on('submit', function() {
          syncAllInputs();
        });
      }

      // initial UI
      toggleNotSelected();
      // calcTotalWeight();
    });

  })(jQuery);
</script>
@endpush

@endpush