<?php

namespace App\Exports;

//use App\Models\Mission;
//use Maatwebsite\Excel\Concerns\FromCollection;
//use Maatwebsite\Excel\Concerns\WithHeadings;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;

/*class ManifestExport implements FromCollection, WithHeadings
{
    protected $mission_id;


    public function __construct($mission_id = null)
    {
        $this->mission_id = $mission_id;

    }

    public function collection()
    {
        return Mission::where('id', $this->mission_id)->Select('id', 'code')->get();
    }

    public function headings(): array
    {
        return ['ID', 'CODE'];
    }
}*/

class ManifestExport implements FromView
{
    protected $shipments;

    public function __construct($shipments)
    {
        $this->shipments = $shipments;
    }

    public function view(): View
    {
        return view('pages.exports.manifest', [
            'packages' => $this->shipments
        ]);
    }
}