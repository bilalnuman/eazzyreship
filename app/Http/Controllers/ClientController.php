<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Client;
use App\Models\ClientAddress;
use App\Models\Country;
use Illuminate\Support\Facades\Hash;
use Illuminate\Auth\Events\Registered;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

use App\Models\State;
use App\Models\Branch;

class ClientController extends Controller
{
    // Display a listing of the clients
    public function index()
    {
        //$clients = Client::with('addresses')->get();
        return view('pages.clients.index');
    }

    public function getClients()
    {
        $clients = Client::with('branch:id,name')
        ->select(['id', 'name', 'email', 'mobile', 'address', 'branch_id'])
        ->orderBy('id', 'desc')
        ->get()
        ->map(function($client){
            return[
                'id' => $client->id,
                'name' => $client->name,
                'email' => $client->email,
                'mobile' => $client->mobile,
                'address' => $client->address,
                'branch_id' =>$client->branch->name ?? '',
            ];
        });
        return response()->json(['data' => $clients]);
    }

    // Show the form for creating a new client
    public function create()
    {
        $countries = Country::pluck('name', 'id');
        $states = State::pluck('name', 'id');
        //$branches = Branch::pluck('name', 'id');
        $branches = Branch::with('country:id,iso2')
        ->whereNotIn('id', [6])
        ->get();

        return view('pages.clients.create', compact('countries', 'states', 'branches'));
    }

    // Store a newly created client in storage
    // public function store(Request $request)
    // {
    //     $request->validate([
    //         'name' => 'required|string|max:255',
    //         'email' => 'nullable|email|max:255',
    //         'mobile' => 'nullable|string|max:15',
    //         'national_id' => 'nullable|string',
    //         'picture' => 'nullable|mimes:jpg,jpeg,png,pdf|max:2048',
    //         'branch_id' => 'required|integer',
    //         'addresses.*.address' => 'nullable|string',
    //         'addresses.*.country_id' => 'required|exists:countries,id',
    //         'addresses.*.state_id' => 'required|exists:states,id',
    //         'branch_code' => ['required', 'string'],
    //     ]);
        
    //     //$parsedPhone = $this->parsePhoneNumber($request->phone);

    //     $user = User::create([
    //         'name' => $request->name,
    //         'email' => $request->email,
    //         'password' => Hash::make('password'),
    //         'role' => '4',
    //     ]);

    //     if ($user) {
    //         $user->assignRole('user');
    //     }



    //     $client = Client::create([
    //         'code' => '1',
    //         'user_id' => $user->id,
    //         'name' => $request->name,
    //         'email' => $request->email,
    //         'mobile' => $request->mobile,
    //         'branch_id' => $request->branch_id,
    //     ]);

    //     $client->update(['code' => $request->branch_code . $client->id]);

    //     if ($request->hasFile('picture')) {
    //         $path = $request->file('picture')->store('customers', 's3');
    //         $client->update(['picture' => $path]);
    //     }

    //     foreach ($request->addresses as $address) {
    //         $client->addresses()->create($address);
    //     }

    //     event(new Registered($user));
        
    //     $userData = [
    //     'id' => $client->id,
    //     'name' => $request->name,
    //     'email' => $request->email,
    //     'address' => "",
    //     'branch' => $request->branch_code,
    //     ];
        
    //     Http::post('https://shopandtake-9dcc127c6236.herokuapp.com/tekcore/registerLocation', $userData);

    //     return redirect()->route('pages.clients.index')
    //     ->with('message', 'Client created successfully.')
    //     ->with('icon', 'success');
    // }


    public function store(Request $request)
{
    $request->validate([
        'name' => 'required|string|max:255',
        'email' => 'nullable|email|max:255',
        'mobile' => 'nullable|string|max:15',
        'national_id' => 'nullable|string',
        'picture' => 'nullable|mimes:jpg,jpeg,png,pdf|max:2048',
        'branch_id' => 'required|integer',
        'addresses.*.address' => 'nullable|string',
        'addresses.*.country_id' => 'required|exists:countries,id',
        'addresses.*.state_id' => 'required|exists:states,id',
        'branch_code' => 'required|string',
    ]);

    // Create User
    $user = User::create([
        'name' => $request->name,
        'email' => $request->email,
        'password' => Hash::make('password'),
        'role' => '4',
    ]);

    $user->assignRole('user');

    // Create Client
    $client = Client::create([
        'code' => '1',
        'user_id' => $user->id,
        'name' => $request->name,
        'email' => $request->email,
        'mobile' => $request->mobile,
        'branch_id' => $request->branch_id,
    ]);

    $client->update(['code' => $request->branch_code . $client->id]);

    // Upload Picture to S3
    if ($request->hasFile('picture')) {
        $path = $request->file('picture')->store('customers', 's3');
        $client->update(['picture' => $path]);
    }

    // Create Addresses
    foreach ($request->addresses as $address) {
        $client->addresses()->create($address);
    }

    event(new Registered($user));

    // Data to send to external API
    $userData = [
        'id' => $client->id,
        'name' => $request->name,
        'email' => $request->email,
        'address' => "",
        'branch' => $request->branch_code,
    ];

    /**
     * ------------------------------------------------------
     *  FIXED PART → API CALL VIA BACKGROUND JOB (Non-blocking)
     * ------------------------------------------------------
     */
    dispatch(function () use ($userData) {

        try {
            Http::timeout(10)        // Max 10 sec
                ->retry(2, 1000)     // 2 retries, 1s delay
                ->post('https://shopandtake-9dcc127c6236.herokuapp.com/tekcore/registerLocation', $userData);
        } catch (\Exception $e) {
            // Log error (doesn't affect user)
            Log::error('TekTrack API Error: ' . $e->getMessage());
        }

    });

    // Instant response to user (no waiting)
    return redirect()->route('pages.clients.index')
        ->with('message', 'Client created successfully.')
        ->with('icon', 'success');
}

    // Show the form for editing the specified client
    public function edit($id)
    {
        $branches = Branch::with('country:id,iso2')->whereNotIn('id', [6])->get();
        $client = Client::with('addresses')->findOrFail($id);
        $countries = Country::pluck('name', 'id');
        $states = State::pluck('name', 'id');
        return view('pages.clients.edit', compact('client', 'countries', 'states', 'branches'));
    }

    // Update the specified client in storage
    public function update(Request $request, $id)
    {

        if ($request->has('picture')) {
            $request->validate([
                'picture' => 'nullable|mimes:jpg,jpeg,png,pdf|max:2048',
            ]);
        }

        $validated = $request->validate([
            'mobile' => 'nullable|string|max:15',
            'national_id' => 'nullable|string',
            'addresses.*.address' => 'nullable|string',
            'addresses.*.country_id' => 'required|exists:countries,id',
            'addresses.*.state_id' => 'required|exists:states,id',
        ]);

        $client = Client::findOrFail($id);
        $client->update($validated);

        if ($request->hasFile('picture')) {
            if(isset($client->picture) && !empty($client->picture)){
                Storage::disk('public')->delete($client->picture);
            }
            
            $path = $request->file('picture')->store('customers', 's3');
            $client->update(['picture' => $path]);  
        }


        $client->addresses()->delete();
        foreach ($request->addresses as $address) {
            $client->addresses()->create($address);
        }

        return redirect()->route('pages.clients.index')
        ->with('message', 'Client updated successfully.')
        ->with('icon', 'success');
    }

    // Remove the specified client from storage
    public function destroy($id)
    {
        $client = Client::findOrFail($id);
        $client->delete();

        return redirect()->route('pages.clients.index')
        ->with('message', 'Client deleted successfully.')
        ->with('icon', 'success');
    }
}

