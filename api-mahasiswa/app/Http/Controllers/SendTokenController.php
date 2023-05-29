<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Mail\SendToken;
use Illuminate\Http\Request;
use App\Traits\HttpResponses;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

class SendTokenController extends Controller
{
    use HttpResponses;

    public function index() 
    {
        return view('get-token');
    }

    public function sendToken(Request $request)
    {
        $validator = $request->validate([
            'email' => 'required|email:dns',
            'name' => 'required|min:3|max:100',
            'purpose' => 'required|min:8'
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->email)
        ]);
        

        $data = [
            'message' => 'Token berhasil di-generate',
            'user' => $user,
            'token' => $user->createToken('API Token of ' . $user->name)->plainTextToken
        ];

        Mail::to($user->email)->send(new SendToken($data));

        return redirect('generate-token')->with('success', 'Token berhasil dikirim ke email '.$user->email);
        
        // return $this->success([
        //     'user' => $user,
        //     'token' => $user->createToken('API Token of ' . $user->name)->plainTextToken
        // ]);
        
    }
}
