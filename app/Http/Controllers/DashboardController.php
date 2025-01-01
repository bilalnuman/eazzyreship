<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Shipment;
use App\Models\Client;
use Carbon\Carbon;

class DashboardController extends Controller
{

    public function index()
    {
       $user = auth()->user();
        if ($user->hasRole('admin')) {
            $allShipments = Shipment::count(); // Total general
            $savedShipments = Shipment::where('status_id', '1')->count();
            $inProgressShipments = Shipment::where('status_id', '3')->count();
            $deliveredShipments = Shipment::where('status_id', '5')->count();
            $client = null; // No aplica para admin
            
            return view('dashboard', compact('allShipments', 'savedShipments', 'inProgressShipments', 'deliveredShipments'));
        
        } elseif ($user->hasRole('user')) {
            // Lógica para client
            $allShipments = Shipment::where('client_id', $user->id)->count();
            $savedShipments = Shipment::where('client_id', $user->id)->where('status_id', '1')->count();
            $inProgressShipments = Shipment::where('client_id', $user->id)->where('status_id', '3')->count();
            $deliveredShipments = Shipment::where('client_id', $user->id)->where('status_id', '5')->count();
            $client = Client::where('user_id', $user->id)->first();

            return view('dashboard', compact('allShipments', 'savedShipments', 'inProgressShipments', 'deliveredShipments', 'client'));
        
        } else {
            // Para otros roles o no autenticados
            abort(403, 'No autorizado');
        }
    }

    public function getShipmentsDash($client_id = null)
    {
        $shipments = Shipment::with([
            'fromBranch:id,name',
            'toBranch:id,name',
            'receiver:id,name',
            'client:id,name',
            'status:id,name',
            'mission:id,code'
        ])
            ->select(['id', 'code', 'status_id', 'client_id', 'receiver_name', 'from_branch_id', 'to_branch_id', 'shipping_date', 'mission_id', 'paid'])
            ->where('client_id', $client_id)
            ->orderBy('id', 'desc')
            ->get()
            ->map(function ($shipment) {
                return [
                    'id' => $shipment->id,
                    'code' => $shipment->code,
                    'status_id' => optional($shipment->status)->name ?? 'N/A',
                    'shipping_date' => $shipment->shipping_date ? Carbon::parse($shipment->shipping_date)->format('d-m-Y') : 'N/A',
                    'from_branch_id' => optional($shipment->fromBranch)->name ?? 'N/A',
                    'to_branch_id' => optional($shipment->toBranch)->name ?? 'N/A',
                    'receiver_name' => optional($shipment->receiver)->name ?? 'N/A',
                    'client_id' => optional($shipment->client)->name ?? 'N/A',
                    'mission_id' => optional($shipment->mission)->code ?? '',
                    'paid' => $shipment->paid,
                ];
            });

        return response()->json(['data' => $shipments]);
    }
}
