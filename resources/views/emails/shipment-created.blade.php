<!DOCTYPE html>
<html>
<head>
    <title>Shipment Received</title>
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
    <h1>Shipment Notification</h1>
    <p>One or more package(s) with tracking</p>
    <p>Warehouse ID: {{ $shipment->code ?? ''}} <br/></p>
    <p>Tracking: {{ $shipment->barcode ?? ''}} <br/></p>
    <p>Have been received for you at Miami warehouse. We will email you when you package is shipped to destination city.<br/></p>
    <p>Thank you,<br/>
    Eazzyreship Team.</P>
</body>
</html>
