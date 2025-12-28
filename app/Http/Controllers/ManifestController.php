<?php

namespace App\Http\Controllers;

use App\Models\Manifest;
use App\Models\Mission;
use Illuminate\Http\Request;

class ManifestController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('pages.manifests.index');
    }

    public function getManifests()
    {
        $missions = Mission::with('branch:id,name') // Asegúrate de tener una relación definida entre Mission y Branch
            ->select(['id', 'code', 'status_id', 'type', 'due_date', 'to_branch_id'])
            ->orderBy('id', 'desc')
            ->get()
            ->map(function ($mission) {
                return [
                    'id' => $mission->id,
                    'code' => $mission->code,
                    'status_id' => $mission->status_id == 1 ? 'Active' : 'Close',
                    'type' => $mission->type == 1 ? 'Air' : 'Ocean',
                    'due_date' => $mission->due_date,
                    'to_branch_id' => $mission->branch->name ?? 'N/A',
                ];
            });
        return response()->json(['data' => $missions]);
    }
    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $mission = Mission::with(['shipment.packages','shipment.client','shipment.receiver'])->findOrFail($id);

        return view('pages.manifests.show', compact('mission'));
        // $mission = Mission::with('shipment')->findOrFail($id);
        //return view('pages.manifests.show', compact('mission'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Manifest $manifest)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Manifest $manifest)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Manifest $manifest)
    {
        //
    }
}
