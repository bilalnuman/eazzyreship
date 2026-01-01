<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class ShipmentsExport implements FromCollection
{
    protected $formattedPackages;

    public function __construct($formattedPackages)
    {
        $this->formattedPackages = $formattedPackages;
    }

    /**
     * Return the data collection for export.
     *
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        return collect($this->formattedPackages);
    }

    /**
     * Add styling to the worksheet.
     *
     * @param Worksheet $sheet
     * @return array
     */
    public function styles(Worksheet $sheet)
    {
        return [
            1    => ['font' => ['bold' => true]],  // Style the first row as bold text.
            'B2' => ['font' => ['italic' => true]], // Styling a specific cell.
            'C'  => ['font' => ['size' => 16]],    // Styling an entire column.
        ];
    }
}
