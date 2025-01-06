<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Mission;
use App\Models\Shipment;
use App\Models\Branch;
use App\Models\Shipment_setting;
use App\Models\Status;
use Barryvdh\DomPDF\Facade\Pdf;

class MissionController extends Controller
{
    public function index()
    {
        $missionsData = $this->getMissions();
        return view('pages.missions.index', compact('missionsData'));
    }

    public function create()
    {
        $excludedBranchIds1 = [1, 2, 3, 4, 5]; // IDs a excluir
        $branches0 = Branch::whereNotIn('id', $excludedBranchIds1)->get();
        $excludedBranchIds2 = [6]; // IDs a excluir
        $branches = Branch::whereNotIn('id', $excludedBranchIds2)->get();

        return view('pages.missions.create', compact('branches0', 'branches'));
    }

    public function show($var = null)
    {
        $missionsData = $this->getMissions($var);
        return view('pages.missions.index', compact('missionsData'));
    }

    public function manifest($id)
    {
        // Obtén la misión específica
        $mission = Mission::with('shipment')->findOrFail($id);

        $shipmentsData = $mission->shipment->map(function ($shipment) {
            return [
                'id' => $shipment->id,
                'code' => $shipment->code,
                'client' => $shipment->client->name,
                'status' => $shipment->status->name,
                'to_branch' => $shipment->toBranch->name,
                'receiver' => $shipment->receiver->name,
                'actions' => ''
            ];
        });

        // Obtén la lista de envíos que no están asignados a esta misión
        $availableShipments = Shipment::whereNull('mission_id')
            ->where('to_branch_id', $mission->to_branch_id)
            ->get();


        return view('pages.missions.manifest', compact('mission', 'availableShipments', 'shipmentsData'));
    }

    public function addShipments(Request $request, $id)
    {
        $mission = Mission::findOrFail($id);

        // Validar los IDs de los envíos
        $request->validate([
            'shipment_ids' => 'required|array',
            'shipment_ids.*' => 'exists:shipments,id',
        ]);

        // Asignar los envíos a la misión
        Shipment::whereIn('id', $request->shipment_ids)->update(['mission_id' => $mission->id]);

        return redirect()->route('pages.missions.manifest', $id)
            ->with('message', 'Shipment added successfully.')
            ->with('icon', 'success');
    }


    public function removeShipment($missionId, $shipmentId)
    {
        $shipment = Shipment::where('id', $shipmentId)->where('mission_id', $missionId)->firstOrFail();

        // Quitar la misión del envío
        $shipment->update(['mission_id' => null]);

        //return redirect()->back()->with('success', 'Shipment removed successfully.');

        return redirect()->route('pages.missions.manifest', $missionId)
            ->with('message', 'Shipment removed successfully.')
            ->with('icon', 'success');
    }

    public function manifestPDF($id)
    {
        // Obtén la misión por ID
        $mission = Mission::with(['shipment.client', 'shipment.receiver', 'shipment.fromBranch', 'shipment.toBranch'])
            ->where('id', $id)
            ->firstOrFail();

        // Obtén la información adicional si es necesario
        //$company = Branch::where('id', 1)->first();

        // Genera el PDF utilizando una vista
        $manifest = PDF::loadView('pages.missions.manifest-report', compact('mission'));

        // Devuelve el PDF para ser descargado o visualizado en el navegador
        return $manifest->stream('mission_manifest.pdf');
    }


    public function store(Request $request)
    {
        $validated = $request->validate([
            'code' => 'nullable|string',
            'status_id' => 'nullable|integer',
            'type' => 'required|integer',
            'amount' => 'nullable|numeric',
            'order' => 'nullable|integer',
            'due_date' => 'nullable|date',
            'user_id' => 'required|integer',
            'from_branch_id' => 'nullable|integer',
            'to_branch_id' => 'nullable|integer',
            'seg_img' => 'nullable|string',
            'otp' => 'nullable|string',
        ]);

        $mission = Mission::create($validated);

        if ($mission->type == 1) {
            $prefix = Shipment_setting::where('key', 'mission_prefix_air')->first();
        } else {
            $prefix = Shipment_setting::where('key', 'mission_prefix_sea')->first();
        }

        $mission->update(['code' => $prefix->value . "-" . $mission->id]);

        return redirect()->route('pages.missions.index')
            ->with('message', 'Mission created successfully!')
            ->with('icon', 'success');
    }


    public function edit($id)
    {
        $excludedBranchIds1 = [1, 2, 3, 4, 5]; // IDs a excluir
        $branches0 = Branch::whereNotIn('id', $excludedBranchIds1)->get();
        $excludedBranchIds2 = [6]; // IDs a excluir
        $branches = Branch::whereNotIn('id', $excludedBranchIds2)->get();
        $mission = Mission::findOrFail($id);
        return view('pages.missions.edit', compact('mission', 'branches0', 'branches'));
    }

    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'code' => 'nullable|string',
            'status_id' => 'nullable|integer',
            'type' => 'required|integer',
            'amount' => 'nullable|numeric',
            'order' => 'nullable|integer',
            'due_date' => 'nullable|date',
            'user_id' => 'required|integer',
            'from_branch_id' => 'nullable|integer',
            'to_branch_id' => 'nullable|integer',
            'seg_img' => 'nullable|string',
            'otp' => 'nullable|string',
        ]);
        $mission = Mission::findOrFail($id);
        $mission->update($validated);

        if ($mission->type == 1) {
            $prefix = Shipment_setting::where('key', 'mission_prefix_air')->first();
        } else {
            $prefix = Shipment_setting::where('key', 'mission_prefix_sea')->first();
        }
        $mission->update(['code' => $prefix->value . "-" . $mission->id]);

        return redirect()->route('pages.missions.index')
            ->with('message', 'Mission updated successfully!')
            ->with('icon', 'success');
    }

    public function status($id)
    {
        $mission = Mission::find($id);

        if (!$mission) {
            return redirect()->back()
                ->with('message', 'Mission not found.')
                ->with('icon', 'error');
        }

        $mission->status_id = $mission->status_id == 1 ? 0 : 0; // 1 = Activo, 0 = Inactivo
        $mission->save();

        return redirect()->route('pages.missions.index')
            ->with('message', 'Mission closed successfully.')
            ->with('icon', 'success');
    }

    public function destroy($id)
    {
        $mission = Mission::findOrFail($id);
        $mission->delete();
        return redirect()->route('pages.missions.index')
            ->with('message', 'Mission deleted successfully!')
            ->with('icon', 'success');
    }

    public function getMissions($var = null)
    {
        $type = ($var === 'active') ? '1' : (($var === 'close') ? '0' : null);

        if ($type != null) {
            $missions = Mission::with('tobranch:id,name', 'frombranch:id,name') // Asegúrate de tener una relación definida entre Mission y Branch
                ->select(['id', 'code', 'status_id', 'type', 'due_date', 'from_branch_id', 'to_branch_id'])
                ->where('status_id', $type)
                ->orderBy('id', 'desc')
                ->get()
                ->map(function ($mission) {
                    return [
                        'id' => $mission->id,
                        'code' => $mission->code,
                        'status_id' => $mission->status_id == 1 ? 'Active' : 'Close',
                        'type' => $mission->type == 1 ? 'Air' : 'Ocean',
                        'due_date' => $mission->due_date,
                        'from_branch_id' => $mission->frombranch->name ?? 'N/A',
                        'to_branch_id' => $mission->tobranch->name ?? 'N/A',
                    ];
                });
        } else {
            $missions = Mission::with('tobranch:id,name', 'frombranch:id,name') // Asegúrate de tener una relación definida entre Mission y Branch
                ->select(['id', 'code', 'status_id', 'type', 'due_date', 'from_branch_id', 'to_branch_id'])
                ->orderBy('id', 'desc')
                ->get()
                ->map(function ($mission) {
                    return [
                        'id' => $mission->id,
                        'code' => $mission->code,
                        'status_id' => $mission->status_id == 1 ? 'Active' : 'Close',
                        'type' => $mission->type == 1 ? 'Air' : 'Ocean',
                        'due_date' => $mission->due_date,
                        'from_branch_id' => $mission->frombranch->name ?? 'N/A',
                        'to_branch_id' => $mission->tobranch->name ?? 'N/A',
                    ];
                });
        }
        //return response()->json(['data' => $missions]);
        return $missions;
    }
}
