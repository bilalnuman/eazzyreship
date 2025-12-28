<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Client;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Illuminate\View\View;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use App\Models\Country;
use App\Models\Branch;

class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     */
    public function create(): View
    {
        $branches = Branch::with('country:id,iso2')
            ->whereNotIn('id', [6])
            ->get();

        return view('auth.register', compact('branches'));
    }

    /**
     * Handle an incoming registration request.
     */
    public function store(Request $request): RedirectResponse
    {
        $request->validate([
            'name'        => ['required', 'string', 'max:255'],
            'email'       => ['required', 'string', 'lowercase', 'email', 'max:255', 'unique:users,email'],
            'password'    => ['required', 'confirmed', Rules\Password::defaults()],
            'mobile'      => ['required', 'string'],
            'dialCode'    => ['required', 'string'],
            'branch_id'   => ['required', 'integer'],
            'branch_code' => ['required', 'string'],
        ]);

        // Create user
        $user = User::create([
            'name'     => $request->name,
            'email'    => $request->email,
            'password' => Hash::make($request->password),
            'role'     => '4',
        ]);

        if ($user) {
            $user->assignRole('user');
        }

        // Create client
        $client = Client::create([
            'code'      => '1',
            'user_id'   => $user->id,
            'name'      => $request->name,
            'email'     => $request->email,
            'mobile'    => $request->dialCode,
            'branch_id' => $request->branch_id,
        ]);

        $client->update(['code' => $request->branch_code . $client->id]);


        /**
         * ********************************************
         * FIXED — API CALL MOVED TO BACKGROUND
         * ********************************************
         */
        $userData = [
            'id'     => $user->id,
            'name'   => $request->name,
            'email'  => $request->email,
            'address'=> "",
            'branch' => $request->branch_code,
        ];

        dispatch(function () use ($userData) {
            try {
                Http::timeout(10)
                    ->retry(2, 2000)
                    ->post('https://shopandtake-9dcc127c6236.herokuapp.com/tekcore/registerLocation', $userData);
            } catch (\Exception $e) {
                Log::error('User Register API Error: ' . $e->getMessage());
            }
        });


        // Fire event
        event(new Registered($user));

        // Login user
        Auth::login($user);

        return redirect(route('dashboard', absolute: false));
    }

    protected function parsePhoneNumber($phone)
    {
        preg_match('/^\+(\d{1,4})(.*)$/', $phone, $matches);

        return [
            'country_code' => $matches[1] ?? null,
            'number'       => trim($matches[2] ?? ''),
        ];
    }
}
