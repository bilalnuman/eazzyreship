@php
    use Milon\Barcode\DNS1D;
    $d = new DNS1D();
@endphp
<x-app-layout>
    @section('title', 'Shipments')

    @section('content_header')
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="font-weight-bold">Shipment | {{ $shipment['code'] }}</h1>
        </div>
    @stop

    @section('content')
        <!-- Card container -->
        <div class="card shadow-sm border-0">
            <div class="card-body">
                <!-- Shipment header -->
                <div class="row justify-content-center mb-4">
                    <div class="col-10">
                        <div class="d-flex justify-content-between flex-column flex-md-row mb-4">
                            <div>
                                <h1 class="text-dark mb-2">{{ __('Shipment: ') }}{{ $shipment['code'] }}</h1>
                                @if ($shipment['order_id'])
                                    <p class="text-muted">
                                        <strong>{{ __('Order ID') }}:</strong> {{ $shipment['order_id'] }}
                                    </p>
                                @endif
                            </div>
                        </div>

                        <!-- Barcode -->
                        <div class="d-flex justify-content-end mb-4">
                            @if ($shipment['code'])
                                <div class="barcode">
                                    {!! $d->getBarcodeHTML($shipment['code'], 'C128') !!}
                                </div>
                            @endif
                        </div>

                        <!-- From and To -->
                        <div class="d-flex justify-content-end">
                            <div class="text-right">
                                <p class="text-muted mb-1">
                                    <strong>{{ __('From') }}:</strong>
                                    {{ $shipment['from_branch_id'] ? $shipment['from_branch_id'] : 'N/A' }}
                                </p>
                                <p class="text-muted">
                                    <strong>{{ __('To') }}:</strong> {{ $shipment['receiver_address'] }}
                                </p>
                            </div>
                        </div>

                        <!-- Shipment details -->

                        <div class="row shipment-details-row">
                            <div class="col-12 col-sm-6 col-md-3">
                                <h6 class="text-dark font-weight-bold">{{ __('Client Sender') }}</h6>
                                <p class="text-muted">{{ $shipment['client_id'] ?? 'N/A' }}</p>
                            </div>
                            <div class="col-12 col-sm-6 col-md-3">
                                <h6 class="text-dark font-weight-bold">{{ __('Receiver') }}</h6>
                                <p class="text-muted">{{ $shipment['receiver_name'] ?? 'N/A' }}</p>
                            </div>
                            <div class="col-12 col-sm-6 col-md-3">
                                <h6 class="text-dark font-weight-bold">{{ __('Status') }}</h6>
                                <p class="text-muted">{{ $shipment['status_id'] ?? '-' }}</p>
                            </div>
                            <div class="col-12 col-sm-6 col-md-3">
                                <h6 class="text-dark font-weight-bold">{{ __('To be Collected') }}</h6>
                                <p class="text-muted">{{ $shipment['amount_to_be_collected'] ?? 'N/A' }}</p>
                            </div>
                        </div>

                        <!-- Additional details -->
                        <hr class="my-4">
                        <div class="row shipment-details-row">
                            <div class="col-12 col-sm-6 col-md-3">
                                <h6 class="text-dark font-weight-bold">{{ __('Shipment Type') }}</h6>
                                <p class="text-muted">{{ $shipment['type'] ?? 'N/A' }}</p>
                            </div>
                            <div class="col-12 col-sm-6 col-md-3">
                                <h6 class="text-dark font-weight-bold">{{ __('Branch') }}</h6>
                                <p class="text-muted">{{ $shipment['to_branch_id'] ?? 'N/A' }}</p>
                            </div>
                            <div class="col-12 col-sm-6 col-md-3">
                                <h6 class="text-dark font-weight-bold">{{ __('Created Date') }}</h6>
                                <p class="text-muted">{{ $shipment['created_at'] ?? 'N/A' }}</p>
                            </div>
                            <div class="col-12 col-sm-6 col-md-3">
                                <h6 class="text-dark font-weight-bold">{{ __('Shipping Date') }}</h6>
                                <p class="text-muted">{{ $shipment['shipping_date'] ?? 'N/A' }}</p>
                            </div>
                        </div>

                        <!-- Weight, cost, tax, insurance -->
                        <div class="row shipment-details-row">
                            <div class="col-12 col-sm-6 col-md-3">
                                <h6 class="text-dark font-weight-bold">{{ __('Weight') }}</h6>
                                <p class="text-muted">{{ $shipment['total_weight'] ?? 'N/A' }}</p>
                            </div>
                            <div class="col-12 col-sm-6 col-md-3">
                                <h6 class="text-dark font-weight-bold">{{ __('Cost') }}</h6>
                                <p class="text-muted">{{ $shipment['shipping_cost'] ?? 'N/A' }}</p>
                            </div>
                            <div class="col-12 col-sm-6 col-md-3">
                                <h6 class="text-dark font-weight-bold">{{ __('Tax') }}</h6>
                                <p class="text-muted">{{ $shipment['tax'] ?? 'N/A' }}</p>
                            </div>
                            <div class="col-12 col-sm-6 col-md-3">
                                <h6 class="text-dark font-weight-bold">{{ __('Insurance') }}</h6>
                                <p class="text-muted">{{ $shipment['insurance'] ?? 'N/A' }}</p>
                            </div>
                        </div>

                        <!-- From and To Regions -->
                        <div class="row shipment-details-row">
                            <div class="col-12 col-sm-6 col-md-2">
                                <h6 class="text-dark font-weight-bold">{{ __('From Country') }}</h6>
                                <p class="text-muted">{{ $shipment['from_branch_country'] ?? 'N/A' }}</p>
                            </div>
                            <div class="col-12 col-sm-6 col-md-2">
                                <h6 class="text-dark font-weight-bold">{{ __('To Country') }}</h6>
                                <p class="text-muted">{{ $shipment['to_branch_country'] ?? 'N/A' }}</p>
                            </div>
                            <div class="col-12 col-sm-6 col-md-2">
                                <h6 class="text-dark font-weight-bold">{{ __('From Region') }}</h6>
                                <p class="text-muted">{{ $shipment['from_branch_state'] ?? 'N/A' }}</p>
                            </div>
                            <div class="col-12 col-sm-6 col-md-2">
                                <h6 class="text-dark font-weight-bold">{{ __('To Region') }}</h6>
                                <p class="text-muted">{{ $shipment['to_branch_state'] ?? 'N/A' }}</p>
                            </div>
                            <div class="col-12 col-sm-6 col-md-2">
                                <h6 class="text-dark font-weight-bold">{{ __('Shipper Name') }}</h6>
                                <p class="text-muted">{{ $shipment['carrier'] ?? 'N/A' }}</p>
                            </div>
                            <div class="col-12 col-sm-6 col-md-2">
                                <h6 class="text-dark font-weight-bold">{{ __('Collection Time') }}</h6>
                                <p class="text-muted">{{ $shipment['collection_time'] ?? 'N/A' }}</p>
                            </div>
                        </div>

                        <!-- Packages Table -->
                        <div class="table-responsive mt-4">
                            <table class="table table-bordered">
                                <thead class="bg-light">
                                    <tr>
                                        <th>{{ __('Package Items') }}</th>
                                        <th class="text-center">{{ __('Qty') }}</th>
                                        <th class="text-center">{{ __('Type') }}</th>
                                        <th class="text-center">{{ __('Weight') }}</th>
                                        <th class="text-center">{{ __('Dimensions') }}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($packages as $package)
                                        <tr>
                                            <td>{{ $package->description }}</td>
                                            <td class="text-center">{{ $package->qty }}</td>
                                            <td class="text-center">{{ $package->package->name ?? '-' }}</td>
                                            <td class="text-center">{{ $package->weight }} LB</td>
                                            <td class="text-center">{{ $package->length }} x {{ $package->width }} x
                                                {{ $package->height }} IN</td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>

                        @if (isset($attachments) && $attachments->isNotEmpty())
                        <h5>Attached files:</h5>
                        <div class="container">
                            <div class="row">
                                @foreach ($attachments as $attachment)
                                    <div class="col-6 col-sm-4 col-md-2 text-center mb-4">
                                        @if (Str::endsWith($attachment->file_path, ['.jpg', '.jpeg', '.png']))
                                            <img src="{{ Storage::disk('s3')->url($attachment->file_path) }}" alt="Attachment"
                                                class="img-fluid" style="max-width: 100px;">
                                        @elseif (Str::endsWith($attachment->file_path, ['.pdf']))
                                            <a href="{{ Storage::disk('s3')->url($attachment->file_path) }}" target="_blank"
                                                class="d-block">View PDF</a>
                                        @endif
                                    </div>
                                @endforeach
                            </div>
                        </div>
                        @endif

                        <!-- Tracking codes-->
                        <div class="table-responsive mt-4">
                            <table class="table table-bordered">
                                <thead class="bg-light">
                                    <tr>
                                        <th>{{ __('System ID') }}</th>
                                        <th>{{ __('Local Tracking ID') }}</th>
                                        <th>{{ __('Vendor Tracking ID') }}</th>
                                        <th class="text-right">{{ __('Order ID') }}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>{{ $shipment['id'] }}</td>
                                        <td>{{ $shipment['code'] }}</td>
                                        <td>{{ $shipment['barcode'] }}</td>
                                        <td class="text-right">
                                            {{ $shipment['order_id'] }}
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <!-- Payment Table -->
                        <div class="table-responsive mt-4">
                            <table class="table table-bordered">
                                <thead class="bg-light">
                                    <tr>
                                        <th>{{ __('Payment Type') }}</th>
                                        <th>{{ __('Payment Status') }}</th>
                                        <th>{{ __('Payment Date') }}</th>
                                        <th class="text-right">{{ __('Total Cost') }}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>{{ $shipment['payment_method_id'] }}</td>
                                        <td>{{ $shipment['paid'] == 1 ? __('Paid') : __('Pending') }}</td>
                                        <td>{{ $shipment['paid'] ? $shipment['collection_time'] : '-' }}</td>
                                        <td class="text-right">
                                            {{ $shipment['shipping_cost'] + $shipment['tax'] + $shipment['insurance'] + $shipment['return_cost'] }}
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <!-- Actions -->
                        <div class="d-flex justify-content-between mt-4">
                            <!--a href="route('pages.shipments.invoice', [$shipment['id'], 'label'])" class="btn btn-outline-primary">('Print Label')</a-->
                            @role('admin')
                                <div><a href="{{ route('pages.shipments.label', [$shipment['id'], 'mode' => 'single']) }}"
                                    class="btn btn-outline-primary">
                                    {{ __('Print Label (unique)') }}
                                </a>
                                <a href="{{ route('pages.shipments.label', [$shipment['id'], 'mode' => 'multiple']) }}"
                                    class="btn btn-outline-primary">
                                    {{ __('Print Label (multiple)') }}
                                </a></div>

                                <a href="{{ route('pages.shipments.invoice', [$shipment['id'], 'invoice']) }}"
                                    class="btn btn-outline-secondary">
                                    {{ __('Print Invoice') }}
                                </a>
                            @endrole

                            @role('user')
                                <!-- Esto se mostrará solo para usuarios con el rol de "user" -->
                                <a href="{{ route('dashboard.invoice', [$shipment['id'], 'invoice']) }}"
                                    class="btn btn-outline-primary">
                                    {{ __('Print Invoice') }}
                                </a>
                            @endrole
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @stop
</x-app-layout>
