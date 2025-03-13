<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Receiver;
use App\Models\Branch;

class ReceiverController extends Controller
{
    // Display a listing of the receivers
    public function index()
    {
        return view('pages.receivers.index');
    }

    public function getReceivers()
    {
        $receivers = Receiver::select(['id', 'name', 'receiver_mobile', 'branch_id', 'receiver_address'])
        ->orderBy('id', 'desc')
        ->get();
        return response()->json(['data' => $receivers]);
    }

    public function getReceivers2($id)
    {
        $receivers = Receiver::where('branch_id', $id)
        ->orderBy('id', 'desc')
        ->get();
        return response()->json(['data' => $receivers]);
    }

    // Show the form for creating a new receiver
    public function create()
    {
        $branches = Branch::all();
        return view('pages.receivers.create', compact('branches'));
    }

    // Store a newly created receiver in storage
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'country_code' => 'nullable|string|max:5',
            'receiver_address' => 'nullable|string',
            'receiver_mobile' => 'nullable|string|max:15',
            'branch_id' => 'nullable|exists:branches,id',
        ]);

        Receiver::create($validated);

        return redirect()->route('pages.receivers.index')
        ->with('message', 'Receiver created successfully.')
        ->with('icon', 'success');
    }

    // Show the form for editing the specified receiver
    public function edit($id)
    {
        $receiver = Receiver::findOrFail($id);
        $branches = Branch::all();
        return view('pages.receivers.edit', compact('receiver', 'branches'));
    }

    // Update the specified receiver in storage
    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'country_code' => 'nullable|string|max:5',
            'receiver_address' => 'nullable|string',
            'receiver_mobile' => 'nullable|string|max:15',
            'branch_id' => 'nullable|exists:branches,id',
        ]);

        $receiver = Receiver::findOrFail($id);
        $receiver->update($validated);

        return redirect()->route('pages.receivers.index')
        ->with('message', 'Receiver updated successfully.')
        ->with('icon', 'success');;
    }

    // Remove the specified receiver from storage
    public function destroy($id)
    {
        $receiver = Receiver::findOrFail($id);
        $receiver->delete();

        return redirect()->route('pages.receivers.index')
        ->with('message', 'Receiver deleted successfully.')
        ->with('icon', 'success');
    }
}