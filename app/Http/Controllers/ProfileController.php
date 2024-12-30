<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProfileUpdateRequest;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;

class ProfileController extends Controller
{
    /**
     * Display the user's profile form.
     */
    public function edit(Request $request): View
    {
        return view('profile.edit', [
            'user' => $request->user(),
        ]);
    }

    /**
     * Update the user's profile information.
     */
    public function update(ProfileUpdateRequest $request): RedirectResponse
    {
        /*$request->user()->fill($request->validated());

        if ($request->user()->isDirty('email')) {
            $request->user()->email_verified_at = null;
        }
        $request->user()->save();*/


        $user = $request->user();
        // Rellenar los datos del usuario con los datos validados
        $user->fill($request->validated());
        // Verificar si el email ha cambiado
        if ($user->isDirty('email')) {
            // Si el email cambió, se restablece la verificación
            $user->email_verified_at = null;
            // Actualizar el email del cliente relacionado, si existe
            if ($user->client) {
                $user->client->update([
                    'email' => $user->email,
                ]);
            }
        }
        // Guardar los cambios en el usuario
        $user->save();
        // Actualizar el nombre del cliente relacionado con el usuario
        if ($user->client) {
            // Actualizar el nombre del cliente al nombre del usuario
            $user->client->update([
                'name' => $user->name,
            ]);
        }

        return Redirect::route('profile.edit')->with('status', 'profile-updated');
    }

    /**
     * Delete the user's account.
     */
    public function destroy(Request $request): RedirectResponse
    {
        $request->validateWithBag('userDeletion', [
            'password' => ['required', 'current_password'],
        ]);

        $user = $request->user();

        Auth::logout();

        $user->delete();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return Redirect::to('/');
    }
}
