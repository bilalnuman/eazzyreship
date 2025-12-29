<?php

namespace App\Exports;

use App\Models\Package;
use App\Models\Package_shipment;
use Maatwebsite\Excel\Concerns\FromCollection;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

use Illuminate\Database\Eloquent\Builder;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\WithChunkReading;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class ShipmentsExport implements FromQuery, WithMapping, WithHeadings, WithChunkReading
{

    public function __construct(private readonly int $missionId) {}

    public function query(): Builder
    {
        return Package_shipment::query()
            ->whereHas('shipment', fn($q) => $q->where('mission_id', $this->missionId))
            ->with([
                'package:id,name',
                'shipment.mission:id,code,due_date',
                'shipment.client:id,name',
            ])
            ->select('id', 'shipment_id', 'qty', 'description', 'value', 'notes', 'package_id')
            ->orderBy('shipment_id')
            ->orderBy('id');
    }

    public function headings(): array
    {
        return [
            'mission_code',
            'mission_date',
            'shipment_id',
            'code',
            'sender',
            'receiver',
            'vendor_tracking',
            'qty',
            'type',
            'invoice',
            'notes',
            'contents',
            'value',
            'LBS',
            'weight',
            'freight',
            'total_charges'
        ];
    }

    public function map($package): array
    {

        $shipment = $package->shipment;

        $dueDate = $shipment?->mission?->due_date;
        $dueDate = $dueDate instanceof \Carbon\Carbon ? $dueDate->format('Y-m-d') : ($dueDate ?? '');

        return [
            $shipment?->mission?->code ?? '',
            $dueDate,
            $shipment?->id ?? '',
            $shipment?->code ?? '',
            $shipment?->carrier ?? '',
            $shipment?->client?->name ?? '',
            $shipment?->barcode ?? '',
            (int) ($package->qty ?? 0),
            $package->package?->name ?? '',
            $shipment?->otp ?? '',
            $package->notes ?? '',
            $package->description ?? '',
            (float) ($package->value ?? 0),
            '', // <-- TODO: set correct LBS field (don't reuse otp)
            (float) ($shipment?->total_weight ?? 0),
            (float) ($shipment?->shipping_cost ?? 0),
            (float) ($shipment?->amount_to_be_collected ?? 0),
        ];
    }

    public function chunkSize(): int
    {
        return 1000;
    }


















    /**
     * @return \Illuminate\Support\Collection
     */
    /*public function collection()
    {
        return Package::all();
    }*/

    // protected $formattedPackages;

    // public function __construct($formattedPackages)
    // {
    //     $this->formattedPackages = $formattedPackages;
    // }

    // public function view(): View
    // {
    //     return view('pages.exports.packages', [
    //         'formattedPackages' => $this->formattedPackages
    //     ]);
    // }

    public function styles(Worksheet $sheet)
    {
        return [
            // Style the first row as bold text.
            1    => ['font' => ['bold' => true]],

            // Styling a specific cell by coordinate.
            'B2' => ['font' => ['italic' => true]],

            // Styling an entire column.
            'C'  => ['font' => ['size' => 16]],
        ];
    }
}
