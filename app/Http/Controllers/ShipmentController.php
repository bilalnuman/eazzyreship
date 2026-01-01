<?php

namespace App\Http\Controllers;

use App\Models\Shipment;
use App\Models\Branch;
use App\Models\Client;
use App\Models\Client_address;
use App\Models\User;
use App\Models\Receiver;
use Illuminate\Support\Facades\DB;
use App\Models\Client_shipment_log;
use App\Models\Package_shipment;
use App\Models\Package;
use App\Models\Mission;
use App\Models\Shipment_setting;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;
use Illuminate\Support\Facades\Mail;
use App\Mail\ShipmentCreatedMail;
use App\Mail\ShipmentStatusUpdated;
use App\Models\ShipmentAttachment;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

use Auth;

class ShipmentController extends Controller
{

    public function index()
    {
        return view('pages.shipments.index');
    }

    public function getShipments()
    {
        $shipments = Shipment::with([
            'fromBranch:id,name',
            'toBranch:id,name',
            'receiver:id,name',
            'client:id,name',
            'status:id,name',
            'mission:id,code'
        ])
            ->select([
                'id',
                'code',
                'status_id',
                'client_id',
                'receiver_name',
                'from_branch_id',
                'to_branch_id',
                'shipping_date',
                'mission_id',
                'paid',
                'type',
                'carrier',
                'amount_to_be_collected',
                'barcode',
                'created_at'
            ])
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
                    'carrier' => $shipment->carrier,
                    'barcode' => $shipment->barcode,
                    'total_cost' => $shipment->amount_to_be_collected,
                    'created_at' => $shipment->created_at ? Carbon::parse($shipment->created_at)->format('d-m-Y') : 'N/A',
                    'type' => $shipment->type == 1 ? 'Air' : 'Ocean',
                    'paid' => $shipment->paid,
                ];
            });

        return response()->json(['data' => $shipments]);
    }

    public function getShipments2($shipment_id)
    {
        $shipment = Shipment::with('fromBranch:id,name', 'toBranch:id,name', 'client:id,name', 'receiver:id,name')
            ->select([
                'id',
                'code',
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
                'barcode',
                'order_id',
                'paid',
                'tax',
                'insurance',
                'discount',
                'hazmat',
                'imo',
                'handling',
                'sed',
                'shipping_cost',
                'return_cost',
                'total_weight',
                'amount_to_be_collected',
                'created_at'
            ])
            ->find($shipment_id); // Busca un solo envío por su ID

        if (!$shipment) {
            return response()->json(['message' => 'Shipment not found'], 404);
        }

        // Formatear el objeto obtenido
        $formattedShipment = [
            'id' => $shipment->id,
            'code' => $shipment->code,
            'status_id' => $shipment->status_id,
            'type' => $shipment->type == 1 ? 'Air' : 'Ocean',
            'shipping_date' => $shipment->shipping_date,
            'collection_time' => $shipment->collection_time ?? '',
            'client_id' => optional($shipment->client)->name ?? 'N/A',
            'receiver_name' => optional($shipment->receiver)->name ?? 'N/A',
            'receiver_address' => $shipment->receiver_address ?? 'N/A',
            'from_branch_id' => optional($shipment->fromBranch)->name ?? 'N/A',
            'to_branch_id' => optional($shipment->toBranch)->name ?? 'N/A',
            'payment_type' => $shipment->payment_type ?? 'N/A',
            'barcode' => $shipment->barcode ?? '',
            'order_id' => $shipment->order_id ?? '',
            'paid' => $shipment->paid ?? '',
            'tax' => $shipment->tax ?? '0',
            'insurance' => $shipment->insurance ?? '0',
            'discount' => $shipments->discount ?? '0',
            'hazmet' => $shipments->hazmet ?? '0',
            'imo' => $shipments->imo ?? '0',
            'handling' => $shipments->handling ?? '0',
            'sed' => $shipments->sed ?? '0',

            'shipping_cost' => $shipment->shipping_cost ?? '0',
            'return_cost' => $shipment->return_cost ?? '0',
            'total_weight' => $shipment->total_weight ?? '1',
            'amount_to_be_collected' => $shipment->amount_to_be_collected ?? '',
            'created_at' => $shipment->created_at ?? '',
        ];

        return response()->json(['data' => $formattedShipment]);
    }

    public function invoice($id)
    {
        $shipment = Shipment::where('id', $id)->first();
        $client = Client::select('name', 'id', 'mobile', 'national_id')
            ->with('addresses:address,client_id')
            ->find($shipment->client_id);
        $packages = Package_shipment::where('shipment_id', $id)->get();
        $company = Branch::where('id', 6)->first();
        $inv = PDF::loadView('pages.shipments.invoice', compact('shipment', 'packages', 'company', 'client'));
        return $inv->stream();
    }

    public function label($id, $mode = 'single')
    {
        $printMode = $mode;
        $shipment = Shipment::where('id', $id)->first();
        $client = Client::select('code', 'name', 'id', 'mobile', 'national_id')
            ->with('addresses:address,client_id')
            ->find($shipment->client_id);
        $packages = Package_shipment::where('shipment_id', $id)->get();
        $company = Branch::where('id', 6)->first();
        $inv = PDF::loadView('pages.shipments.label', compact('shipment', 'packages', 'company', 'client', 'printMode'));
        $inv->setPaper([0, 0, 576, 432]);
        return $inv->stream();
    }

    public function create()
    {
        //$clients = Client::pluck('name', 'id', 'address', 'mobile', );
        $clients = Client::with('addresses:client_id,address')
            ->select("email", 'name', 'id', 'mobile', 'branch_id')->get();

        $excludedBranchIds1 = [1, 2, 3, 4, 5]; // IDs a excluir
        $branches0 = Branch::whereNotIn('id', $excludedBranchIds1)->pluck('name', 'id');
        $excludedBranchIds2 = [6];
        //$branches = Branch::whereNotIn('id', $excludedBranchIds2)->pluck('name', 'id');
        $branches = Branch::whereNotIn('id', $excludedBranchIds2)->get();
        $packages = Package::pluck('name', 'id');
        $missions = Mission::where('status_id', 1)->pluck('code', 'id');
        $receivers = Receiver::all();


        return view('pages.shipments.create', compact('clients', 'branches0', 'branches', 'receivers', 'packages', 'missions'));
    }

    public function store(Request $request, $token = null)
    {

        if (isset($token)) {
            $user = User::where('password', $token)->first();
            $prefix = Shipment_setting::where('key', 'shipment_prefix_ex')->first();

            //$userClient = Client::where('user_id',$user->id)->first();
        } else {
            $user = auth()->user();
            $prefix = Shipment_setting::where('key', 'shipment_prefix_lo')->first();
        }

        if (!isset($user)) {
            if (isset($token)) {
                return response()->json(['message' => new \Exception()]);
            } else {
                return redirect()->route('pages.shipments.index')
                    ->with('message', 'Error to create shipment.')
                    ->with('icon', 'error');
            }
        }
        if ($request->has('attachments_before_shipping')) {
            $request->validate([
                'attachments_before_shipping.*' => 'nullable|mimes:jpg,jpeg,png,pdf|max:4096',
            ]);
        }

        $validated = $request->validate([
            'code' => 'nullable|string',
            'type' => 'required|in:1,2',
            'mission_id' => 'nullable|integer',
            'from_branch_id' => 'required|integer',
            'to_branch_id' => 'required|integer',
            'client_id' => 'required|integer',
            "client_email" => 'required|email',
            'receiver_name' => 'nullable|string',
            'receiver_mobile' => 'nullable|string',
            'receiver_address' => 'nullable|string',
            'tax' => 'nullable|numeric|min:0',
            'insurance' => 'nullable|numeric|min:0',
            'discount' => 'nullable|numeric|min:0',
            'hazmat' => 'nullable|numeric|min:0',
            'imo' => 'nullable|numeric|min:0',
            'handling' => 'nullable|numeric|min:0',
            'sed' => 'nullable|numeric|min:0',
            'shipping_cost' => 'nullable|numeric|min:0',
            'return_cost' => 'nullable|numeric|min:0',
            'total_weight' => 'nullable|numeric',
            'order_id' => 'nullable|string',
            'amount_to_be_collected' => 'nullable|numeric|min:0.1',
            'carrier' => 'nullable|string',
            'volumetric_weight' => 'numeric',
            'packages.*.package_id' => 'required|integer',
            'packages.*.description' => 'nullable|string',
            'packages.*.notes' => 'nullable|string',
            'packages.*.value' => 'nullable|numeric|min:0.1',
            'packages.*.weight' => 'required|numeric|min:0.1',
            'packages.*.length' => 'required|numeric|min:0.1',
            'packages.*.width' => 'required|numeric|min:0.1',
            'packages.*.height' => 'required|numeric|min:0.1',
            'packages.*.qty' => 'required|integer|min:1',
        ]);

        //$prefix = Shipment_setting::where('key', 'shipment_prefix_lo')->first();
        //$request->offsetUnset('attachments_before_shipping.*');

        DB::beginTransaction();
        try {
            $shipment = Shipment::create($validated);

            if ($token) {

                $order = $request['order_id'];
                $parts = explode('-', $order);

                if (isset($parts[1]) && $parts[1] !== 'NA') {
                    $subparts = explode("\x1D", $parts[1]);
                    $shipment->update(['order_id' => $subparts[1] ?? null]);
                } else {
                    $shipment->update(['order_id' => null]);
                }

                $code = $parts[0];
                $barcode = $parts[1] ?? null;
                $shipment->update(['code' => $prefix->value . $code, 'barcode' => $barcode]);
            } else {
                $shipment->update(['code' => $prefix->value . $shipment->id]);
            }

            /*if ($request->hasFile('carrier_doc')) {
                $path = $request->file('carrier_doc')->store('shippers', 's3');
                $shipment->update(['carrier_doc' => $path]);
            }*/

            if ($request->hasFile('attachments_before_shipping')) {
                foreach ($request->file('attachments_before_shipping') as $file) {
                    $path = $file->store('attachments', 's3'); // Guardar archivo

                    // Guardar la ruta en la tabla de adjuntos
                    ShipmentAttachment::create([
                        'shipment_id' => $shipment->id,
                        'file_path' => $path,
                    ]);
                }
            }

            if ($request->has('capturedImages')) {
                $images = json_decode($request->input('capturedImages'), true);

                if (is_array($images)) {
                    foreach ($images as $key => $imageData) {
                        try {
                            // Validar que la imagen tenga el formato base64 correcto
                            if (preg_match('/^data:image\/png;base64,/', $imageData)) {
                                $image = str_replace('data:image/png;base64,', '', $imageData);
                                $image = base64_decode($image); // Decodificar la imagen

                                if ($image === false) {
                                    throw new \Exception("Error al decodificar la imagen base64");
                                }

                                // Crear un nombre de archivo único
                                $imageName = 'shipment_' . time() . "_{$key}.png";

                                // Guardar la imagen utilizando el almacenamiento de Laravel
                                $path = 'attachments/' . $imageName;
                                //\Storage::disk('public')->put($path, $image); // Guardar el archivo decodificado
                                \Storage::disk('s3')->put($path, $image);
                                \Log::info("Intentando guardar la imagen para el shipment ID: {$shipment->id}");

                                // Verificar si el archivo realmente fue guardado
                                if (!\Storage::disk('s3')->exists($path)) {
                                    \Log::info("No se pudo guardar la imagen en el disco public");
                                    throw new \Exception("No se pudo guardar la imagen en el disco 'public'");
                                }

                                // Guardar la ruta en la tabla de adjuntos
                                ShipmentAttachment::create([
                                    'shipment_id' => $shipment->id,
                                    'file_path' => $path,
                                ]);
                            }
                        } catch (\Exception $e) {
                            \Log::error("Error al guardar imagen capturada: {$e->getMessage()}");
                        }
                    }
                }
            }

            if ($request->has('captured_image') && !empty($request->captured_image)) {
                if (preg_match('/^data:image\/png;base64,/', $request->captured_image)) {
                    $image = $request->captured_image;
                    $image = str_replace('data:image/png;base64,', '', $image);
                    $image = str_replace(' ', '+', $image);
                    $imageName = 'shipper_' . uniqid() . '.png';
                    $path = 'shippers/' . $imageName;
                    // Guardar la imagen en S3 o en storage local
                    Storage::disk('s3')->put($path, base64_decode($image));
                    $shipment->update(['carrier_doc' => $path]);
                }
            }


            Client_shipment_log::create([
                'from' => 1,
                'to' => 1,
                'created_by' => $user->id,
                'shipment_id' => $shipment->id,
            ]);

            // Store packages
            if (isset($request->packages) && count($request->packages) > 0) {
                foreach ($request->packages as $package) {
                    $shipment->packages()->create($package); // Asociamos los paquetes con el envío
                }
            }

            DB::commit();
            if ($token) {
                $message = $shipment->code;
                return $message;
            }
            if ($shipment->client && $shipment->client->email) {
                Mail::to($request->client_email)->send(new ShipmentCreatedMail($shipment));
            }
            return redirect()->route('pages.shipments.index')
                ->with('message', 'Client created successfully.')
                ->with('icon', 'success');
        } catch (\Exception $e) {
            DB::rollBack();
            \Log::error('Shipment store error:', ['error' => $e->getMessage()]);
            if ($token) {
                return 'bad';
            }
            return redirect()->back()
                ->with('message', 'An error occurred while updating the Shipment.' . $e->getMessage())
                ->with('icon', 'error')
                ->withInput();
        }
    }

    public function storeFromApi(Request $request, $token = null)
    {
        if (isset($token)) {
            $user = User::where('password', $token)->first();
            $prefix = Shipment_setting::where('key', 'shipment_prefix_ex')->first();
        }

        if (!isset($user)) {
            if (isset($token)) {
                return response()->json(['message' => new \Exception()]);
            }
        }

        \Log::info("Receiving data from webhook", ['data' => $request->all()]);

        // Validar solo los datos que recibimos del webhook
        $validated = Validator::make($request->all(), [
            'Barcode' => 'nullable|string',
            'id' => 'required|numeric',
            'height' => 'required|string',
            'length' => 'required|string',
            'width' => 'required|string',
            'volumetricWeight' => 'nullable|string',
            'actualWeight' => 'nullable|string',
        ]);

        if ($validated->fails()) {
            return response()->json([
                'message' => 'validation error',
                'errors' => $validated->errors(),
            ], 422);
        }

        DB::beginTransaction();
        try {
            $shipment = new Shipment();
            $shipment->type = 1;
            $shipment->from_branch_id = 6;
            $shipment->to_branch_id = 1;
            $shipment->client_id = 1;
            $shipment->receiver_name = "1";
            $shipment->receiver_mobile = "7215809210";
            $shipment->receiver_address = "Pondfill";
            $shipment->total_weight = floatval($request->actualWeight);

            $shipment->barcode = $request->Barcode;
            $parts1 = explode("\x1D", $request->Barcode);
            $shipment->order_id = $parts1[1] ?? null;
            $shipment->code = $prefix->value . $request->id;

            $shipment->save();

            Client_shipment_log::create([
                'from' => 1,
                'to' => 1,
                'created_by' => $user->id,
                'shipment_id' => $shipment->id,
            ]);

            $package = new Package_shipment();
            $package->package_id = 1; // Asignamos un ID por defecto
            $package->shipment_id = $shipment->id;
            $package->height = $request->height;
            $package->weight = $request->actualWeight;
            $package->length = $request->length;
            $package->width = $request->width;
            $package->qty = 1; // Suponemos que siempre es 1
            $package->save();

            DB::commit();
            $message = $shipment->code;
            return $message;
        } catch (\Exception $e) {
            DB::rollBack();
            \Log::error('Shipment store error:', ['error' => $e->getMessage()]);
            return 'bad';
        }
    }

    public function storeAPI(Request $request)
    {
        try {
            $user = User::where('password', $request->header('token'))->first();
            if ($user) {
                $message = $this->storeFromApi($request, $request->header('token'));
                return response()->json(['message' => $message]);
            } else {
                return response()->json(['message' => 'Not Authorized']);
            }
        } catch (\Exception $e) {

            return $e->getMessage();
        }
    }

    /**
     * Display the specified shipment.
     */

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
                'carrier',
                'shipping_date',
                'collection_time',
                'payment_type',
                'payment_method_id',
                'barcode',
                'order_id',
                'paid',
                'tax',
                'insurance',
                'discount',
                'hazmat',
                'imo',
                'handling',
                'sed',
                'shipping_cost',
                'return_cost',
                'total_weight',
                'amount_to_be_collected',
                'created_at'
            ])
            ->find($id); // Busca un solo envío por su ID
        $attachments = $shipments->attachments ?? '';
        if (!$shipments) {
            return redirect()->route('dashboard')
                ->with('message', 'Shipment not found')
                ->with('icon', 'error')
                ->withInput();
            //return response()->json(['message' => 'Shipment not found'], 404);
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
            'receiver_name' => optional($shipments->toBranch)->address ?? 'N/A',
            'receiver_address' => $shipments->receiver_address ?? 'N/A',
            'from_branch_id' => optional($shipments->fromBranch)->name ?? 'N/A',
            'from_branch_state' => optional($shipments->fromBranch->state)->name ?? 'N/A',
            'from_branch_country' => optional($shipments->fromBranch->state->country)->name ?? 'N/A',
            'to_branch_id' => optional($shipments->toBranch)->name ?? 'N/A',
            'to_branch_state' => optional($shipments->toBranch->state)->name ?? 'N/A',
            'to_branch_country' => optional($shipments->toBranch->state->country)->name ?? 'N/A',
            'carrier' => $shipments->carrier,
            'payment_type' => $shipments->payment_type ?? 'N/A',
            'payment_method_id' => $shipments->payment_method_id ?? '',
            'barcode' => $shipments->barcode ?? '',
            'order_id' => $shipments->order_id ?? '',
            'paid' => $shipments->paid ?? '',
            'tax' => $shipments->tax ?? '0',
            'insurance' => $shipments->insurance ?? '0',
            'discount' => $shipments->discount ?? '0',
            'hazmat' => $shipments->hazmet ?? '0',
            'imo' => $shipments->imo ?? '0',
            'handling' => $shipments->handling ?? '0',
            'sed' => $shipments->sed ?? '0',
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

        return view('pages.shipments.show', compact('shipment', 'packages', 'attachments'));
    }

    /**
     * Show the form for editing the specified shipment.
     */
    public function edit($id)
    {
        $clients = Client::with('addresses:client_id,address')
            ->select('name', 'id', 'mobile', 'branch_id')->get();

        //$excludedBranchIds1 = [1, 2, 3, 4, 5]; // IDs a excluir
        //$branches0 = Branch::whereNotIn('id', $excludedBranchIds1)->pluck('name', 'id');
        $branches0 = Branch::where('id', 6)->pluck('name', 'id');

        $excludedBranchIds2 = [6]; // IDs a excluir
        //$branches = Branch::whereNotIn('id', $excludedBranchIds2)->pluck('name', 'id');
        $branches = Branch::whereNotIn('id', $excludedBranchIds2)->get();
        $packages = Package::pluck('name', 'id');
        $missions = Mission::where('status_id', 1)->pluck('code', 'id');
        $receivers = Receiver::all();
        //$shipment = Shipment::findOrFail($id);
        $shipment = Shipment::with('client')->findOrFail($id);
        $client_address = Client_address::where('client_id', $shipment->client_id)
            ->orderBy('id', 'desc')
            ->first();

        $package_shipments = Package_shipment::where('shipment_id', $id)->get();

        return view('pages.shipments.edit', compact('shipment', 'branches0', 'branches', 'clients', 'receivers', 'packages', 'package_shipments', 'missions', 'client_address'));
    }

    /**
     * Update the specified shipment in storage.
     */
    public function update(Request $request, $id)
    {
        if ($request->has('attachments_before_shipping')) {
            $request->validate([
                'attachments_before_shipping.*' => 'nullable|mimes:jpg,jpeg,png,pdf|max:4096',
            ]);
        }
        /*if ($request->has('carrier_doc')) {
            $request->validate([
                'carrier_doc' => 'nullable|mimes:jpg,jpeg,png,pdf|max:2048',
            ]);
        }*/

        $validated = $request->validate([
            'code' => 'nullable|string',
            'type' => 'required|in:1,2',
            'mission_id' => 'nullable|integer',
            'from_branch_id' => 'required|integer',
            'to_branch_id' => 'required|integer',
            'client_id' => 'required|integer',
            'receiver_name' => 'nullable|string',
            'receiver_mobile' => 'nullable|string',
            'receiver_address' => 'nullable|string',
            'tax' => 'nullable|numeric|min:0',
            'insurance' => 'nullable|numeric|min:0',
            'discount' => 'nullable|numeric|min:0',
            'hazmat' => 'nullable|numeric|min:0',
            'imo' => 'nullable|numeric|min:0',
            'handling' => 'nullable|numeric|min:0',
            'sed' => 'nullable|numeric|min:0',
            'shipping_cost' => 'nullable|numeric|min:0',
            'return_cost' => 'nullable|numeric|min:0',
            'total_weight' => 'nullable|numeric',
            'order_id' => 'nullable|string',
            'amount_to_be_collected' => 'nullable|numeric',
            'carrier' => 'nullable|string',


            'packages.*.package_id' => 'required|integer',
            'packages.*.description' => 'nullable|string',
            'packages.*.notes' => 'nullable|string',
            'packages.*.value' => 'nullable|numeric|min:0.1',
            'packages.*.weight' => 'required|numeric|min:0.1',
            'packages.*.length' => 'required|numeric|min:0.1',
            'packages.*.width' => 'required|numeric|min:0.1',
            'packages.*.height' => 'required|numeric|min:0.1',
            'packages.*.qty' => 'required|integer|min:1',
        ]);

        DB::beginTransaction();
        try {
            // Find shipment by ID
            $shipment = Shipment::findOrFail($id);
            // Update shipment
            $shipment->update($validated);

            // Update or add packages
            if (isset($request->packages) && count($request->packages) > 0) {
                // Assuming you want to clear existing packages before adding new ones
                $shipment->packages()->delete();

                foreach ($request->packages as $package) {
                    $shipment->packages()->create($package); // Asociamos los paquetes con el envío
                }
            }

            /*if ($request->hasFile('carrier_doc')) {
                if (isset($shipment->carrier_doc) && !empty($shipment->carrier_doc)) {
                    Storage::disk('s3')->delete($shipment->carrier_doc); //'public'
                }

                $path = $request->file('carrier_doc')->store('shippers', 's3');
                $shipment->update(['carrier_doc' => $path]);
            }*/
            if ($request->has('captured_image') && !empty($request->captured_image)) {
                if (isset($shipment->carrier_doc) && !empty($shipment->captured_image)) {
                    Storage::disk('s3')->delete($shipment->carrier_doc); //'public'
                }

                if (preg_match('/^data:image\/png;base64,/', $request->captured_image)) {
                    $image = $request->captured_image;
                    $image = str_replace('data:image/png;base64,', '', $image);
                    $image = str_replace(' ', '+', $image);
                    $imageName = 'shipper_' . uniqid() . '.png';
                    $path = 'shippers/' . $imageName;
                    // Guardar la imagen en S3 o en storage local
                    Storage::disk('s3')->put($path, base64_decode($image));
                    $shipment->update(['carrier_doc' => $path]);
                }
            }

            if ($request->hasFile('attachments_before_shipping')) {
                foreach ($request->file('attachments_before_shipping') as $file) {
                    $path = $file->store('attachments', 's3'); // Guardar archivo antes 'public'

                    // Guardar la ruta en la tabla de adjuntos
                    ShipmentAttachment::create([
                        'shipment_id' => $shipment->id,
                        'file_path' => $path,
                    ]);
                }
            }

            if ($request->has('capturedImages')) {
                $images = json_decode($request->input('capturedImages'), true);

                if (is_array($images)) {
                    foreach ($images as $key => $imageData) {
                        try {
                            // Validar que la imagen tenga el formato base64 correcto
                            if (preg_match('/^data:image\/png;base64,/', $imageData)) {
                                $image = str_replace('data:image/png;base64,', '', $imageData);
                                $image = base64_decode($image); // Decodificar la imagen

                                if ($image === false) {
                                    throw new \Exception("Error al decodificar la imagen base64");
                                }

                                // Crear un nombre de archivo único
                                $imageName = 'shipment_' . time() . "_{$key}.png";

                                // Guardar la imagen utilizando el almacenamiento de Laravel
                                $path = 'attachments/' . $imageName;
                                //\Storage::disk('public')->put($path, $image);
                                \Storage::disk('s3')->put($path, $image); // Guardar el archivo decodificado
                                \Log::info("Intentando guardar la imagen para el shipment ID: {$shipment->id}");

                                // Verificar si el archivo realmente fue guardado
                                if (!\Storage::disk('s3')->exists($path)) {
                                    throw new \Exception("No se pudo guardar la imagen en el disco 'public'");
                                }

                                // Guardar la ruta en la tabla de adjuntos
                                ShipmentAttachment::create([
                                    'shipment_id' => $shipment->id,
                                    'file_path' => $path,
                                ]);
                            }
                        } catch (\Exception $e) {
                            \Log::error("Error al guardar imagen capturada: {$e->getMessage()}");
                        }
                    }
                }
            }

            DB::commit();
            Mail::to($shipment->client->email)->send(new ShipmentCreatedMail($shipment));
            return redirect()->route('pages.shipments.index')
                ->with('message', 'Shipment updated successfully.')
                ->with('icon', 'success');
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->back()
                ->with('message', 'An error occurred while updating the shipment. ' . $e->getMessage())
                ->with('icon', 'error')
                ->withInput();
        }
    }

    /**
     * Remove the specified shipment from storage.
     */
    public function destroy($id)
    {
        DB::beginTransaction();
        try {
            // Delete related package shipments
            Package_shipment::where('shipment_id', $id)->delete();

            // Delete client shipment logs
            Client_shipment_log::where('shipment_id', $id)->delete();

            $shipment = Shipment::findOrFail($id);
            // Delete shipment
            $shipment->delete();

            DB::commit();
            return redirect()->route('shipments.index')
                ->with('message', 'Shipment deleted successfully.')
                ->with('icon', 'success');
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->back()
                ->with('message', 'Failed to delete shipment' . $e->getMessage())
                ->with('icon', 'error');
        }
    }

    //update el status del paquete y client para tracking
    public function clientUpdate(Request $request)
    {
        // Validar que el client_id es requerido y existe en la base de datos
        $request->validate([
            'client_id' => 'required|string|min:3|max:50',
            'shipment_id' => 'required',
        ]);

        try {
            DB::beginTransaction();

            $shipment_id = $request->input('shipment_id');

            // Obtener el shipment por su ID
            $shipment = Shipment::where('code', $shipment_id)->first();

            // Obtener el client_id desde la solicitud POST
            $client_id = $request->input('client_id');

            //$client_id = preg_replace('/[^0-9]/', '', $idt);

            $client = Client::where('code', $client_id)->first();

            // Buscar el cliente en la base de datos utilizando el client_id
            $ClientAddress = Client_address::where('client_id', $client->id)->first();

            // Actualizar los campos del envío utilizando la información del cliente
            $shipment->status_id = 1;
            $shipment->client_id = $client->id;
            $shipment->phone = $client->mobile;
            $shipment->name = $client->name; // Asumimos que el nombre del receptor es el mismo que el del cliente
            $shipment->receiver_mobile = $client->mobile; // Asumimos que el teléfono del receptor es el mismo que el del cliente
            //$shipment->receiver_address = $ClientAddress->address;

            // Estos valores pueden ser específicos de tu lógica de negocio.
            //$shipment->from_branch_id = $ClientAddress->country_id ?? $shipment->from_branch_id;
            // Guardar los cambios en el modelo Shipment
            $shipment->save();

            // Crear una nueva entrada en la tabla client_shipment_logs
            DB::table('client_shipment_logs')->insert([
                'from' => 1,
                'to' => 2,
                'created_by' => $client->id,
                'shipment_id' => $shipment->id,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
            DB::commit();

            // Redirigir con un mensaje de éxito
            return response()->json([
                'message' => 'update exitosamente.',
            ]);
        } catch (\Exception $e) {
            // Revertir los cambios si ocurre un error
            DB::rollback();
            return response()->json([
                'message' => 'update fail.',
            ]);
        }
    }

    public function clientStatus(Request $request)
    {
        // Validar que client_id y shipment_id están presentes en la solicitud
        $request->validate([
            'status_id' => 'required|integer',
            'shipment_ids' => 'required|array|min:1',
            'shipment_ids.*' => 'string',
        ]);

        try {
            //$status = Client::find($request->input('status_id'));
            $status = $request->input('status_id');
            $shipment_ids = $request->input('shipment_ids');

            $updatedCount = 0;
            $errordCount = 0;
            //$failedShipments = [];

            DB::beginTransaction();
            foreach ($shipment_ids as $shipmentCode) {
                $shipment = Shipment::where('code', $shipmentCode)->first();

                if ($status && $shipment) {
                    // Crear una nueva entrada en la tabla client_shipment_logs
                    DB::table('client_shipment_logs')->insert([
                        'from' => $status - 1, // Cambia según sea necesario
                        'to' => $status,   // Cambia según sea necesario
                        'created_by' => $shipment->client_id,
                        'shipment_id' => $shipment->id,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ]);
                    $shipment->status_id = $status;
                    $shipment->save();
                    // Enviar correo al cliente
                    if ($shipment->client && $shipment->client->email) {
                        Mail::to($shipment->client->email)->send(new ShipmentStatusUpdated($shipment));
                    }

                    $updatedCount++;
                } else {
                    //$failedShipments[] = $shipmentCode;
                    $errordCount++;
                }
            }
            DB::commit();
            // Devolver una respuesta exitosa
            //$temp = implode(", ", $failedShipments);
            return response()->json([
                'message' => "Success: $updatedCount , error: $errordCount",
            ], 200);
        } catch (\Exception $e) {
            // Manejar cualquier excepción
            DB::rollBack();
            return response()->json([
                'message' => 'Error updating log:' . $e->getMessage(),
            ], 500);
        }
    }

    public function clientStatus2(Request $request)
    {
        return response()->json(['data' => 'This is an example from clients']);
    }

    //tracking
    public function track($code)
    {
        //$shipment = Shipment::with(['history'])->where('tracking_number', $code)->firstOrFail();
        if (empty($code)) {
            $error = __('Tracking code cannot be empty.');
            return view('web.tracking')->with(['error' => $error]);
        }

        try {
            // Buscar el envío por código, ID de pedido o código de barras
            $shipment = Shipment::with(['fromBranch:id,name', 'toBranch:id,name', 'status:id,name'])
                ->where('order_id', $code)
                ->orWhere('code', $code)
                ->orWhere('barcode', $code)
                ->first();

            // Si no encuentra en Shipment, buscar en package_shipment
            if (!$shipment) {
                $packageShipment = DB::table('package_shipments')->where('notes', $code)->first();

                if ($packageShipment) {
                    // Buscar el Shipment relacionado
                    $shipment = Shipment::with(['fromBranch:id,name', 'toBranch:id,name', 'status:id,name'])
                        ->where('id', $packageShipment->shipment_id)
                        ->first();
                }
            }

            if ($shipment) {
                // Obtener los registros de seguimiento asociados al envío
                $shipmentLogs = Client_shipment_log::with('status:id,name,description')
                    ->where('shipment_id', $shipment->id)
                    ->orderBy('id', 'desc')
                    ->get();

                return view('web.view-tracking', compact('shipment', 'shipmentLogs'));
            } else {
                // Envío no encontrado
                $error = __('Invalid Tracking code');
                return view('web.tracking')->with(['error' => $error]);
            }
        } catch (\Exception $e) {
            // Manejo de excepciones generales
            $error = __('An error occurred while tracking. Please try again.');
            return view('web.tracking')->with(['error' => $error]);
        }

        /*$shipment = (object) [
            'tracking_number' => 'ABC123456',
            'status' => 'in transit',
            'origin' => 'New York, USA',
            'destination' => 'Los Angeles, USA',
            'history' => [
                (object) ['location' => 'New York, USA', 'timestamp' => now()->subDays(3), 'description' => 'Package received at origin facility.'],
                (object) ['location' => 'Philadelphia, USA', 'timestamp' => now()->subDays(2), 'description' => 'Package departed from sorting facility.'],
                (object) ['location' => 'Los Angeles, USA', 'timestamp' => now()->subDay(), 'description' => 'Package arrived at destination facility.'],
            ],
        ];
        return view('web.view-tracking', compact('shipment'));*/
    }

    public function removeAttachment($shipment_id, $attachment_id)
    {
        $attach = ShipmentAttachment::where('id', $attachment_id)->where('shipment_id', $shipment_id)->first();

        if ($attach->shipment_id != $shipment_id) {
            abort(403, 'Unauthorized action.');
        }

        // Eliminar archivo físico
        Storage::disk('s3')->delete($attach->file_path);

        // Eliminar de la base de datos
        $attach->delete();

        return response()->json(['message' => 'Attachment removed successfully']);
    }

    //metodos para el consumo del api
    public function getShipmentInfo(Request $request)
    {
        $shipment_id = $request->input('shipment_id'); // Obtén el ID del envío desde el cuerpo de la solicitud

        $shipment = Shipment::with('fromBranch:id,name', 'toBranch:id,name', 'client:id,name', 'receiver:id,name', 'mission:id,due_date')
            ->select([
                'id',
                'code',
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
                'barcode',
                'order_id',
                'paid',
                'tax',
                'insurance',
                'discount',
                'hazmat',
                'imo',
                'handling',
                'sed',
                'shipping_cost',
                'return_cost',
                'total_weight',
                'amount_to_be_collected',
                'created_at'
            ])
            ->where('code', $shipment_id) // Filtrar por code
            ->first();

        if (!$shipment) {
            return response()->json(['message' => 'Shipment not found'], 404);
        }

        // Formatear el objeto obtenido
        $formattedShipment = [
            'id' => $shipment->id,
            'code' => $shipment->code,
            'status_id' => $shipment->status_id,
            'type' => $shipment->type == 1 ? 'Air' : 'Ocean',
            'client_id' => optional($shipment->client)->name ?? 'N/A',
            'receiver_name' => optional($shipment->receiver)->name ?? 'N/A',
            'receiver_address' => $shipment->receiver_address ?? 'N/A',
            'from_branch_id' => optional($shipment->fromBranch)->name ?? 'N/A',
            'to_branch_id' => optional($shipment->toBranch)->name ?? 'N/A',
            'shipping_date' => optional($shipment->mission)->due_date ?? "N/A",
            'collection_time' => $shipment->collection_time ?? '',
            'payment_type' => $shipment->payment_type ?? 'N/A',
            'barcode' => $shipment->barcode ?? '',
            'order_id' => $shipment->order_id ?? '',
            'paid' => $shipment->paid ?? '',
            'tax' => $shipment->tax ?? '0',
            'insurance' => $shipment->insurance ?? '0',
            'discount' => $shipment->discount ?? '0',
            'hazmat' => $shipments->hazmet ?? '0',
            'imo' => $shipments->imo ?? '0',
            'handling' => $shipments->handling ?? '0',
            'sed' => $shipments->sed ?? '0',
            'shipping_cost' => $shipment->shipping_cost ?? '0',
            'return_cost' => $shipment->return_cost ?? '0',
            'total_weight' => $shipment->total_weight ?? '1',
            'amount_to_be_collected' => $shipment->amount_to_be_collected ?? '',
            'created_at' => $shipment->created_at ?? '',
        ];

        return response()->json(['data' => $formattedShipment]);
    }

    public function searchShipments(Request $request)
    {
        $query = $request->input('query');

        if (!$query) {
            return response()->json(['message' => 'Query parameter is required'], 400);
        }

        $shipments = Shipment::where('code', 'LIKE', "%{$query}%")
            ->where('status_id', '!=', 5)
            ->limit(10) // Limita a 10 resultados
            ->get(['id', 'code']);

        return response()->json(['data' => $shipments]);
    }

    public function getAllShipments(Request $request)
    {
        $query = (int) $request->input('status');
        //$query = $request->input('status');

        if (!$query) {
            return response()->json(['message' => 'Query parameter is required'], 400);
        }

        $shipments = Shipment::where('status_id', '<=', $query - 1)
            ->get(['id', 'code']);

        return response()->json(['data' => $shipments]);
    }

    public function uploadImage(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:jpg,jpeg,png,pdf|max:2048',
            'shipment_id' => 'required|string',
        ]);
        $shipment_id = $request->input('shipment_id');
        $shipment = Shipment::where('code', $shipment_id)->first();

        if (!$shipment) {
            return response()->json(['message' => 'Shipment not found'], 404);
        }

        if ($request->hasFile('file')) {
            try {
                // Almacenar la imagen en el disco público
                $path = $request->file('file')->store('attachments', 'public');

                ShipmentAttachment::create([
                    'shipment_id' => $shipment->id,
                    'file_path' => $path,
                ]);

                return response()->json(['message' => 'Image uploaded successfully']);
            } catch (\Exception $e) {
                return response()->json(['message' => 'something went wrong', 'error' => $e->getMessage()], 500);
            }
        } else {
            return response()->json(['message' => 'No file uploaded'], 400);
        }
    }
}
