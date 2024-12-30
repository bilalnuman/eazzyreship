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
use Illuminate\Support\Facades\DB;
use App\Models\Country;
use App\Models\Branch;

class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     */
    public function create(): View
    {
       // $branchCountryIds = Branch::pluck('country_id')->unique()->toArray();
        //$countries = Country::whereIn('id', [250, 8, 185, 189, 185])->get();

        $branches = Branch::with('country:id,iso2')
        ->whereNotIn('id', [6])
        ->get();

        /*$countries = Country::whereIn('id', $branchCountryIds)
        ->whereNotIn('id', [233]) // Excluir el ID 250 (o los IDs que quieras)
        ->get();*/
        return view('auth.register', compact('branches'));
    }

    /**
     * Handle an incoming registration request.
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request): RedirectResponse
    {
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'lowercase', 'email', 'max:255', 'unique:'.User::class],
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
            'mobile' => ['required', 'string', 'regex:/^\+\d{1,4}[-.\s]?\(?\d{1,4}\)?[-.\s]?\d{1,4}[-.\s]?\d{1,9}$/'],
            'branch_id' => ['required', 'integer'], 
            'branch_code' => ['required', 'string'],
        ]);
        
        //$parsedPhone = $this->parsePhoneNumber($request->phone);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'role' => '4',
        ]);

        if ($user) {
            $user->assignRole('user');
        }


        $client = Client::create([
            'code' => '1',
            'user_id' => $user->id,
            'name' => $request->name,
            'email' => $request->email,
            'mobile' => $request->mobile,
            'branch_id' => $request->branch_id,
        ]);

        $client->update(['code' => $request->branch_code . $client->id]);
        
        $userData = [
        'id' => $user->id,
        'name' => $request->name,
        'email' => $request->email,
        'address' => "",
        'branch' => $request->branch_code,
        ];
        
        //Http::post('https://shopandtake-9dcc127c6236.herokuapp.com/tekcore/registerLocation', $userData);

        event(new Registered($user));

        Auth::login($user);

        return redirect(route('dashboard', absolute: false));
    }

    protected function parsePhoneNumber($phone)
    {
        preg_match('/^\+(\d{1,4})(.*)$/', $phone, $matches);

        return [
            'country_code' => $matches[1] ?? null,   // Código de área
            'number' => trim($matches[2] ?? ''),    // Número restante, limpio de espacios
        ];
    }
}
