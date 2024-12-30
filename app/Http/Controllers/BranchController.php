<?php

namespace App\Http\Controllers;

use App\Models\Branch;
use App\Models\Country;
use App\Models\State;
use Illuminate\Http\Request;


class BranchController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('pages.branches.index');
    }

    public function getBranches()
    {
        $branches = Branch::select(['id', 'name', 'email', 'responsible_mobile', 'address', 'created_at'])
        ->orderBy('id', 'desc')
        ->get();
        return response()->json(['data' => $branches]);
    }
    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $countries = Country::pluck('name', 'id'); // modelo correspondiente
        $states = State::pluck('name', 'id');
        return view('pages.branches.create', compact('countries', 'states'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {
            $validated = $request->validate([
                'name' => 'required|string|max:255',
                'email' => 'nullable|email|max:255',
                'responsible_mobile' => 'nullable|string|max:15',
                'country_id' => 'required|integer',
                'state_id' => 'required|integer',
                'area_id' => 'nullable|integer',
                'address' => 'required|string|max:255',
            ]);

            Branch::create($validated);
            return redirect()->route('pages.branches.index')
                ->with('message', 'Branch created successfully.')
                ->with('icon', 'success');
        } catch (\Exception $e) {
            // Log el error para análisis
            \Log::error('Error al crear el Branch: ' . $e->getMessage());

            // Redirige con un mensaje de error al usuario
            return redirect()->back()
                ->with('message', 'An error occurred while creating the Branch.')
                ->with('icon', 'error')
                ->withInput(); // Retorna los valores ingresados
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Branch $branch)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $branch = Branch::findOrFail($id);
        $countries = Country::pluck('name', 'id');
        $states = State::where('country_id', $branch->country_id)->pluck('name', 'id');
        return view('pages.branches.edit', compact('branch', 'countries', 'states'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        try {
            // Validación de los datos
            $validated = $request->validate([
                'name' => 'required|string|max:255',
                'email' => 'nullable|email|max:255',
                'responsible_mobile' => 'nullable|string|max:15',
                'country_id' => 'required|integer',
                'state_id' => 'required|integer',
                'area_id' => 'nullable|integer',
                'address' => 'required|string|max:255',
            ]);

            // Encontrar y actualizar la rama con los datos validados
            $branch = Branch::findOrFail($id);
            $branch->update($validated);
            return redirect()->route('pages.branches.index')
                ->with('message', 'Branch updated successfully.')
                ->with('icon', 'success');
        } catch (\Exception $e) {
            // Log el error para análisis
            \Log::error('Error al crear el Branch: ' . $e->getMessage());

            // Redirige con un mensaje de error al usuario
            return redirect()->back()
                ->with('message', 'An error occurred while updating the Branch.')
                ->with('icon', 'error')
                ->withInput(); // Retorna los valores ingresados

        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $branch = Branch::findOrFail($id);
        $branch->delete();
        return redirect()->route('pages.branches.index')
        ->with('success', 'Branch deleted successfully.');
    }
}
