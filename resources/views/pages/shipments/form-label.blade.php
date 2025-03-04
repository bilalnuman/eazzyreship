<table width="576px" border="0" cellpadding="0" cellspacing="0"
    style="font-size:16px;font-family:Arial, Helvetica, sans-serif; margin: 0 auto;">
    <tr>
        <td height="21px" colspan="3" style="padding-left:5px; padding-bottom:5px;">
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td valign="middle" style="padding-left:5px; height: 90px;">
                        @php
                            $system_logo = App\Models\Setting::where('group', 'general')
                                ->where('name', 'system_logo')
                                ->first();
                        @endphp
                        <img src="{{ public_path('img/logoea2.png') }}" valign="top" class="logo"
                            style="max-height: 90px;" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td height="21px" colspan="3" style="border-top:#030303  1px solid;border-bottom:#000000 1px solid;">
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="81%" height="21px" valign="top">
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="padding-left:10px; font-size:14px; font-weight:bold;">
                                                {{ 'EazzyReship' }}
                                            </td>
                                            <td style="text-align: right; padding-right: 10px;">
                                                <span
                                                    style="font-size:16px; font-weight:bold;">{{ $shipment->code }}</span>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td
                                    style="padding-left:10px;font-size: 12px;white-space: pre-line;word-wrap: break-word;max-width: 360px;">
                                    {{ $company->address }}</td>
                            </tr>
                        </table>
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="border-top: 1px solid #010101; border-bottom: 0px solid #000000;">
                                    <div style="margin-top:1px;">
                                        <table width="100%" border="0" align="center" cellpadding="0"
                                            cellspacing="0">
                                            <tr>
                                                <td style="text-align: center; padding-top: 10px;" colspan="1">
                                                    <span style="font-size:16px; font-weight:bold; padding:10px;">

                                                        @if ($shipment->amount_to_be_collected && $shipment->amount_to_be_collected > 0)
                                                            {{ 'Packages:  ' }}
                                                            {{ $nums }}
                                                        @endif
                                                    </span>
                                                    <br />
                                                    @if ($multiple === 'true')
                                                        <span
                                                            style="font-size:16px; font-weight:bold; margin-bottom:10px;padding: 2px;">
                                                            {{ __('Total Weight') }}:
                                                            {{ $package->weight * $package->qty }}
                                                            {{ __('KG') }}
                                                        </span>
                                                    @else
                                                        <span
                                                            style="font-size:16px; font-weight:bold; margin-bottom:10px;padding: 2px;">
                                                            {{ __('Total Weight') }}: {{ $shipment->total_weight }}
                                                            {{ __('KG') }}
                                                        </span>
                                                    @endif

                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: center; padding: 10px;">
                                                    <br/>
                                                    @if ($shipment->code)
                                                        <div style="display: inline-block; text-align: center;">
                                                            {!! $d->getBarcodeHTML($shipment->code, 'C128') !!}

                                                            
                                                        </div>
                                                    @endif
                                                    <br/>
                                                    @if ($multiple === 'true' && !empty($package->notes))
                                                        <br/>
                                                        <div style="display: inline-block; text-align: center;">
                                                            {!! $d->getBarcodeHTML($package->notes, 'C128') !!}
                                                        </div>
                                                    @endif

                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <span style="font-size:16px; font-weight:bold;">
                                                        <br />
                                                        @if ($shipment['order_id'] != null)
                                                            {{ __('order_id') }}: {{ $shipment['order_id'] }} /
                                                        @endif {{ $shipment['code'] }} /
                                                        {{ $shipment['total_weight'] }} {{ __('KG') }} /
                                                        @if (strpos($shipment['shipping_date'], '/'))
                                                        @else
                                                            {{ \Carbon\Carbon::parse($shipment['shipping_date'])->format('d-m-Y') }}
                                                        @endif
                                                    </span>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="padding:5px; font-size:12px;">
                                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="font-size:12px;word-wrap: break-word;max-width: 360px;">
                                                <span style="font-weight:bold;">{{ __('from') }}: </span>
                                                <span style="font-weight:bold;">{{ $client->code }} </span><br />
                                                <br />
                                                <br />
                                            </td>
                                            <td style="font-size:12px;word-wrap: break-word;max-width: 360px;">
                                                <span style="font-weight:bold;">{{ __('to') }}: </span>
                                                {{ $shipment->toBranch->name }}<br />
                                                {{ $shipment->toBranch->responsible_mobile }}<br />
                                                {{ $shipment->toBranch->address }}
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"
                            style="margin-top:5px;border-top:#000000 1px solid;">
                            <tr>
                                <td style="padding:5px; font-size:12px; text-align:center">
                                    @if ($multiple === 'true')
                                        <span style="font-weight:bold; font-size: 14px;">{{ __('contains') }}: </span>
                                        {{ $package->description }}
                                    @else
                                        <span style="font-weight:bold; font-size: 14px;">{{ __('contains') }}: </span>
                                        {{ $packagestemp }}
                                    @endif
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>