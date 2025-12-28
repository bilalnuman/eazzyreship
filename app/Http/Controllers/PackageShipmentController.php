<?php

namespace App\Http\Controllers;

use App\Models\Package_shipment;
use Illuminate\Http\Request;

class PackageShipmentController extends Controller
{

    public function index()
    {
        //
    }

    public function getPackage($id)
    {
        $shipments_package = Package_shipment::where('shipment_id', $id)->pluck(['id', 'description', 'carrier', 'weigth', 'length', 'width', 'height', 'qty']);
        
        if ($shipments_package->isEmpty()) {
            return response()->json(['data' => [], 'message' => 'No shipments available.']);
        }
        return response()->json(['data' => $shipments_package]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'package_id' => 'required|integer',
            'shipment_id' => 'required|integer',
            'description' => 'nullable|string',
            'image' => 'nullable|string',
            'weight' => 'nullable|numeric',
            'length' => 'nullable|numeric',
            'width' => 'nullable|numeric',
            'height' => 'nullable|numeric',
            'qty' => 'nullable|numeric',
        ]);

        Package_shipment::create($request->all());

        return redirect()->route('package_shipments.index')
            ->with('message', 'Package shipment created successfully.')
            ->with('icon', 'success');;
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'package_id' => 'required|integer',
            'shipment_id' => 'required|integer',
            'description' => 'nullable|string',
            'image' => 'nullable|string',
            'weight' => 'nullable|numeric',
            'length' => 'nullable|numeric',
            'width' => 'nullable|numeric',
            'height' => 'nullable|numeric',
            'qty' => 'nullable|numeric',
        ]);

        $packageShipment = Package_shipment::findOrFail($id);
        $packageShipment->update($request->all());

        return redirect()->route('package_shipments.index')
            ->with('message', 'Package shipment updated successfully.')
            ->with('icon', 'success');;
    }

    public function destroy($id)
    {
        $packageShipment = Package_shipment::findOrFail($id);
        $packageShipment->delete();

        return redirect()->route('package_shipments.index')
            ->with('message', 'Package shipment deleted successfully.')
            ->with('icon', 'success');
    }
}
