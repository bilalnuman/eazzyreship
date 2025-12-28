<?php

namespace App\Exports;

use App\Models\Package;
use Maatwebsite\Excel\Concerns\FromCollection;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class ShipmentsExport implements FromView
{
    /**
    * @return \Illuminate\Support\Collection
    */
    /*public function collection()
    {
        return Package::all();
    }*/

    protected $formattedPackages;

    public function __construct($formattedPackages)
    {
        $this->formattedPackages = $formattedPackages;
    }

    public function view(): View
    {
        return view('pages.exports.packages', [
            'formattedPackages' => $this->formattedPackages
        ]);
    }

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
