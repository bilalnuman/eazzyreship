@php
    use Milon\Barcode\DNS1D;
    $d = new DNS1D();
    $totalLabels = $printMode === 'multiple' ? $shipment->packages->count() : 1;
    $currentLabel = 0;
    $packagestemp = '';

@endphp
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title><?php echo 'Label | ' . $shipment->id; ?></title>

    <style type="text/css">
        /*.label-page {
            page-break-after: always;
            position: relative;
            padding: 20px;
            font-family: Arial;
        }

        .label-footer {
            /*position: absolute;
            bottom: 10px;
            right: 10px;
            font-size: 12px;

            width: 100%;
            height: 99vh; 
            page-break-inside: avoid;
            position: relative;
        }*/
/*
        .label-container {
            border: 1px solid #000;
            padding: 15px;
            margin: 10px;

            page-break-inside: avoid;
            page-break-after: auto;
        }

        .label-container:last-child {
            page-break-after: auto !important;
        }

        .barcode {
            text-align: center;
            margin: 15px 0;
        }

        .cut-line {
            border-top: 1px dashed #000;
            margin: 2px 0;
        }*/
    </style>
</head>

<body>

    @if ($printMode === 'multiple')
        @foreach ($shipment->packages as $package)
            @php
                $currentLabel++;
                $nums = $currentLabel . ' of ' . $totalLabels;
            @endphp
            <div class="label-page">
                @include('pages.shipments.form-label', [
                    'package' => $package,
                    'nums' => $nums,
                    'multiple' => 'true',
                ])
                <!--div class="label-footer">{ { $currentLabel }}/{ { $totalLabels }}</div-->
            </div>
            @if(!$loop->last)
                <!--div class="cut-line"></div-->
            @endif
        @endforeach
    @else
        @foreach ($shipment->packages as $package)
            @php
                $packagestemp = $packagestemp . $package->description . ",";
            @endphp
        @endforeach
        <div class="label-page">
            @include('pages.shipments.form-label', [
                'package' => $packagestemp,
                'nums' => '1/1',
                'multiple' => 'false',
            ])
            <!--div class="label-footer">1/1</div-->
        </div>
    @endif
    <script>
        window.onload = function() {
            window.print();
        };
    </script>
</body>
</html>