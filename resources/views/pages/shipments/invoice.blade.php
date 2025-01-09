@php
    use Milon\Barcode\DNS1D;
    $d = new DNS1D();
@endphp
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title><?php echo 'invoice | ' . $shipment->id; ?></title>

    <style type="text/css">
        * {
            font-family: Verdana, Arial, sans-serif;
        }

        table {
            font-size: x-small;
        }

        tfoot tr td {
            font-weight: bold;
            font-size: x-small;
        }

        .gray {
            background-color: lightgray
        }

        .content {
            flex: 1;
            /* Permite que el contenido crezca y empuje el pie hacia abajo */
            padding-bottom: 50px;
            /* Espacio extra para que el pie no se superponga */
        }

        .footer-table {
            position: absolute;
            bottom: 20%;
            width: 100%;
        }

        .code-right{

        }
    </style>
</head>

<body>
    <?php foreach ($client->addresses as $var){
        $address= $var->address;
    }
    ?>

    <table width="100%">
        <tr>
            <td valign="top"><img src="{{ public_path('img/logoea2.png') }}" width="200px"/>
                <pre>
                    <?php
                    echo '<br>' . $client->name;
                    echo '<br>' . $address;                   
                    echo '<br>' . "Tel: " . $client->mobile;
                    echo '<br>' . "ID : ". $client->national_id;
                    echo '<br>';
                    ?>
                </pre>
            </td>
            <td align="right">
                <h3>EazzyReship</h3>
                <pre>
                <?php
                if ($shipment->code) {
                    echo '<span style="display: block; text-align: right; float: right">' . $d->getBarcodeHTML($shipment->code, 'C128') . '</span><br><br><br>';
                }
                echo '<br>' . $company->name;
                echo '<br>' . $company->address;
                echo '<br>' . $company->email;
                echo '<br>' . $company->responsible_mobile;
                echo '<br>';
                ?>
            </pre>
            </td>
        </tr>
    </table>

    <table width="100%">
        <tr>
            <td><strong>From:</strong> <?php echo $shipment->fromBranch->name; ?></td>
            <td><strong>To:</strong> <?php echo $shipment->toBranch->name . " / ". $shipment->toBranch->address ?></td>
        </tr>

    </table>

    <br />

    <table width="100%" class="content">
        <thead style="background-color: lightgray;">
            <tr>
                <th>#</th>
                <th>ID</th>
                <th>Description</th>
                <th>Quantity</th>
                <th>Weight</th>
                <th>length x width x height</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $counter = 1;
            foreach ($packages as $package) {
                echo '<tr>';
                echo "<th scope='row'>" . $counter . '</th>';
                echo '<td>' . $shipment->code . '</td>';
                echo '<td>' . $package->description . '</td>';
                echo "<td align='right'>" . $package->qty . '</td>';
                echo "<td align='right'>" . $package->weight . ' LB' . '</td>';
                echo "<td align='right'>" . $package->length . ' IN x ' . $package->width . ' IN x ' . $package->height . ' IN ' . '</td></tr>';
            }
            ?>
            <tr><span></span></tr>
        </tbody>
    </table>

    <table width="100%">
        <tfoot>
            <tr>
                <td colspan="3"></td>
                <td align="right">Sipping Cost $</td>
                <?php echo "<td align='right'>" . $shipment->shipping_cost . '</td>'; ?>

            </tr>
            <tr>
                <td colspan="3"></td>
                <td align="right">Tax $</td>
                <?php echo "<td align='right'>" . $shipment->tax . '</td>'; ?>
            </tr>
            <tr>
                <td colspan="3"></td>
                <td align="right">Insurance $</td>
                <?php echo "<td align='right'>" . $shipment->insurance . '</td>'; ?>
            </tr>
            <tr>
                <td colspan="3"></td>
                <td align="right">Delivery $</td>
                <?php echo "<td align='right'>" . $shipment->return_cost . '</td>'; ?>
            </tr>
            <tr>
                <td colspan="3"></td>
                <td align="right">Total Cost $</td>
                <?php echo "<td align='right' class='gray'>" . $shipment->amount_to_be_collected . '</td>'; ?>
            </tr>
        </tfoot>
    </table>
</body>

</html>
