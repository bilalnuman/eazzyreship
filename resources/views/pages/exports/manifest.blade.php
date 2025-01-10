<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Code</th>
            <th>Status</th>
            <th>Type</th>
            <th>Client</th>
            <th>Receiver Name</th>
            <th>Receiver Address</th>
            <th>From Branch</th>
            <th>To Branch</th>
            <th>Carrier</th>
            <th>Shipping Date</th>
            <th>Total Weight</th>
            <th>Amount to be Collected</th>
            <th>Created At</th>
            <th>Packages</th>
        </tr>
    </thead>
    <tbody>
        @foreach($shipments as $shipment)
        <tr>
            <td>{{ $shipment['id'] }}</td>
            <td>{{ $shipment['code'] }}</td>
            <td>{{ $shipment['status'] }}</td>
            <td>{{ $shipment['type'] }}</td>
            <td>{{ $shipment['client'] }}</td>
            <td>{{ $shipment['receiver_name'] }}</td>
            <td>{{ $shipment['receiver_address'] }}</td>
            <td>{{ $shipment['from_branch'] }}</td>
            <td>{{ $shipment['to_branch'] }}</td>
            <td>{{ $shipment['carrier'] }}</td>
            <td>{{ $shipment['shipping_date'] }}</td>
            <td>{{ $shipment['total_weight'] }}</td>
            <td>{{ $shipment['amount_to_be_collected'] }}</td>
            <td>{{ $shipment['created_at'] }}</td>
            <td>
                @foreach($shipment['packages'] as $package)
                    ID: {{ $package['id'] }}, Weight: {{ $package['weight'] }}, Dimensions: {{ $package['dimensions'] }}, Description: {{ $package['description'] }}<br>
                @endforeach
            </td>
        </tr>
        @endforeach
    </tbody>
</table>
