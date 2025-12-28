<?php

namespace App\Http\Controllers;

use App\Models\Package;
use Illuminate\Http\Request;

class PackageController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $packages = Package::all();
        return view('pages.packages.index', compact('packages'));
    }
    public function getPackages()
    {
        $packages = Package::select(['id', 'name', 'cost'])
        ->orderBy('id', 'desc')
        ->get();
        return response()->json(['data' => $packages]);
    }
    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('pages.packages.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {
            $request->validate([
                'name' => 'required|string|max:255',
                'cost' => 'required|numeric|min:0',
            ]);

            Package::create($request->all());
            return redirect()->route('pages.packages.index')
                ->with('message', 'Package created successfully.')
                ->with('icon', 'success');
        } catch (\Exception $e) {
            \Log::error('Error updating shipment: ' . $e->getMessage());

            return redirect()->back()
                ->with('message', 'An error occurred while updating the shipment.')
                ->with('icon', 'error')
                ->withInput();
        }
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $package = Package::findOrFail($id);
        return view('pages.packages.show', compact('package'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $package = Package::findOrFail($id);
        return view('pages.packages.edit', compact('package'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        try {
            $request->validate([
                'name' => 'required|string|max:255',
                'cost' => 'required|numeric|min:0',
            ]);
            $package = Package::findOrFail($id);
            $package->update($request->all());

            return redirect()->route('pages.packages.index')
                ->with('message', 'Package updated successfully.')
                ->with('icon', 'success');
        } catch (\Exception $e) {
            \Log::error('Error updating shipment: ' . $e->getMessage());

            return redirect()->back()
                ->with('message', 'An error occurred while updating the shipment.')
                ->with('icon', 'error')
                ->withInput();
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $package = Package::findOrFail($id);
        $package->delete();

        return redirect()->route('pages.packages.index')
            ->with('message', 'Package deleted successfully.')
            ->with('icon', 'success');
    }
}
