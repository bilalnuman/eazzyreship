<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class ContactController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'subject' => 'required|string|max:255',
            'message' => 'required|string|max:1000',
        ]);

        // Opcional: Lógica para enviar correo o guardar en la base de datos
        // Aquí mostramos cómo enviar un correo simple
        Mail::raw($request->message, function ($mail) use ($request) {
            $mail->to('info@eazzyreship.com') // Cambia esto a tu correo
                 ->from('no-reply@eazzyreship.com', 'client') // Remitente genérico
                 ->replyTo($request->email, $request->name) // Permite responder al usuario
                 ->subject($request->subject);
        });

        return response()->json(['success' => 'Thank you for your message!']);
    }
}