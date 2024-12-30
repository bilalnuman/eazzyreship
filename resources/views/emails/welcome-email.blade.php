<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Eazzyreship</title>
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
    <h1>Welcome to Eazzyreship</h1>
    <p>Hi There!</p>
    <p>Thank you for signing up with Eazzyreship! Your account is now active.</p>
    <p> This is our address:<br/><br/>
        8069 NW 67th St.<br/>
        Suite: #  {{ $userId }} <br/>
        Miami FL 33166<br/>
        USA<br/>
        (305) 280 1457</p>
    <p><a href="{{ url('/') }}" class="button">Start Exploring</a></p>
    <p>If you have any questions, feel free to contact us at info@eazzyship.com</p>
    <p>Currently by default we ship via sea freight on a weekly basis but if you need to ship your packages by air via Fedex / DHL please let us know as soon as your packages are received in our Miami Warehouse</p>
    <p>Thanks,<br/>
    Eazzyreship Team.</P>
</body>
</html>
