<!DOCTYPE html>
<html>
<head>
    <title>Shipping Status Update</title>
    <style>
        /* Agrega tus estilos CSS personalizados aquí */
        body {
            font-family: Arial, sans-serif;
        }
        .button {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h2>Dear Customer,</h2>
    <p>The status of your shipment with code <strong>{{ $shipment->code }}</strong> has been updated.</p>
    <p>Description: <strong>{{ $shipment->status->description }}</strong></p>
    <p>New status: <strong>{{ $shipment->status->name }}</strong></p>
    <p>Thank you,<br/>Eazzyreship Team.</P>
</body>
</html>
