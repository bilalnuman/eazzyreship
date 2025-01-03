<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Shipment;
use App\Models\Package_shipment;
use App\Models\Client;
use App\Models\Branch;
use App\Models\Country;
use App\Models\State;
use Barryvdh\DomPDF\Facade\Pdf;
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

    public function show($id)
    {
        $shipments = Shipment::with(
            'fromBranch.state.country:id,name',
            'toBranch.state.country:id,name',
            'client:id,name',
            'receiver:id,name',
            'status:id,name'
        )
            ->select([
                'id',
                'code',
                'order_id',
                'status_id',
                'type',
                'client_id',
                'receiver_name',
                'receiver_address',
                'from_branch_id',
                'to_branch_id',
                'shipping_date',
                'collection_time',
                'payment_type',
                'payment_method_id',
                'paid',
                'tax',
                'insurance',
                'shipping_cost',
                'return_cost',
                'total_weight',
                'amount_to_be_collected',
                'created_at'
            ])
            ->find($id); // Busca un solo envío por su ID

        if (!$shipments) {
            return response()->json(['message' => 'Shipment not found'], 404);
        }

        // Formatear el objeto obtenido
        $shipment = [
            'id' => $shipments->id,
            'code' => $shipments->code,
            'order_id' => $shipments->order_id ?? '',
            'status_id' => optional($shipments->status)->name ?? 'N/A',
            'type' => $shipments->type == 1 ? 'Air' : 'Ocean',
            'shipping_date' => $shipments->shipping_date,
            'collection_time' => $shipments->collection_time ?? '',
            'client_id' => optional($shipments->client)->name ?? 'N/A',
            'receiver_name' => optional($shipments->receiver)->name ?? 'N/A',
            'receiver_address' => $shipments->receiver_address ?? 'N/A',
            'from_branch_id' => optional($shipments->fromBranch)->name ?? 'N/A',
            'from_branch_state' => optional($shipments->fromBranch->state)->name ?? 'N/A',
            'from_branch_country' => optional($shipments->fromBranch->state->country)->name ?? 'N/A',
            'to_branch_id' => optional($shipments->toBranch)->name ?? 'N/A',
            'to_branch_state' => optional($shipments->toBranch->state)->name ?? 'N/A',
            'to_branch_country' => optional($shipments->toBranch->state->country)->name ?? 'N/A',
            'payment_type' => $shipments->payment_type ?? 'N/A',
            'payment_method_id' => $shipments->payment_method_id ?? '',
            'paid' => $shipments->paid ?? '',
            'tax' => $shipments->tax ?? '0',
            'insurance' => $shipments->insurance ?? '0',
            'shipping_cost' => $shipments->shipping_cost ?? '0',
            'return_cost' => $shipments->return_cost ?? '0',
            'total_weight' => $shipments->total_weight ?? '1',
            'amount_to_be_collected' => $shipments->amount_to_be_collected ?? '',
            'created_at' => $shipments->created_at ?? '',
        ];


        //$shipment = Shipment::where('id', $id)->first();
        //$packages = Package_shipment::where('shipment_id', $id)->get();
        $packages = Package_shipment::with('package:id,name') // Asegúrate de seleccionar solo lo necesario
            ->where('shipment_id', $id)
            ->get();

        return view('pages.shipments.show', compact('shipment', 'packages'));
    }

    public function invoice($id)
    {

        $shipment = Shipment::where('id', $id)->first();
        $packages = Package_shipment::where('shipment_id', $id)->get();
        $company = Branch::where('id', 1)->first();
        $inv = PDF::loadView('pages.shipments.invoice', compact('shipment', 'packages', 'company'));
        return $inv->stream();
    }

    public function editClient()
    {
        $client = Client::where('user_id', auth()->id())->firstOrFail();

        if (!isset($client)) {
            abort(403, 'Unauthorized action.');
        }
        
        $branches = Branch::with('country:id,iso2')->whereNotIn('id', [6])->get();
        $client = Client::with('addresses')->findOrFail($client->id);
        $countries = Country::pluck('name', 'id');
        $states = State::pluck('name', 'id');
        return view('pages.clients.edit', compact('client', 'countries', 'states', 'branches'));
    }

    // Update the specified client in storage
    public function updateClient(Request $request)
    {
        $client = Client::where('user_id', auth()->id())->firstOrFail();

        if (!isset($client)) {
            abort(403, 'Unauthorized action.');
        }

        $validated = $request->validate([
            'mobile' => 'nullable|string|max:15',
            'addresses.*.address' => 'nullable|string',
            'addresses.*.country_id' => 'required|exists:countries,id',
            'addresses.*.state_id' => 'required|exists:states,id',
        ]);

        //$client = Client::findOrFail($id);
        $client->update($validated);

        $client->addresses()->delete();
        foreach ($request->addresses as $address) {
            $client->addresses()->create($address);
        }

        return redirect()->back()
        ->with('message', 'Client updated successfully.')
        ->with('icon', 'success');
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
