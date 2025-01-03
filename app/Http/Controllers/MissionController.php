<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Mission;
use App\Models\Branch;
use App\Models\Shipment_setting;
use App\Models\Status;

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
                        ->with('icon','success');
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
