<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mission Manifest</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .header h1 {
            font-size: 24px;
        }
        .details {
            margin-bottom: 20px;
        }
        .details table {
            width: 100%;
            border-collapse: collapse;
        }
        .details table th,
        .details table td {
            text-align: left;
            padding: 8px;
        }
        .details table th {
            background-color: #f4f4f4;
        }
        .shipments table {
            width: 100%;
            border-collapse: collapse;
        }
        .shipments table th,
        .shipments table td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        .shipments table th {
            background-color: #f4f4f4;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Mission Manifest</h1>
        <p>Mission Code: {{ $mission->code }}</p>
    </div>
    <div class="details">
        <h2>Mission Details</h2>
        <table>
            <tr>
                <th>From Branch</th>
                <td>{{ $mission->fromBranch->name }}</td>
            </tr>
            <tr>
                <th>To Branch</th>
                <td>{{ $mission->toBranch->name }}</td>
            </tr>
            <tr>
                <th>Status</th>
                <td>{{ $mission->status_id }}</td>
            </tr>
            <tr>
                <th>Due Date</th>
                <td>{{ $mission->due_date }}</td>
            </tr>
            <tr>
                <th>Type</th>
                <td>{{ $mission->type }}</td>
            </tr>
        </table>
    </div>
    <div class="shipments">
        <h2>Assigned Shipments</h2>
        <table>
            <thead>
                <tr>
                    <th>Shipment #</th>
                    <th>Shipper</th>
                    <th>Receiver</th>
                    <th>Vendor Tracking</th>
                    <th># of PCS</th>
                    <th>Packages type</th>
                    <th>Invoice #</th>
                    <th>Package value</th>
                    <th>Invoice value</th>
                    <th>LBS</th>
                    <th>Weight</th>
                    <th>Freight</th>
                    <th>Total charges</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($mission->shipment as $ship)
                    <tr>
                        <td>{{ $ship->id }}</td>
                        <td>{{ $ship->carrier }}</td>
                        <td>{{ $ship->client->name }}</td>
                        <td>{{ $ship->barcode }}</td>
                        <td>{{ $ship->qty }}</td>
                        <td>{{ $ship->total_weight }} kg</td>
                        <td>{{ $ship->shipping_cost }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
    <div class="footer">
        <p>Generated on {{ now()->format('Y-m-d H:i:s') }}</p>
    </div>
</body>
</html>
