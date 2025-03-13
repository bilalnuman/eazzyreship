<table class="table table-bordered table-striped table-hover">
    <thead>
        <tr>
            <th colspan="14" align="center">Manifet date {{ $formattedPackages[0]['mission_date'] ?? 'N/A' }} - {{ $formattedPackages[0]['mission_code'] ?? 'N/A' }}</th>
        </tr>
        <tr class="bg-light" style="font-sytle: bold">
            <th style="font-sytle: bold" >Shipment #</th>
            <th>Code</th>
            <th>Sender / Shipper</th>
            <th>Receiver</th>
            <th>Vendor Tracking</th>
            <th># of Pcs</th>
            <th>Package Type</th>
            <th>Invoice #</th>
            <th>Notes</th>
            <th>Package Contents</th>
            <th>Invoice Value</th>
            <th>LBS</th>
            <th>Weight</th>
            <th>Freight</th>
            <th>Total Charges</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($formattedPackages as $package)
            <tr>
                <td>{{ $package['shipment_id'] }}</td>
                <td>{{ $package['code'] }}</td>
                <td>{{ $package['sender'] }}</td>
                <td>{{ $package['receiver'] }}</td>
                <td>{{ $package['vendor_tracking'] }}</td>
                <td>{{ $package['qty'] }}</td>
                <td>{{ $package['type'] }}</td>
                <td>{{ $package['invoice'] }}</td>
                <td>{{ $package['notes'] }}</td>
                <td>{{ $package['contents'] }}</td>
                <td>{{ $package['value'] }}</td>
                <td>{{ $package['LBS'] }}</td>
                <td>{{ $package['weight'] }}</td>
                <td>{{ $package['freight'] }}</td>
                <td>{{ $package['total_charges'] }}</td>
            </tr>
        @endforeach
    </tbody>
</table>
