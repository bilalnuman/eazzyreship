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