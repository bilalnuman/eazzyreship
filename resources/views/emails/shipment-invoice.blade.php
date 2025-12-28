<!DOCTYPE html>
<html>

<head>
    <title>Invoice</title>
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
    <h1>Invoice Notification</h1>
    <p>Dear Customer {{ $data->name ?? ''}}</p>
    <p>Invoice for package: {{ $data->packageNum ?? ''}} We will email you when you package is ready for pick-up.<br /></p>
    <p>Thank you,<br /></p>
    <p>Eazzyreship Team.*<br /></p>
</body>

</html>