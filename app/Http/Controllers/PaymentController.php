<?php

namespace App\Http\Controllers;

use App\Models\Payment;
use App\Models\Shipment;
use App\Models\User;
use App\models\Setting;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    public function index()
    {
        return view('pages.payments.index');
    }

    public function getPayments()
    {
        $payments = Payment::with('user','shipment')
        ->orderBy('id', 'desc')
        ->get();
        return response()->json(['data' => $payments]);
    }

    public function create($id)
    {
        $methods = Setting::where('group', 'payments')
            ->where('enabled', '1')
            ->pluck('name', 'id')
            ->toArray();

        $shipment = Shipment::with(['status:id,name'])
            ->select(['id', 'code', 'client_id', 'status_id', 'amount_to_be_collected', 'payment_method_id'])
            ->where('id', $id)
            ->first();

        if ($shipment) {
            $payment = [
                'id' => $shipment->id,
                'seller_id' => $shipment->client_id,
                'shipment_id' => $shipment->code ?? 'N/A',
                'amount' => $shipment->amount_to_be_collected ?? 'N/A',
                'payment_method' => $shipment->payment_method_id ?? 'N/A',
            ];
        } else {
            $payment = []; // Manejar el caso en que no se encuentren envíos
        }
        return view('pages.payments.create', compact('payment', 'methods'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'seller_id' => 'required|integer',
            'shipment_id' => 'required|integer|exists:shipments,id',
            'amount' => 'required|numeric|min:0',
            'payment_details' => 'nullable|string',
            'payment_method' => 'required|string',
            'txn_code' => 'nullable|string',
            'payment_date' => 'required|string'
        ]);

        DB::beginTransaction();

        try {
            // Crear el pago
            Payment::create($validated);

            // Actualizar el campo `paid` de la tabla `shipment`
            $shipment = Shipment::findOrFail($validated['shipment_id']);
            $shipment->paid = 1; // Asume que 1 significa "pagado"
            $shipment->save();

            DB::commit();

            return redirect()->route('pages.payments.index')
                ->with('message', 'Payment created successfully.')
                ->with('icon', 'success');
        } catch (\Exception $e) {
            DB::rollBack();
            \Log::error('Payment store error:', ['error' => $e->getMessage()]);
            return redirect()->back()
                ->with('message', 'An error occurred while processing the payment.')
                ->with('icon', 'error');
        }
    }

    public function show(Payment $payment)
    {
        return view('pages.payments.show', compact('payment'));
    }

    public function edit($id)
    {
        $methods = Setting::where('group', 'payments')
            ->where('enabled', '1')
            ->pluck('name', 'id')
            ->toArray();
            
        $sellers = User::all();
        //$shipments = Shipment::all();
        $payment = Payment::findOrFail($id);
        return view('pages.payments.edit', compact('payment', 'methods'));
    }

    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'seller_id' => 'required|integer',
            'payment_details' => 'nullable|string',
            'payment_method' => 'required|string',
            'amount' => 'required|numeric|min:0',
        ]);

        $payment = Payment::findOrFail($id);
        $payment->update($validated);
        return redirect()->route('payments.index')
            ->with('message', 'Payment updated successfully.')
            ->with('icon', 'success');
    }

    public function destroy(Payment $payment)
    {
        $payment->delete();
        return redirect()->route('payments.index')
            ->with('message', 'Payment deleted successfully.')
            ->with('icon', 'success');
    }
}
