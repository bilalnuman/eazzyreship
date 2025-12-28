<style>
    .timeline {
        border-left: 3px solid #0dcaf0;
        position: relative;
        margin-left: 20px;
    }
    .timeline::before {
        content: "";
        position: absolute;
        left: -5px;
        top: 0;
        width: 10px;
        height: 100%;
        background: #ffffff;
    }
    .timeline-item {
        position: relative;
        margin-bottom: 20px;
        padding-left: 30px;
    }
    .timeline-item::before {
        content: "";
        position: absolute;
        left: -15px;
        width: 12px;
        height: 12px;
        background: #0dcaf0;
        border: 2px solid #ffffff;
        border-radius: 50%;
        top: 0;
    }
    .tracking-number {
        background: #e0f7fa;
        color: #007b8f;
        font-weight: bold;
        border-radius: 5px;
        padding: 5px 10px;
        display: inline-block;
    }
</style>
<section>
<div class="container py-5">
    <div class="text-center mb-5">
        <h1 class="fw-bold text-cyan">Shipment Tracking</h1>
    </div>

    <!-- Shipment Info -->
    <div class="card shadow-sm mb-5">
        <div class="card-body">
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <p class="text-muted mb-1">Local Tracking Number:</p>
                    <span class="tracking-number">{{ $shipment->code }}</span>
                    <p class="text-muted mb-1">Vendor Tracking Number:</p>
                    <span class="tracking-number">{{ $shipment->barcode ?? "" }}</span>
                </div>
                <div>
                    <p class="text-muted mb-1">Status:</p>
                    <span class="badge bg-success text-uppercase">
                        {{ ucfirst($shipment->status->name) }}
                    </span>
                </div>
            </div>
            <div class="mt-4">
                <p class="text-muted mb-1">Origin:</p>
                <h5 class="fw-bold">{{ $shipment->fromBranch->name }}</h5>
                <p class="text-muted mt-3 mb-1">Destination:</p>
                <h5 class="fw-bold">{{ $shipment->toBranch->name }}</h5>
            </div>
        </div>
    </div>

    <!-- Timeline -->
    <div class="card shadow-sm">
        <div class="card-body">
            <h3 class="mb-4">Shipment History</h3>
            <div class="timeline">
                @foreach ($shipmentLogs as $event)
                    <div class="timeline-item">
                        <div class="d-flex justify-content-between align-items-center">
                            <h5 class="fw-bold mb-1">{{ $event->status->name }}</h5>
                            <small class="text-muted">{{ $event->created_at->format('d M, Y h:i A') }}</small>
                        </div>
                        <p class="text-muted">{{ $event->status->description }}</p>
                    </div>
                @endforeach
            </div>
        </div>
    </div>

    <!-- Back Button -->
    <div class="text-center mt-5">
        <a href="/tracking" class="btn btn-outline-cyan">
            ← Back to Search
        </a>
    </div>
</div>
</section>